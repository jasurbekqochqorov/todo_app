import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/screens/routes.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../../data/models/local/local_storage.dart';
import '../../utils/extension/extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    bool isEnterBefore=StorageRepository.getBool(key:'bool');
    Future.delayed(const Duration(seconds: 4),(){
      if(isEnterBefore) {
        Navigator.pushReplacementNamed(context,RouteNames.tabBox);
      } else{
        Navigator.pushReplacementNamed(context,RouteNames.onBoardingScreen);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SvgPicture.asset(AppImages.check,width: 113.w,height: 113.h,),
        SizedBox(height: 35.h,),
        Text('UpTodo',style: AppTextStyle.interBold.copyWith(
          color:AppColors.white,fontSize: 40.sp
        ),)
      ],),),
    );
  }
}
