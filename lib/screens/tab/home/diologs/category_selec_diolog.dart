import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/data/models/category/category_model.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/screens/routes.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/color/color.dart';
import '../../../../utils/extension/extension.dart';
import '../../../../utils/fonts/fonts.dart';

showCategorySelectDialog ({
  required BuildContext context,
  required ValueChanged<int> categorySelection,
  required int category,
  List<CategoryModel>? cate,
}) async{
  int selectedCategoryId=category;
  List<CategoryModel> category1=await LocalDatabase.getAllCategory();
  if(!context.mounted) return;
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
              height:height*0.43,
              child: GridView.count(crossAxisCount: 3,
                children: [
                  ...List.generate(category1.length, (index){
                    return ZoomTapAnimation(
                      onTap: (){
                        setState((){
                          selectedCategoryId=category1[index].id!;
                        });
                      },
                      onLongTap: ()async{
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            titlePadding: EdgeInsets.symmetric(horizontal:10.w,vertical:10.h),
                            actionsPadding: EdgeInsets.only(right:5.w,top: 15.h),
                            title: const Center(child: Text('Are you sure')),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child:const Text("NO")),
                              TextButton(onPressed: ()async{
                                int d= await LocalDatabase.deleteCategory(category1[index].id!);
                                setState((){});
                                Navigator.pop(context);
                              }, child:const Text("YES")),
                            ],
                          );
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            padding:EdgeInsets.symmetric(horizontal: 16.w,vertical:16.h
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: (category1[index].id==selectedCategoryId)?AppColors.white:ColorExtension(category1[index].color).toColor()
                            ),
                            child:SvgPicture.asset(category1[index].iconPath,width:32.h,height:32.h.h,),
                          ),
                          Text(category1[index].title,style: AppTextStyle.interRegular.copyWith(
                              color: AppColors.white.withOpacity(0.87),fontSize:14.sp
                          ),)
                        ],
                      ),
                    );
                  }),
                ],),
            ),Spacer(),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: TextButton(onPressed:(){
                        Navigator.pop(context);
                      },
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.c_8E7CFF,
                              padding: EdgeInsets.symmetric(vertical:12.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r)
                              )
                          ),
                          child:Text("Cancel",style: AppTextStyle.interRegular.copyWith(
                              fontSize: 16.sp,color: AppColors.white
                          ),)),
                    ),
                    SizedBox(width:15.w,),
                    Expanded(
                      child: TextButton(onPressed:(){
                        categorySelection.call(selectedCategoryId);
                        Navigator.pop(context);
                        },
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.c_8E7CFF,
                              padding: EdgeInsets.symmetric(vertical:12.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r)
                              )
                          ),
                          child:Text("Save",style: AppTextStyle.interRegular.copyWith(
                              fontSize: 16.sp,color: AppColors.white
                          ),)),
                    )
                  ],),
                  SizedBox(height:10.h,),
                  Row(children: [
                    Expanded(
                      child: TextButton(onPressed:(){
                        Navigator.pushNamed(context,RouteNames.addCategory,
                        arguments: ()async{
                          category1=await LocalDatabase.getAllCategory();
                          setState((){});
                        });
                      },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.c_8E7CFF,
                              padding: EdgeInsets.symmetric(vertical:12.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r)
                              )
                          ),
                          child:Text("Add category",style: AppTextStyle.interRegular.copyWith(
                              fontSize: 16.sp,color: AppColors.white
                          ),)),
                    ),
                  ],),
                ],
              ),
            )
          ],
        ),
      );
    });
  });
}