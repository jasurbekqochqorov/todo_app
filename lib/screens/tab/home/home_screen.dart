import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/data/models/local/local_database.dart';
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

  List<TaskModels> tasks=[];

  _init() async{
    tasks=await LocalDatabase.getAllTask();
    setState(() {});
  }

  @override
  void initState() {
    _init();
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
      body: (tasks==[])?Center(
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
      ):ListView(children:List.generate(tasks.length, (index){
        return Container(
          height:20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.white,
          ),
          child: Column(children: [
            Text(tasks[index].title,style: AppTextStyle.interBold.copyWith(
              color: AppColors.white,fontSize:20.sp
            ),),
          ],),
        );
      }),),
      floatingActionButton:FloatingActionButton(
        backgroundColor: AppColors.blue,
        onPressed: () {
          addTaskDialog(context: context,
              taskModelChanged:(task) async {
            await LocalDatabase.insertTask(taskModels);
            _init();
          });
        },
        child:const Icon(Icons.add,color: AppColors.white,),
      ),
    );
  }
}
