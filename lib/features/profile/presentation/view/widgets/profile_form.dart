import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/functions/input_validate.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_datum.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key, required this.customerInfo});
  final List<CustomerInfos> customerInfo;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  bool editEmail = true;
  bool editPassword = true;
  bool passwordVisible = false;
  String passwordChange = '';
  String emailChange = '';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProfileCubit>(context);
    return Form(
      key: cubit.formKey,
      autovalidateMode: cubit.autovalidateMod,
      child: Column(
        children: [
          Center(
            child: CustomeFreelancerImage(
              height: 90,
              width: 90,
              image: widget.customerInfo[0].photo,
            ),
          ),
          const AspectRatio(aspectRatio: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomeText(
                text: '${widget.customerInfo[0].user!.name}',
                size: 16,
                weight: FontWeight.w600,
                color: const Color(0xff252525),
              ),
              const SizedBox(width: 16),
              const CustomeText(
                text: 'الاسم :',
                size: 17,
                weight: FontWeight.w800,
                fontFamily: 'Poppins SemiBold',
                color: Color(0xff252525),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  editEmail = !editEmail;
                  setState(() {});
                },
                child: editEmail
                    ? SvgPicture.asset(
                        width: 24,
                        AppImages.editsvg,
                      )
                    : SvgPicture.asset(
                        AppImages.editsvg,
                        width: 30,
                      ),
              ),
              const CustomeText(
                text: 'الإيميل المرتبط :',
                size: 16,
                weight: FontWeight.w800,
                fontFamily: 'Poppins SemiBold',
                color: Color(0xff252525),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomeTextFormField(
            type: TextInputType.emailAddress,
            isSuffix: false,
            hintText: '${widget.customerInfo[0].user!.email}',
            prefix: InkWell(
              onTap: () {
                if (emailChange != '') {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.updateProfile(
                      body: {'email': cubit.emailAddress!.text},
                    );
                    cubit.emailAddress!.clear();
                  }
                } else {
                  cubit.autovalidateMod = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: Image.asset(
                AppImages.email,
                width: 34,
              ),
            ),
            readOnly: editEmail,
            customController: cubit.emailAddress,
            validate: (value) => validate(
              type: 'email',
              value: value!,
            ),
            onChange: (val) {
              emailChange = val;
            },
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.topLeft,
            child: CustomButton(
              title: 'تغيير الإيميل',
              width: MediaQuery.sizeOf(context).width / 3,
              onTap: () {
                if (emailChange != '') {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.updateProfile(
                      body: {
                        'email': cubit.emailAddress!.text,
                      },
                    );
                    cubit.emailAddress!.clear();
                  }
                } else {
                  cubit.autovalidateMod = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  editPassword = !editPassword;
                  setState(() {});
                },
                child: editPassword
                    ? SvgPicture.asset(
                        AppImages.editsvg,
                        width: 24,
                      )
                    : SvgPicture.asset(
                        AppImages.editsvg,
                        width: 30,
                      ),
              ),
              const CustomeText(
                text: 'كلمة المرور :',
                size: 16,
                weight: FontWeight.w800,
                fontFamily: 'Poppins SemiBold',
                color: Color(0xff252525),
              ),
            ],
          ),
          const SizedBox(height: 8),

          CustomeTextFormField(
            customController: cubit.password,
            type: TextInputType.visiblePassword,
            isSuffix: false,
            hintText: 'تغيير كلمة السر',
            prefix: Image.asset(AppImages.lock),
            suffix: InkWell(
              onTap: () {
                passwordVisible = !passwordVisible;
                setState(() {});
              },
              child: !passwordVisible
                  ? Image.asset(AppImages.visible)
                  : const Icon(
                      Icons.remove_red_eye_rounded,
                      color: AppColors.dustyGray,
                    ),
            ),
            readOnly: editPassword,
            isObscure: !passwordVisible,
            validate: (value) => validate(
              type: 'password',
              value: value!,
            ),
            onChange: (val) {
              passwordChange = val;
            },
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.topLeft,
            child: CustomButton(
              title: 'تغيير كلمة المرور',
              width: MediaQuery.sizeOf(context).width / 3,
              onTap: () {
                if (passwordChange != '') {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.updateProfile(
                      body: {
                        'password': cubit.password!.text,
                      },
                    );
                    cubit.password!.clear();
                  }
                } else {
                  cubit.autovalidateMod = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          // const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
