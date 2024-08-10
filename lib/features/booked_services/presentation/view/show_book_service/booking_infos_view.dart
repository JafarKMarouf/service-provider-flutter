import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/show_book_service/widget/book_service_type.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/update_book_service/update_book_service_view.dart';
import 'package:get/get.dart';
import 'widget/custome_book_service_infos.dart';

class BookingInfosView extends StatelessWidget {
  final DatumBooked data;

  const BookingInfosView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var formatTime = data.deliveryTime!;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            const AspectRatio(aspectRatio: 17),
            const CustomeServiceBar(title: "معلومات الحجز"),
            Expanded(flex: 2, child: BookServiceType(data: data)),
            const SizedBox(height: 16),
            Expanded(
              child: CustomeInfosServiceItems(
                location: data.location,
                phone: data.expert!.mobile,
                time: formatTime,
                timeTapped: true,
                locationTapped: true,
                phoneTapped: true,
              ),
            ),
            Expanded(flex: 2, child: CustomeBookServiceInfo(data: data)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              CustomButton(
                title: 'تعديل الحجز',
                onTap: (){
                  Get.to(()=>const UpdateBookServiceView());
                },
                width: MediaQuery.of(context).size.width/3,
              ),
              CustomButton(
                title: 'حذف حجز الخدمة',
                onTap: () {},
                width: MediaQuery.of(context).size.width/3,
              ),
            ],),

          ],
        ),
      ),
    );
  }
}
