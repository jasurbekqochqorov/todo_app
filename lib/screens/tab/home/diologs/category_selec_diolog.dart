





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/data/models/category_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/color/color.dart';
import '../../../../utils/extension/extension.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../../utils/icons/icon.dart';

showCategorySelectDialog({
  required BuildContext context,
  required ValueChanged<String> categorySelection,
  required String category,
}){
  String selectedCategory=category;
  List<CategoryModel> categories=[
    CategoryModel(color:AppColors.c_CCFF80, title:"Grocery", icon:AppImages.cook),
    CategoryModel(color:AppColors.c_FF9680, title:"Work", icon:AppImages.work),
    CategoryModel(color:AppColors.c_80FFFF, title:"Sport", icon:AppImages.sport),
    CategoryModel(color:AppColors.c_80FFD9, title:"Design", icon:AppImages.design),
    CategoryModel(color:AppColors.c_809CFF, title:"Study", icon:AppImages.study),
    CategoryModel(color:AppColors.c_FF80EB, title:"Social", icon:AppImages.social),
    CategoryModel(color:AppColors.c_FC80FF, title:"Music", icon:AppImages.music),
    CategoryModel(color:AppColors.c_80FFA3, title:"Health", icon:AppImages.health),
    CategoryModel(color:AppColors.c_80D1FF, title:"Movie", icon:AppImages.movie),
    CategoryModel(color:AppColors.c_FFCC80, title:"Home", icon:AppImages.home),
  ];
  int active=0;
  showDialog(context: context, builder: (context){

    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return StatefulBuilder(builder: (context,setState){
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical:height*0.15),
        color: AppColors.c_363636,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h,),
            Text('Choose category',style: AppTextStyle.interBold.copyWith(
                color: AppColors.white.withOpacity(0.87),fontSize:16.sp
            ),),
            SizedBox(height: 10.h,),
            Container(
              color: AppColors.c_979797,height: 1.h,width: width,
            ),
            SizedBox(height: 22.h,),
            SizedBox(
              height:height*0.5,
              child: GridView.count(crossAxisCount: 3,
                children: [
                  ...List.generate(categories.length, (index){
                    return ZoomTapAnimation(
                      onTap: (){
                        setState((){
                          selectedCategory=categories[index].title;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            padding:EdgeInsets.symmetric(horizontal: 16.w,vertical:16.h
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: (categories[index].title==selectedCategory)?AppColors.white:categories[index].color
                            ),
                            child:SvgPicture.asset(categories[index].icon,width:32.h,height:32.h.h,),
                          ),
                          Text(categories[index].title,style: AppTextStyle.interRegular.copyWith(
                            color: AppColors.white.withOpacity(0.87),fontSize:14.sp
                          ),)
                        ],
                      ),
                    );
                  }),
                ],),
            ),
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
                    categorySelection.call(selectedCategory);
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