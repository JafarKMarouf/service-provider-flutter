import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/utils/bloc_observer.dart';

import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo_impl.dart';
import 'package:freelancer_app/features/payment/presentation/view/payment_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:freelancer_app/features/main/data/repos/category_repo/category_repo_impl.dart';
import 'package:freelancer_app/features/main/data/repos/service_repo/service_repo_impl.dart';
import 'package:freelancer_app/features/main/presentation/view_models/category_cubit/category_cubit.dart';

import 'package:freelancer_app/features/main/presentation/view_models/service_cubit/service_cubit.dart';

import 'package:get/get.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:dio/dio.dart';

import 'features/profile/data/repos/profile_repo_impl.dart';
import 'features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(ProfileRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              CategoryCubit(CategoryRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) => ServiceCubit(ServiceRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) => BookServiceCubit(
              BookServiceRepoImpl(apiService: ApiService(Dio()))),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Poppins Regular',
          primaryColorLight: kPrimaryColor,
          applyElevationOverlayColor: true,
        ),
        home: const PaymentView(),
      ),
    );
  }
}
