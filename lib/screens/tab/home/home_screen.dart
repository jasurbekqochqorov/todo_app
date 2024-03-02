import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/data/models/task/task_models.dart';
import 'package:homework12/screens/tab/home/diologs/update_task_diolog.dart';
import 'package:homework12/screens/tab/home/diologs/widgets/task_item_view.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TaskModels taskModels=TaskModels.initialValue;

  List<TaskModels> tasks=[];

  _init() async{
    tasks=await LocalDatabase.getAllTask();
    setState(() {});
  }
  _searchQuery(String q)async{
    tasks=await LocalDatabase.searchTasks(q);
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
      body:(tasks.isEmpty)?Center(
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
      ):RefreshIndicator(
        color: AppColors.white,
        backgroundColor: AppColors.blue,
         onRefresh: (){
          _init();
          return Future<void>.delayed(const Duration(seconds:2));},
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.symmetric(horizontal:24.w,vertical:20.h),
              child: TextField(
                onChanged: _searchQuery,
                style: AppTextStyle.interSemiBold.copyWith(
                  color:
                    AppColors.black,fontSize:14.sp
                ),
                decoration:InputDecoration(
                  prefixIcon: const Icon(Icons.search,color: AppColors.c_979797,),
                  hintText: "Search for your task...",
                  hintStyle: AppTextStyle.interRegular.copyWith(
                    color: AppColors.c_AFAFAF,fontSize:16.sp
                  ),
                  fillColor: AppColors.c_363636,
                    filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal:13.w,vertical:12.h),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    borderSide: const BorderSide(width:1,color: AppColors.white)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide:const  BorderSide(width:1,color: AppColors.white)
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(children:List.generate(tasks.length, (index){
                return TaskItemView(taskModel: tasks[index],
                    onDelete: ()async{
                      showDialog(context: context, builder: (context){
                        return AlertDialog(

                          titlePadding: EdgeInsets.symmetric(horizontal:10.w,vertical:10.h),
                          actionsPadding: EdgeInsets.only(right:5.w,top: 20.h),
                          title: const Center(child: Text('Are you sure')),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child:const Text("NO")),
                            TextButton(onPressed: ()async{
                              int d= await LocalDatabase.deleteTask(tasks[index].id!);
                              _init();
                              Navigator.pop(context);
                            }, child:const Text("YES")),
                          ],
                        );
                      });
                    }, onUpdate:(){
                      updateTaskDialog(context: context, taskModels:tasks[index], taskModelChanged:(updateTask) async{
                        await LocalDatabase.updateTask(updateTask.copyWith(id:tasks[index].id),tasks[index].id!,);
                        _init();
                      });
                    });
              }),),
            ),
          ],
        ),
      ),

    );
  }
}
//(false)?Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           Image.asset(AppImages.picture,width: 227.2,height: 227.h,),
//             Text('What do you want to do today?',style: AppTextStyle.interSemiBold.copyWith(
//               color: AppColors.white,fontSize: 20.sp
//             ),),
//             SizedBox(height: 10.h,),
//             Text('Tap + to add your tasks',style: AppTextStyle.interRegular.copyWith(
//               color: AppColors.white.withOpacity(0.87),fontSize: 16.sp
//             ),)
//         ],),
//       )