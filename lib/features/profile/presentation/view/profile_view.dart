// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user_model.dart';

import 'widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('$username'),
        actions: [
          IconButton(
            onPressed: () async {
              ApiService? apiService;
              // await apiService!.storage.delete(key: 'token');
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: kPrimaryColor,
              size: 32,
            ),
          ),
        ],
      ),
      body: const ProfileBody(),
    );
  }
}
