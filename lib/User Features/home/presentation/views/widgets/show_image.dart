import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({
    super.key,
    required this.image,
    required this.startingIndex,
  });
  final List image;
  final int startingIndex;
  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  int _selectedIndex = 0;
  late final PageController _pageController =
      PageController(initialPage: _selectedIndex);

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.startingIndex;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 4, vertical: blockHeight * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: blockHeight * 50,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.image.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Image.asset(
                          widget.image[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: blockHeight * 5,
              ),
              Text(
                '${(_selectedIndex + 1).toString()}/${widget.image.length.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: blockHeight * 5,
              ),
              SizedBox(
                height: blockHeight * 20,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.image.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: blockWidth * 3),
                      child: GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                          child: _selectedIndex == index
                              ? Container(
                                  height: blockHeight * 10,
                                  width: blockWidth * 12,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: kGreenColor,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    widget.image[index],
                                  ),
                                )
                              : Image.asset(
                                  widget.image[index],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
