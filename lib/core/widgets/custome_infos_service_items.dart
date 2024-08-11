import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service.dart';

class CustomeInfosServiceItems extends StatelessWidget {
  final String? time;
  final void Function()? onPressedTime;
  final bool timeTapped;

  final String? location;
  final void Function()? onPressedLocation;
  final bool locationTapped;

  final String? date;
  final void Function()? onPressedDate;
  final bool dateTapped;

  final String? phone;
  final bool phoneTapped;

  const CustomeInfosServiceItems({
    super.key,
    this.date,
    this.time,
    this.location,
    this.phone,
    this.onPressedDate,
    this.onPressedTime,
    this.onPressedLocation,
    this.dateTapped = false,
    this.timeTapped = false,
    this.locationTapped = false,
    this.phoneTapped = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            date != null
                ? Expanded(
                    child: CustomeInfosService(
                      text: date!,
                      image: AppImages.calender,
                      onPressed: onPressedDate,
                      tapped: dateTapped,
                    ),
                  )
                : Container(),
            time != null
                ? Expanded(
                    child: CustomeInfosService(
                      text: time!,
                      image: AppImages.time,
                      onPressed: onPressedTime,
                      tapped: timeTapped,
                    ),
                  )
                : Container(),
          ],
        ),
        const SizedBox(height: 2),
        phone != null
            ? CustomeInfosService(
                text: phone!,
                image: AppImages.phone,
                tapped: phoneTapped,
              )
            : Container(),
        const SizedBox(height: 2),
        location != null
            ? CustomeInfosService(
                image: AppImages.location,
                text: location!,
                tapped: locationTapped,
                onPressed: onPressedLocation,
              )
            : Container(),
      ],
    );
  }
}
