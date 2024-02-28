import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/screens/routes.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../utils/color/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor:AppColors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.white,),
        ),
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 40.w,vertical: 62.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text('Welcome to UpTodo',style: AppTextStyle.interBold.copyWith(
            color: AppColors.white.withOpacity(0.87),fontSize:32.sp
          ),),
            SizedBox(height: 26.h,),
            Text('Please login to your account or create new account to continue',textAlign:TextAlign.center,style: AppTextStyle.interRegular.copyWith(
              color: AppColors.white.withOpacity(0.67),fontSize:16.sp,
            ),),
            const Spacer(),
            SizedBox(
              width:double.infinity,
              child: TextButton(onPressed:(){
                Navigator.pushReplacementNamed(context,RouteNames.tabBox);
              },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.c_8E7CFF,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    )
                  ),
                  child:Text('START',style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize: 16.sp
              ),)),
            ),
            SizedBox(height: 48.h,),
        ],),
      ),
    );
  }
}
