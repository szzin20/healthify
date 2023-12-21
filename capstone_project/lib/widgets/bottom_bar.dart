// ignore_for_file: deprecated_member_use

import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/screens/bottom_bar/inherited_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatefulWidget {
  final Widget child;
  final int currentScreen;
  final TabController tabController;
  final Color selectedColor;
  final Color unselectedColor;
  final Color barColor;
  final double end;
  final double start;
  const BottomBar({
    required this.child,
    required this.currentScreen,
    required this.tabController,
    required this.selectedColor,
    required this.unselectedColor,
    required this.barColor,
    required this.end,
    required this.start,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  ScrollController scrollBottomBarController = ScrollController();
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isScrollingDown = false;
  bool isOnTop = true;

  @override
  void initState() {
    myScroll();
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, widget.end),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.forward();
  }

  void showBottomBar() {
    if (mounted) {
      setState(() {
        _controller.forward();
      });
    }
  }

  void hideBottomBar() {
    if (mounted) {
      setState(() {
        _controller.reverse();
      });
    }
  }

  Future<void> myScroll() async {
    scrollBottomBarController.addListener(() {
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          isOnTop = false;
          hideBottomBar();
        }
      }
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          isOnTop = true;
          showBottomBar();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollBottomBarController.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        InheritedDataProvider(
          scrollController: scrollBottomBarController,
          child: widget.child,
        ),
        Positioned(
          bottom: widget.start,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width: isOnTop == true ? 0 : 40,
            height: isOnTop == true ? 0 : 40,
            decoration: BoxDecoration(
              color: ThemeColor().primaryFrame,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        scrollBottomBarController
                            .animateTo(
                          scrollBottomBarController.position.minScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        )
                            .then((value) {
                          if (mounted) {
                            setState(() {
                              isOnTop = true;
                              isScrollingDown = false;
                            });
                          }
                          showBottomBar();
                        });
                      },
                      icon: Icon(
                        Icons.arrow_upward_rounded,
                        color: ThemeColor().white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: widget.start,
          child: SlideTransition(
            position: _offsetAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: Material(
                    color: widget.barColor,
                    child: TabBar(
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                      indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                      controller: widget.tabController,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: ThemeColor().primaryFrame,
                          width: 4,
                        ),
                        insets: EdgeInsets.fromLTRB(
                            18, 0, 18, MediaQuery.of(context).size.width * .18),
                      ),
                      tabs: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.currentScreen == 0
                                ? MediaQuery.of(context).size.height * .015
                                : MediaQuery.of(context).size.height * .028,
                          ),
                          child: SizedBox(
                            height: 55,
                            width: 40,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/bottom_bar/home_icon.svg',
                                  color: widget.currentScreen == 0
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: widget.currentScreen == 0
                                        ? ThemeColor().primaryFrame
                                        : widget.unselectedColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.currentScreen == 1
                                ? MediaQuery.of(context).size.height * .01
                                : MediaQuery.of(context).size.height * .02,
                          ),
                          child: SizedBox(
                            height: 55,
                            width: 40,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/bottom_bar/dokter_icon.svg',
                                  color: widget.currentScreen == 1
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                                Text(
                                  'Dokter',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: widget.currentScreen == 1
                                        ? ThemeColor().primaryFrame
                                        : widget.unselectedColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.currentScreen == 2
                                ? MediaQuery.of(context).size.height * .01
                                : MediaQuery.of(context).size.height * .02,
                          ),
                          child: SizedBox(
                            height: 55,
                            width: 40,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/bottom_bar/riwayat_icon.svg',
                                  color: widget.currentScreen == 2
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                                Text(
                                  'Riwayat',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: widget.currentScreen == 2
                                        ? ThemeColor().primaryFrame
                                        : widget.unselectedColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.currentScreen == 3
                                ? MediaQuery.of(context).size.height * .018
                                : MediaQuery.of(context).size.height * .028,
                          ),
                          child: SizedBox(
                            height: 55,
                            width: 40,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/bottom_bar/artikel_icon.svg',
                                  color: widget.currentScreen == 3
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                                Text(
                                  'Artikel',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: widget.currentScreen == 3
                                        ? ThemeColor().primaryFrame
                                        : widget.unselectedColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.currentScreen == 4
                                ? MediaQuery.of(context).size.height * .01
                                : MediaQuery.of(context).size.height * .018,
                          ),
                          child: SizedBox(
                            height: 55,
                            width: 40,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/bottom_bar/akun_icon.svg',
                                  color: widget.currentScreen == 4
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                                Text(
                                  'Akun',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: widget.currentScreen == 4
                                        ? ThemeColor().primaryFrame
                                        : widget.unselectedColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
