import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: height * .5,
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
                height: height * .05,
              ),
              Text(
                '${(_selectedIndex + 1).toString()}/${widget.image.length.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              SizedBox(
                height: height * .2,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.image.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    widget.image[index],
                                  ),
                                )
                              : Image.asset(
                                  widget.image[index],
                                ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
