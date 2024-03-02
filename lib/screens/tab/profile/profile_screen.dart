import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/color/color.dart';
import '../../../utils/icons/icon.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_121212,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.c_121212,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 20.sp,color: AppColors.white
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 21.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_pin,color: AppColors.white,size:100.sp,),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Martha Hays",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ZoomTapAnimation(
                      child: Container(
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFF363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "10 Task left",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  )),
                  ZoomTapAnimation(
                      child: Container(
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFF363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "5 Task done",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.h, left: 24.w, bottom: 16.h),
            child: Text(
              "Settings",
              style: TextStyle(
                color: Color(0xFFAFAFAF),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: (){},
                  leading: SvgPicture.asset(
                    AppImages.settings,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: Text(
                    "App Settings",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowLeft,
                        width: 23.w,
                        height: 23.h,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 16.h),
                  child: Text(
                    "Account",
                    style: TextStyle(
                      color: Color(0xFFAFAFAF),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                ListTile(
                  onTap: (){},
                  leading: SvgPicture.asset(
                    AppImages.user,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: Text(
                    "Change account name",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowLeft,
                        width: 23.w,
                        height: 23.h,
                      )),
                ),
                ListTile(
                  onTap: (){},
                  leading: SvgPicture.asset(
                    AppImages.key,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: Text(
                    "Change account password",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowLeft,
                        width: 23.w,
                        height: 23.h,
                      )),
                ),
                ListTile(
                  onTap: (){},
                  leading: SvgPicture.asset(
                    AppImages.camera,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: Text(
                    "Change account Image",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowLeft,
                        width: 23.w,
                        height: 23.h,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 16.h),
                  child: Text(
                    "Uptodo",
                    style: TextStyle(
                      color: Color(0xFFAFAFAF),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                ListTile(
                  onTap: (){},
                  leading: SvgPicture.asset(
                    AppImages.aboutUs,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: Text(
                    "About US",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowLeft,
                        width: 23.w,
                        height: 23.h,
                      )),
                ),
                ListTile(
                  onTap: (){},
                  leading: SvgPicture.asset(
                    AppImages.faq,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: Text(
                    "FAQ",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowLeft,
                        width: 23.w,
                        height: 23.h,
                      )),
                ),
                ListTile(
                    onTap: (){},
                    leading: SvgPicture.asset(
                      AppImages.flesh,
                      width: 24.w,
                      height: 24.h,
                    ),
                    title: Text(
                      "Help & Feedback",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppImages.arrowLeft,
                          width: 23.w,
                          height: 23.h,
                        ))),
                ListTile(
                  onTap: (){},
                  leading: SvgPicture.asset(
                    AppImages.like,
                    width: 24.w,
                    height: 24.h,
                  ),
                  title: Text(
                    "Support US",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowLeft,
                        width: 23.w,
                        height: 23.h,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 12.w, bottom: 16.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.logOut,
                        width: 24.w,
                        height: 24.h,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Log out",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
