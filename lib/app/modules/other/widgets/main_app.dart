// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:tindex_mobile/app/modules/other/constants/color_constants.dart';
import 'package:tindex_mobile/app/modules/other/constants/global_constants.dart';

class MainApp extends StatefulWidget {
  static const String route = '/main-app';
  int currentPage;
  MainApp({
    Key? key,
    this.currentPage = 0,
  }) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  PageController pageController = PageController();
  void updatePage(int page) {
    setState(() {
      widget.currentPage = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //backgroundColor: Colors.transparent,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            widget.currentPage = page;
          });
        },
        children: const [
          // HomeScreen(),
          // TransactionsScreen(),
          // ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: heightValue25,
          left: value20,
          right: value20,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(heightValue20),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: widget.currentPage,
            selectedItemColor: Colors.white,
            unselectedItemColor: greyScale500,
            backgroundColor: defaultAppColor,
            iconSize: heightValue35,
            onTap: updatePage,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: heightValue15),
                  child: Image.asset(
                    "assets/icons/home_icon.png",
                    height: heightValue30,
                    color: widget.currentPage == 0 ? whiteColor : greyScale600,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: heightValue15),
                  child: Image.asset(
                    "assets/icons/transactions_icon.png",
                    height: heightValue35,
                    color: widget.currentPage == 1 ? whiteColor : greyScale600,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: heightValue15),
                  child: Image.asset(
                    "assets/icons/profile_icon.png",
                    height: heightValue33,
                    color: widget.currentPage == 2 ? whiteColor : greyScale600,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
