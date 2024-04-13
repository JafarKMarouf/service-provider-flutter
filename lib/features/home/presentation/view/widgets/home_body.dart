import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booked_services_list_view.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:freelancer_app/features/home/presentation/view/services_list_view.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_home_bar.dart';
import 'package:freelancer_app/features/home/presentation/view_models/service_cubit/service_cubit.dart';
import 'package:get/get.dart' as g;
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'custome_search.dart';
import 'fetch_services.dart';
import 'on_going_page_view.dart';
import 'service_grid_view.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late String name;
  bool loading = false;
  List<Datum> data = [];
  @override
  void initState() {
    // name = BlocProvider.of<AuthCubit>(context).name!;
    BlocProvider.of<ServiceCubit>(context).fetchService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {
        if (state is ServiceLoading) {
          loading = true;
        } else if (state is ServiceFailure) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        } else if (state is ServiceSuccess) {
          loading = false;
          data.addAll(
            state.service.data!.toList(),
          );
          // print('==========photo ${data[0].photo}=================');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 60,
            bottom: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomeHomeBar(
                  name: 'Jafar',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomeSearch(
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 15,
                ),
                FetchServices(
                  title: 'الخدمات المتاحة',
                  onPressed: () {
                    g.Get.to(
                      () => ServicesListView(
                        data: data,
                      ),
                      transition: g.Transition.fadeIn,
                      duration: kDurationTransition,
                    );
                  },
                ),
                loading
                    ? const CircularProgressIndicator()
                    : data.isNotEmpty
                        ? ServiceGridView(
                            data: data,
                          )
                        : const Text('there is no service'),
                FetchServices(
                  title: 'الخدمات المحجوزة',
                  onPressed: () {
                    g.Get.to(
                      () => const BookedServicesListView(),
                      transition: g.Transition.fadeIn,
                      duration: kDurationTransition,
                    );
                  },
                ),
                const OnGoingPageView(
                    // data: data,
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
