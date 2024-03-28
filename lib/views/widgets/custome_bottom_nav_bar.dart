import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/views/screens/booked_service_view.dart';
import 'package:freelancer_app/views/screens/profile_view.dart';
import 'package:freelancer_app/views/screens/home_view.dart';
import 'package:freelancer_app/views/screens/settings.dart';
import 'package:freelancer_app/views/screens/bookmark_view.dart';

class CustomeBottomNavBar extends StatefulWidget {
  const CustomeBottomNavBar({super.key});

  @override
  State<CustomeBottomNavBar> createState() => _CustomeBottomNavBarState();
}

class _CustomeBottomNavBarState extends State<CustomeBottomNavBar> {
  List<Widget> screens = const [
    ProfileView(),
    SettingsView(),
    BookedServiceView(),
    BookmarkView(),
    HomeView(),
  ];

  int currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 0,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        selectedItemColor: kPrimaryColor,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_lock.svg',
              width: 24,
              height: 30,
              colorFilter:
              const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_search.svg',
              width: 24,
              height: 30,
              colorFilter:
                  const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'settings',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_settings.svg',
              width: 24,
              height: 30,
              colorFilter:
                  const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'booked',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_bookmark_primary.svg',
              width: 24,
              height: 30,
              colorFilter:
                  const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'bookmark',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_settings_gray_300.svg',
              width: 24,
              height: 30,
              colorFilter:
                  const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'home',
          ),
        ],
      ),
      body: screens[currentIndex],
      // bottomNavigationBar: Container(
      //   color: kPrimaryColor,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: GNav(
      //       color: const Color(0xff252525),
      //       activeColor: kPrimaryColor,
      //       selectedIndex: currentIndex,
      //       tabBackgroundColor: Colors.white,
      //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),            // gap: 10,
      //       onTabChange: (val) => {
      //         setState(() {
      //           currentIndex = val;
      //         }),
      //       },
      //
      //       tabs:   [
      //         GButton(icon: Icons.person,),
      //         GButton(icon: Icons.settings,),
      //         // SvgAssetLoader('assets/images/img_settings.svg'),
      //         GButton(icon: Icons.bookmark,),
      //         GButton(icon: Icons.home),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
