import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_datum.dart';
import 'package:shimmer/shimmer.dart';

class ServiceType extends StatelessWidget {
  final ServiceDatum data;
  const ServiceType({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xffF5F5F5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kPrimaryColor,
                ),
                child: CachedNetworkImage(
                  imageUrl: '${data.photo}',
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${data.serviceName}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins SemiBold',
                color: Color(0xff0F0E0E),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${data.expert!.first.price} ل.س',
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
    );
  }
}
