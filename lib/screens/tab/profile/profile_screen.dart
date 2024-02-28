import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text('Profile',style: AppTextStyle.interRegular.copyWith(
          color: AppColors.white,fontSize:20.sp,
        ),),
        centerTitle: true,
      ),
      backgroundColor: AppColors.black,
      body: Column(children: [

      ],),
    );
  }
}
