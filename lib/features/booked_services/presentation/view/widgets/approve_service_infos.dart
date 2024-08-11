import 'package:flutter/material.dart';
import 'custome_style_service_infos.dart';

class ApproveServiceInfo extends StatelessWidget {
  const ApproveServiceInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomeStyleServiceInfos(
          title: 'اسم الفريلانسر : ',
          info: 'هشام حداد',
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: 'اسم الخدمة : ',
          info: 'تصليح مكيفات',
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: 'تاريخ الحجز : ',
          info: '2023/08/09',
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: 'تاريخ الخدمة : ',
          info: '2023/08/15',
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: ' وقت بداية الخدمة : ',
          info: '06 مساء‘',
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: ' وقت إكمال الخدمة : ',
          info: '08 مساء‘',
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: ' رسوم الخدمة مكتملة : ',
          info: '9000 ل.س',
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: ' الوصف : ',
          info:
              'لقد قمت بفحص المكيف وهو بحاجة لقد قمت بفحص المكيف ثم قمت بتصليحه وقمت باضافة المعدات وغيرها من القطع اللازمة له فقد كانت المشكلة الأكبر تكمن في المراوح والمبرد وأصلحته جيدا ولا يعاني من أي مشكلة الان',
        ),
        SizedBox(
          height: 12,
        ),
        CustomeStyleServiceInfos(
          title: " جودة الخدمة :",
          rating: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: " سرعة العمل :",
          rating: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: " الدقة :",
          rating: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: " السعر :",
          rating: true,
        ),
        SizedBox(
          height: 6,
        ),
        CustomeStyleServiceInfos(
          title: " تجربة التطبيق :",
          rating: true,
        ),
        SizedBox(
          height: 24,
        ),
        // OpinionForm(),
        SizedBox(
          height: 24,
        ),
        // CustomeStyleServiceInfos(
        //   title: ' حالة المكيف قبل الإصلاح : ',
        //   image3: 'assets/images/img_rectangle_17_108x145.png',
        //   image2: 'assets/images/img_rectangle_18.png',
        //   image1: 'assets/images/img_rectangle_17.png',
        // ),
        SizedBox(
          height: 6,
        ),
        // CustomeStyleServiceInfos(
        //   title: ' حالة المكيف بعد الإصلاح : ',
        //   image3: 'assets/images/img_rectangle_17_108x145.png',
        //   image2: 'assets/images/img_rectangle_18.png',
        //   image1: 'assets/images/img_rectangle_17.png',
        // ),
      ],
    );
  }
}
