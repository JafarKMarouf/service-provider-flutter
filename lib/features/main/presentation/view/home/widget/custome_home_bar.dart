import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_datum.dart';
import 'package:shimmer/shimmer.dart';

class CustomeHomeBar extends StatelessWidget {
  final bool loading;
  final CustomerInfos? customerInfos;
  const CustomeHomeBar({
    super.key,
    this.customerInfos,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        !loading
            ? SvgPicture.asset(AppImages.notificationsvg, height: 35)
            : Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  !loading
                      ? const Text(
                          'مرحبا',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 30,
                            height: 10,
                            color: Colors.white,
                          ),
                        ),
                  const SizedBox(height: 3),
                  !loading
                      ? Text(
                          customerInfos!.user!.name!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        )
                      : Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 70,
                            height: 15,
                            color: Colors.white,
                          ),
                        ),
                ],
              ),
              const SizedBox(width: 5),
              !loading
                  ? SizedBox(
                      width: 70.0,
                      height: 70.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: customerInfos!.photo!,
                          placeholder: (context, url) {
                           return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: MediaQuery.sizeOf(context).width / 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: kPrimaryColor,
                                ),
                              ),
                            );
                          } ,
                          errorWidget: (context, url, error) {
                            return Image.asset(AppImages.profile);
                          },
                        ),
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Container(
                          color: Colors.white,
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
            ],
          ),
        )
      ],
    );
  }
}
