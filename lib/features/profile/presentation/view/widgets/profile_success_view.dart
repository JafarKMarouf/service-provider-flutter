import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/functions/input_validate.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_datum.dart';
import 'package:freelancer_app/features/profile/presentation/view/widgets/profile_form.dart';
import 'package:get/get.dart' as g;
import 'custome_profile_bar.dart';

class ProfileSuccessView extends StatelessWidget {
  final List<CustomerInfos> customerInfo;
  const ProfileSuccessView({super.key, required this.customerInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomeProfileBar(
          title: '${customerInfo[0].user!.name}',
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).logout();
            Future.delayed(
              const Duration(seconds: 3),
              () {
                g.Get.offAll(
                  () => const LoginView(),
                  transition: g.Transition.fadeIn,
                  duration: kDurationTransition,
                );
              },
            );
          },
        ),
        const AspectRatio(aspectRatio: 8),
        ProfileForm(customerInfo: customerInfo),
      ],
    );
  }
}
