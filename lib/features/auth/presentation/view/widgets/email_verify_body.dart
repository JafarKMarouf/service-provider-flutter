import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_verify_bar.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/otp_form.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/resend_code.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:get/get.dart' as g;
import 'package:get/route_manager.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EmailVerifyBody extends StatelessWidget {
  const EmailVerifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          cubit.loadingVerify = true;
        } else if (state is AuthFailure) {
          cubit.loadingVerify = false;
          Get.snackbar('failed', state.errorMessage);
        } else if (state is AuthSuccess) {
          cubit.loadingVerify = false;
          Get.snackbar('success', state.userModel.message!);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: cubit.loadingVerify,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AspectRatio(aspectRatio: 12),
                const CustomeVerifyBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'أدخل رمز التحقق المكون من 6 أرقام والذي تم إرساله إلى بريدك الإلكتروني.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w600,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      const OtpConfirmForm(),
                      const SizedBox(height: 24),
                      const ResendCode(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
