import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Reaction { Like, Love, Laugh, Sad, Angry, Wow, none }

typedef OnButtonPressedCallback = void Function(Reaction newReaction);

class ReactionButton extends StatefulWidget {
  const ReactionButton({
    super.key,
    this.initialReaction,
    this.onReactionChanged,
  });

  final Reaction? initialReaction;
  final OnButtonPressedCallback? onReactionChanged;

  @override
  State<ReactionButton> createState() => _ReactionButtonState();
}

class _ReactionButtonState extends State<ReactionButton> {
  Reaction _reaction = Reaction.none;
  bool _reactionView = false;

  GlobalKey btnKey = GlobalKey();
  final List<ReactionElement> reactions = [
    ReactionElement(
      Reaction.Like,
      const Icon(
        Icons.thumb_up_off_alt_rounded,
        color: Colors.blue,
        size: 18,
      ),
    ),
    ReactionElement(
      Reaction.Love,
      const Icon(
        Icons.favorite,
        color: Colors.red,
        size: 18,
      ),
    ),
    ReactionElement(
      Reaction.Laugh,
      const Icon(
        FontAwesomeIcons.solidFaceLaugh,
        color: Color.fromRGBO(243, 172, 67, 1),
        size: 18,
      ),
    ),
    ReactionElement(
      Reaction.Sad,
      const Icon(
        FontAwesomeIcons.solidFaceSadTear,
        color: Colors.teal,
        size: 18,
      ),
    ),
    ReactionElement(
      Reaction.Angry,
      const Icon(
        FontAwesomeIcons.solidFaceAngry,
        color: Colors.redAccent,
        size: 18,
      ),
    ),
    ReactionElement(
      Reaction.Wow,
      const Icon(
        FontAwesomeIcons.solidFaceSurprise,
        color: Color.fromARGB(255, 231, 62, 119),
        size: 18,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _reaction = widget.initialReaction ?? Reaction.none;
    setState(() {});
  }

  late OverlayEntry overlayEntry;

  void onCloseOverlay() {
    overlayEntry.remove();
  }

  void _showReactionPopUp(BuildContext context, Offset tapPosition) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double left = tapPosition.dx;
    if ((screenWidth - left) < 100) {
      left = left - 100;
    } else {
      left = left - 20;
    }
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: left,
        top: tapPosition.dy - 60,
        child: Material(
          child: Container(
            height: screenHeight * .04,
            width: screenWidth * .4,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reactions.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 15 + index * 15,
                    child: FadeInAnimation(
                      child: IconButton(
                        onPressed: () {
                          if (mounted) {
                            setState(() {
                              _reaction = reactions[index].reaction;
                              if (widget.onReactionChanged != null) {
                                widget.onReactionChanged!(_reaction);
                              }
                              _reactionView = false;
                            });
                          }
                          onCloseOverlay();
                        },
                        icon: ReactionIcon(reaction: reactions[index].reaction),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _showReactionPopUp(context, details.globalPosition);
        setState(() {
          _reactionView = true;
        });
      },
      onTap: () {
        if (_reactionView) {
          onCloseOverlay();
          _reactionView = false;
        } else {
          if (_reaction == Reaction.none) {
            _reaction = Reaction.Like;
            if (widget.onReactionChanged != null) {
              widget.onReactionChanged!(_reaction);
            }
          } else {
            _reaction = Reaction.none;
            if (widget.onReactionChanged != null) {
              widget.onReactionChanged!(_reaction);
            }
          }
        }
        setState(() {});
      },
      child: ReactionIcon(reaction: _reaction),
    );
  }
}

class ReactionIcon extends StatelessWidget {
  const ReactionIcon({super.key, required this.reaction});

  final Reaction reaction;

  @override
  Widget build(BuildContext context) {
    switch (reaction) {
      case Reaction.Like:
        return const Icon(
          Icons.thumb_up_off_alt_rounded,
          color: Colors.blue,
          size: 18,
        );
      case Reaction.Love:
        return const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 18,
        );
      case Reaction.Laugh:
        return const Icon(
          FontAwesomeIcons.solidFaceSmile,
          color: Color.fromRGBO(243, 172, 67, 1),
          size: 18,
        );
      case Reaction.Sad:
        return const Icon(
          FontAwesomeIcons.solidFaceSadTear,
          color: Colors.teal,
          size: 18,
        );
      case Reaction.Angry:
        return const Icon(
          FontAwesomeIcons.solidFaceAngry,
          color: Colors.redAccent,
          size: 18,
        );
      case Reaction.Wow:
        return const Icon(
          FontAwesomeIcons.solidFaceSurprise,
          color: Color.fromARGB(255, 231, 62, 119),
          size: 18,
        );
      case Reaction.none:
        return const Icon(
          Icons.thumb_up_off_alt_rounded,
          color: Colors.grey,
          size: 18,
        );
    }
  }
}

class ReactionElement {
  final Reaction reaction;
  final Icon icon;

  ReactionElement(this.reaction, this.icon);
}
