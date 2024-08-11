import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/payment/presentation/view/widgets/payment_form.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 14, bottom: 24, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AspectRatio(aspectRatio: 12),
            CustomeServiceBar(title: 'عملية الدفع'),
            AspectRatio(aspectRatio: 12),
            CustomeText(
              text:
                  'قم بدفع رسوم الخدمة التي قمت بحجزها إلى حساب التاجر الدفع اليدوي:'
                  ' 0992260530'
                  ' ثم اكتب رقم عملية التحويل '
                  '\n\n💡لا تُقبل عمليات تحويل الرصيد (وحدات)، سيرتيل كاش حصراً.',
              size: 16,
              weight: FontWeight.w800,
            ),
            Expanded(flex: 1, child: SizedBox()),
            PaymentForm(),
          ],
        ),
      ),
    );
  }
}
