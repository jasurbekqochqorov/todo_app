import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/data/models/task_models.dart';
import 'package:homework12/screens/tab/home/diologs/add_task_diolog.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../utils/icons/icon.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TaskModels taskModels=TaskModels.initialVale;

  @override
  void initState() {
    taskModels.canAddTaskToDatabase();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(onPressed: (){},
        highlightColor: AppColors.blue,
        icon: SvgPicture.asset(AppImages.menu,width: 24.w,height: 24.h,),),
        title: Text('Index',style: AppTextStyle.interRegular.copyWith(
          color: AppColors.white.withOpacity(0.87),fontSize:20.sp
        ),),
        actions: [
          Image.asset(AppImages.person,width: 42.w,height: 42.h,),
          SizedBox(width:24.w,)
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(AppImages.picture,width: 227.2,height: 227.h,),
            Text('What do you want to do today?',style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.white,fontSize: 20.sp
            ),),
            SizedBox(height: 10.h,),
            Text('Tap + to add your tasks',style: AppTextStyle.interRegular.copyWith(
              color: AppColors.white.withOpacity(0.87),fontSize: 16.sp
            ),)
        ],),
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: AppColors.blue,

        onPressed: () {
          addTaskDialog(context: context, taskModelChanged:(task){
            taskModels=task;
          });
        },
        child:const Icon(Icons.add,color: AppColors.white,),
      ),
    );
  }
}
//AlertDialog(
//               contentPadding: EdgeInsets.zero,
//               content: Container(
//                 margin: EdgeInsets.zero,
//                 width:MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 25.h),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     color: AppColors.c_363636
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width:200.sp,
//                       child: Text('Add Task',style: AppTextStyle.interBold.copyWith(
//                           color: AppColors.white,fontSize:20.sp
//                       ),),
//                     ),
//                     SizedBox(height:20.h,),
//                     const TaskTextFieldWidget(title:'Write task'),
//                     SizedBox(height: 20.h,),
//                     const TaskTextFieldWidget(title:'Description'),
//
//                     SizedBox(height:25.h,),
//                     Row(children: [
//                       IconButton(onPressed:(){
//                         showDialog(context: context, builder:(BuildContext context){
//                           return const AlertDialog(
//                           title: Text('adsf'),
//                             backgroundColor: AppColors.white,
//                           );
//                         });
//                       }, icon:SvgPicture.asset(AppImages.watch,width: 24.w,height: 24.h,)),
//                       IconButton(onPressed:(){}, icon:SvgPicture.asset(AppImages.tag,width: 24.w,height: 24.h)),
//                       IconButton(onPressed:(){}, icon:SvgPicture.asset(AppImages.flag,width: 24.w,height: 24.h)),
//                       const Spacer(),
//                       IconButton(onPressed:(){}, icon:SvgPicture.asset(AppImages.send,width: 24.w,height: 24.h)),
//                     ],)
//                   ],
//                 ),
//               ),
//             )