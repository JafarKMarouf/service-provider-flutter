import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PaymentLogItemLoading extends StatelessWidget {
  const PaymentLogItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.only(right: 2, left: 4, top: 8, bottom: 2),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
