import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:shimmer/shimmer.dart';

class BookServiceType extends StatelessWidget {
  final DatumBooked data;

  const BookServiceType({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.sizeOf(context).width / 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xffF5F5F5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kPrimaryColor,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: '${data.service!.photo}',
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${data.service!.serviceName}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins SemiBold',
                  color: Color(0xff0F0E0E),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${data.expert!.price} ل.س',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff0ABA31),
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
