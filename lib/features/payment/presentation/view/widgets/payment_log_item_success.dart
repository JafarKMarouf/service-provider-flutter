import 'package:flutter/material.dart';
import 'package:freelancer_app/features/payment/data/models/payment/payment_datum.dart';

class PaymentLogItemSuccess extends StatelessWidget {
  const PaymentLogItemSuccess({super.key, required this.payments});
  final PaymentDatum payments;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${payments.createdAt}'),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${payments.operationNumber}'),
              const Text(
                '  :رقم  عملية التحويل',
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('إلى:  ${payments.bookservice!.expert!.mobile}'),
              Text('من:  ${payments.bookservice!.customer!.mobile}'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${payments.amount}'),
              const Text('  :المبلغ المدفوع'),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '${payments.status}',
            // style: TextStyle(),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
