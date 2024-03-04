import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/data/models/category/category_model.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/global/global.dart';
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
  CategoryModel categoryModel=CategoryModel.initialValue;
  _init()async{
    for(int i=0; i<categories.length; i++){
      await LocalDatabase.insertCategory(categoryModel=categoryModel.copyWith(
          color: categories[i].color,
          title: categories[i].title,
          iconPath: categories[i].iconPath,
        ));

    }
      setState((){});
  }
  @override
  void initState() {
    bool isEnterBefore=StorageRepository.getBool(key:'bool');
    Future.delayed(const Duration(seconds: 4),(){
      if(isEnterBefore) {
        Navigator.pushReplacementNamed(context,RouteNames.tabBox);
      } else{
        Navigator.pushReplacementNamed(context,RouteNames.onBoardingScreen);
        _init();
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
