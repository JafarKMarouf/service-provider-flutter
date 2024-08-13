import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:freelancer_app/features/profile/data/repos/profile_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepoImpl) : super(ProfileInitial());

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autovalidateMod = AutovalidateMode.disabled;
  TextEditingController? emailAddress = TextEditingController();
  TextEditingController? password = TextEditingController();
  int? customerId;
  final ProfileRepoImpl profileRepoImpl;

  Future<void> showProfile() async {
    emit(ProfileLoading());

    var result = await profileRepoImpl.showProfile();
    result.fold((fail) {
      emit(ProfileFailure(errMessage: fail.errMessage));
    }, (user) {
      emit(ProfileSuccess(profileModel: user));
    });
  }

  Future<void> updateProfile({Map<String, dynamic>? body}) async {
    emit(ProfileLoading());
    var result = await profileRepoImpl.updateProfile(body: body);
    result.fold((fail) {
      emit(ProfileFailure(errMessage: fail.errMessage));
    }, (user) {
      emit(ProfileSuccess(profileModel: user));
    });
  }
}
