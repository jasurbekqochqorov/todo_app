import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/data/models/task/task_models.dart';
import 'package:homework12/screens/tab/home/diologs/update_task_diolog.dart';
import 'package:homework12/screens/tab/home/diologs/widgets/task_item_view.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import '../../../data/models/category/category_model.dart';
import '../../../utils/icons/icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.stream});
  final Stream? stream;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TaskModels taskModels=TaskModels.initialValue;

  List<TaskModels> tasks=[];
  List<TaskModels> tasks2=[];
  int k=0;

  _init() async{
    tasks=await LocalDatabase.getAllTask();
    tasks2=await LocalDatabase.getAllTask();
    setState(() {});
  }
  _searchQuery(String q)async{
    k=1;
    tasks=await LocalDatabase.searchTasks(q);
    setState(() {});
  }

  @override
  void initState() {
    _init();
    if(widget.stream!=null){
      widget.stream!.listen((event) {_init();});
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},
        highlightColor: AppColors.blue,
        icon: SvgPicture.asset(AppImages.menu,width: 24.w,height: 24.h,),style:IconButton.styleFrom(),),
        title: Text('Index',style: Theme.of(context).textTheme.titleLarge),
        actions: [
          Image.asset(AppImages.person,width: 42.w,height: 42.h,),
          SizedBox(width:24.w,)
        ],
        centerTitle: true,
      ),
      body:(tasks2.isEmpty)?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(AppImages.picture,width: 227.2,height: 227.h,),
            Text('What do you want to do today?',style: Theme.of(context).textTheme.titleLarge
            ),
            SizedBox(height: 10.h,),
            Text('Tap + to add your tasks',style: Theme.of(context).textTheme.titleMedium)
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
                    AppColors.white,fontSize:16.sp
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
                    },);
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