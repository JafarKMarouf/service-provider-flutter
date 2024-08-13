import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_datum.dart';
import 'package:freelancer_app/features/main/presentation/view/services/widget/service_grid_view.dart';
import 'package:freelancer_app/features/main/presentation/view_models/service_cubit/service_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ServiceDatum> services = [];
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {
        if (state is ServiceSuccess) {
          services.addAll(state.service.data!.toList());
        }
      },
      builder: (context, state) {
        return state is ServiceSuccess
            ? Expanded(child: ServiceGridView(data: services))
            : Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 15,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
