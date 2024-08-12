import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:freelancer_app/features/payment/presentation/view_models/payment_cubit.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({
    super.key,
    required this.bookServiceId,
    required this.expertId,
  });
  final int bookServiceId;
  final int expertId;
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
            customController: cubit.amountController,
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
            customController: cubit.amountController,
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
            customController: cubit.operationNumberController,
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
            customController: cubit.operationNumberController,
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
          ),
          const AspectRatio(aspectRatio: 7),
          CustomButton(
            title: 'إتمام الدفع',
            width: MediaQuery.sizeOf(context).width,
            color: kPrimaryColor,
            onTap: () {
              paymentOperation(cubit);
              BlocProvider.of<BookServiceCubit>(context)
                  .updateStatusBooked(id: bookServiceId);
            },
          ),
        ],
      ),
    );
  }

  void paymentOperation(PaymentCubit cubit) {
    if (cubit.formKeyPayment.currentState!.validate()) {
      cubit.addPayment(
        body: {
          'book_service_id': bookServiceId,
          'payment_expert_id': expertId,
          'amount': cubit.amountController.text,
          'operation_number': cubit.operationNumberController.text,
        },
      );
    } else {
      cubit.autoValidatePayment = AutovalidateMode.always;
    }
  }
}
