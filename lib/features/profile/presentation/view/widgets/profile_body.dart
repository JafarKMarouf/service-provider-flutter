import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freelancer_app/features/profile/data/models/profile_model/customer_datum.dart';

import 'package:freelancer_app/features/profile/presentation/view/widgets/custome_profile_bar.dart';
import 'package:freelancer_app/features/profile/presentation/view/widgets/profile_success_view.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:get/get.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  List<CustomerInfos> customerInfo = [];

  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).showProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            customerInfo = [];
            customerInfo.addAll(state.profileModel!.customerInfos!.toList());
          } else if (state is ProfileFailure) {
            Get.snackbar(
              'faild',
              state.errMessage,
              duration: const Duration(seconds: 20),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileSuccess) {
            return ProfileSuccessView(customerInfo: customerInfo);
          } else {
            return const Column(
              children: [
                AspectRatio(aspectRatio: 7),
                CustomeProfileBar(isLoading: true)
              ],
            );
          }
        },
      ),
    );
  }
}
