import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/booked_services_list_view.dart';
import 'package:freelancer_app/features/main/presentation/view/home/home_view.dart';
import 'package:freelancer_app/features/profile/presentation/view/profile_view.dart';
import 'package:freelancer_app/features/payment/presentation/view/payment_log.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomeNavBar extends StatefulWidget {
  const CustomeNavBar({super.key});

  @override
  State<CustomeNavBar> createState() => _CustomeNavBarState();
}

class _CustomeNavBarState extends State<CustomeNavBar> {
  List<Widget> screens = const [
    ProfileView(),
    PaymentLog(),
    BookedServicesListView(),
    HomeView(),
  ];

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          selectedIndex: currentIndex,
          color: Colors.grey.shade700,
          tabBackgroundColor: kPrimaryColor,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          gap: 20,
          onTabChange: (val) => setState(() {
            currentIndex = val;
          }),
          tabs: const [
            GButton(
              icon: Icons.person,
              text: 'الملف الشخصي',
              iconSize: 32,
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.payment_outlined,
              text: 'السجل',
              iconSize: 32,
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.task_alt,
              text: 'الخدمات المحجوزة',
              iconSize: 32,
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.home,
              text: 'الرئيسية',
              iconSize: 32,
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
