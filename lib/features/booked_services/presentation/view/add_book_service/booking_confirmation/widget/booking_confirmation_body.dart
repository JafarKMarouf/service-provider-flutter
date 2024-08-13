import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/booking_confirmation/widget/add_notes_for_book.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/confirmed_booked.dart';
import 'package:shimmer/shimmer.dart';

class BookingConfirmationBody extends StatelessWidget {
  const BookingConfirmationBody({super.key, required this.booked});
  final DatumBooked? booked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kPrimaryColor,
              ),
              child: CachedNetworkImage(
                  imageUrl: '${booked!.service!.photo}',
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.error,
                      color: Colors.white,
                      size: 45,
                    );
                  }),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .65,
              child: ConfirmedBooked(booked: booked!),
            ),
          ],
        ),
        const AddNotesBook(),
      ],
    );
  }
}
