



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/extension/extension.dart';

showPrioritySelectDialog({
  required BuildContext context,
  required ValueChanged<int> priority,
  required int p,
}){
  int activeIndex=p;
  showDialog(context: context, builder: (context){

    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;

    return StatefulBuilder(builder: (context,setState){
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical:height*0.2),
        color: AppColors.c_363636,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h,),
            Text('Task priority',style: AppTextStyle.interBold.copyWith(
                color: AppColors.white.withOpacity(0.87),fontSize:16.sp
            ),),
            SizedBox(height: 10.h,),
            Container(
              color: AppColors.c_979797,height: 1.h,width: width,
            ),
            SizedBox(height: 22.h,),
            SizedBox(
              height:height*0.35,
              child: GridView.count(crossAxisCount: 4,
                children: [
                  ...List.generate(10, (index){
                    return ZoomTapAnimation(
                      onTap: (){
                        setState((){
                          activeIndex=index;
                        });
                      },
                      child: Container(
                        margin:EdgeInsets.symmetric(horizontal:8.w,vertical:8.h),
                        padding:EdgeInsets.symmetric(horizontal: 24.w,vertical:8.h
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: (activeIndex==index)?AppColors.c_8E7CFF:AppColors.c_272727
                        ),
                        child:Column(children: [
                         SvgPicture.asset(AppImages.flag,width:24.2,height: 24.h,),
                          SizedBox(height:5.h,),
                          Text("${index+1}",style: AppTextStyle.interBold.copyWith(
                              color: AppColors.white,fontSize:20.sp
                          ),)
                        ],),
                      ),
                    );
                  }),
                ],),
            ),const Spacer(),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
              child: Row(children: [
                Expanded(
                  child: TextButton(onPressed:(){
                    Navigator.pop(context);
                  },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical:12.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)
                          )
                      ),
                      child:Text("Cancel",style: AppTextStyle.interRegular.copyWith(
                          fontSize: 16.sp,color: AppColors.c_8E7CFF
                      ),)),
                ),
                SizedBox(width: 15.w,),
                Expanded(
                  child: TextButton(onPressed:(){
                    priority.call(activeIndex);
                    Navigator.pop(context);
                  },
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.c_8E7CFF,
                          padding: EdgeInsets.symmetric(vertical:12.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)
                          )),
                      child:Text("Save",style: AppTextStyle.interRegular.copyWith(
                          color: AppColors.white,fontSize:16.sp
                      ),)),
                ),
              ],),
            )
          ],
        ),
      );
    });
  });
}