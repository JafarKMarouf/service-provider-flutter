import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/payment/presentation/view_models/payment_cubit.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PaymentCubit>(context);
    return Form(
      key: cubit.formKeyPayment,
      autovalidateMode: cubit.autoValidatePayment,
      child: Column(
        children: [
          const CustomeText(
            text: 'أدخل رقم عملية التحويل وقم بإضافة المبلغ',
            size: 18,
            fontFamily: 'Poppins Medium',
          ),
          const SizedBox(height: 24),
          CustomeTextFormField(
            type: TextInputType.number,
            hintText: 'أدخل المبلغ',
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          CustomeTextFormField(
            type: TextInputType.number,
            hintText: 'أدخل المبلغ مجددا للتأكيد',
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          CustomeTextFormField(
            type: TextInputType.number,
            hintText: 'أدخل رقم عملية التحويل',
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          CustomeTextFormField(
            type: TextInputType.number,
            hintText: 'أدخل رقم عملية التحويل للتأكيد',
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          const Expanded(flex: 3, child: SizedBox()),
          CustomButton(
            title: 'إتمام الدفع',
            width: MediaQuery.sizeOf(context).width,
            color: kPrimaryColor,
            onTap: () {
              if (cubit.formKeyPayment.currentState!.validate()) {
                cubit.addPayment(body: {});
              } else {
                cubit.autoValidatePayment = AutovalidateMode.always;
              }
            },
          ),
        ],
      ),
    );
  }
}
