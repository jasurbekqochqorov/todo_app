import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/screens/routes.dart';
import 'package:homework12/utils/color/color.dart';

import 'data/models/local/local_storage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageRepository.init();

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(375,812),
      builder: (context,child){
        return MaterialApp(
          theme:ThemeData(
            scaffoldBackgroundColor: AppColors.black,
          ),
          initialRoute:RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
