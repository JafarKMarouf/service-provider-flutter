import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_shadow.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';

class CustomeDialog extends StatelessWidget {
  const CustomeDialog({
    super.key,
    required this.message,
  });
  final dynamic message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0, end: 24),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(AppImages.sadsvg),
                  CustomeText(
                    text: message,
                    size: 18,
                    color: const Color(0xff252525),
                  ),
                ],
              ),
              builder: (context, value, child) {
                return Container(
                  padding: EdgeInsets.only(top: value),
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      customeShadow(
                        color: kPrimaryColor,
                        spread: 1,
                        blur: 20,
                        offset: const Offset(1.5, 1.5),
                      ),
                    ],
                    color: const Color(0xffFFFDFD),
                  ),
                  child: child,
                );
              }),
        ),
      ),
    );
  }
}
