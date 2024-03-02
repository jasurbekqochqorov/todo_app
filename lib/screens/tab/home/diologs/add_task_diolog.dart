import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/screens/tab/home/diologs/category_selec_diolog.dart';
import 'package:homework12/screens/tab/home/diologs/priority_selec_diolog.dart';
import 'package:homework12/screens/tab/home/diologs/widgets/task_text_field.dart';
import 'package:homework12/utils/utilities.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/task/task_models.dart';
import '../../../../utils/color/color.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../../utils/icons/icon.dart';

addTaskDialog({required BuildContext context,required ValueChanged<TaskModels> taskModelChanged}) {

  final TextEditingController titleController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();

  TaskModels taskModels=TaskModels.initialValue;

  TimeOfDay? timeOfDay;
  DateTime? dateTime;

  int priority=0;
  String category='';
  final FocusNode focusNode1=FocusNode();
  final FocusNode focusNode2=FocusNode();


  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColors.c_363636,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context,setState){
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal:25.w,vertical: 25.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      'Add Task',
                      style: AppTextStyle.interBold
                          .copyWith(color: AppColors.white, fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TaskTextFieldWidget(title:'Write task',focusNode: focusNode1,controller:titleController,onChanged: (v){
                    taskModels=taskModels.copyWith(title: v);
                  },),
                  SizedBox(
                    height: 20.h,
                  ),
                  TaskTextFieldWidget(title:'Description',focusNode: focusNode2,controller: descriptionController,onChanged: (v){
                    taskModels=taskModels.copyWith(description: v);
                  },),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            dateTime=await showDatePicker(
                                context:context,
                                barrierColor: AppColors.c_363636,
                                confirmText: 'Choose',
                                firstDate:DateTime.now(),
                                lastDate: DateTime(2030));
                                if(dateTime!=null){
                              setState((){
                                taskModels=taskModels.copyWith(deadline: dateTime);
                              });
                            }
                          },
                          icon:Icon(Icons.calendar_month,color: AppColors.white,size:28.sp,)),
                      IconButton(
                          onPressed: () async{
                            timeOfDay=await showTimePicker(context: context,
                                confirmText: 'Save',
                                initialTime:const TimeOfDay(hour:8, minute:0),
                            builder: (BuildContext conte,Widget? child){
                              return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), child: child!);
                            });
                            if(timeOfDay!=null){
                              DateTime d=taskModels.deadline;
                              d=d.copyWith(hour:timeOfDay!.hour,minute: timeOfDay!.minute);
                              setState((){
                                taskModels=taskModels.copyWith(deadline:d);
                              });
                            }
                            },
                          icon: SvgPicture.asset(AppImages.watch,
                              width: 30.w, height: 30.h)),
                      IconButton(
                          onPressed: () {
                            showCategorySelectDialog(context: context,
                                categorySelection: (selectedCategory){
                              setState((){
                                category=selectedCategory;
                              });
                                  taskModels=taskModels.copyWith(category: selectedCategory);
                                },
                                category:category);
                          },
                          icon: SvgPicture.asset(AppImages.tag,
                              width: 30.w, height: 30.h)),
                      IconButton(
                          onPressed: () {
                            showPrioritySelectDialog(
                                p: taskModels.priority,
                                context: context, priority: (p){
                              setState((){
                                priority=p;
                              });
                              taskModels=taskModels.copyWith(priority: p);
                            });
                          },
                          icon: SvgPicture.asset(AppImages.flag,
                              width: 30.w, height: 30.h)),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            if(taskModels.canAddTaskToDatabase()) {
                              showSuccessMessage("SUCCESS");
                              taskModelChanged.call(taskModels);
                              Navigator.pop(context);
                            } else {
                              showErrorMessage("ERROR");
                            }
                          },
                          icon: SvgPicture.asset(AppImages.send,
                              width: 30.w, height: 30.h)),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  if((timeOfDay)!=null)Text("Time:${timeOfDay!.hour}:${timeOfDay!.minute}",style: AppTextStyle.interSemiBold.copyWith(
                    color: AppColors.white,fontSize:20.sp
                  ),),
                  SizedBox(height: 10.h,),
                   if(dateTime!=null) Text("Deadline:${DateFormat.yMMMEd().format(dateTime!)}",style: AppTextStyle.interSemiBold.copyWith(
                     color: AppColors.white,fontSize: 20.sp
                   ),),
                  SizedBox(height:10.h,),
                  Text(category,style: AppTextStyle.interBold.copyWith(
                    color: AppColors.white,fontSize:20.sp
                  ),)
                ],
              ),
            ),
          );
        });
      });
}
