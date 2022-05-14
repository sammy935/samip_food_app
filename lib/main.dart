import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:samip_grubrr/blocs/auth/auth_bloc.dart';
import 'package:samip_grubrr/database/dbRepo.dart';
import 'package:samip_grubrr/network/apiRepo.dart';
import 'package:samip_grubrr/screens/login_page.dart';
import 'package:samip_grubrr/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDB.instance.openDB();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ApiRepo apiRepo = ApiRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(apiRepo: apiRepo)),
        // BlocProvider(create: create)
      ],
      child: ScreenUtilInit(
        builder: (c) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: GetMaterialApp(
            title: 'Grubrr',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: Routes.login,
            onGenerateRoute: Routes.generateRoute,
          ),
        ),
      ),
    );
  }
}
