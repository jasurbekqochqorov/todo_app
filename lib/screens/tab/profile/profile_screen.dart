import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/data/models/local/local_storage.dart';
import 'package:homework12/data/models/task/task_models.dart';
import 'package:homework12/screens/routes.dart';
import 'package:homework12/screens/tab/profile/widgets./list_tile_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController=TextEditingController();
  List<TaskModels> taskModel=[];
  List<TaskModels> left=[];
  List<TaskModels> done=[];

  _init()async{
    taskModel=await LocalDatabase.getAllTask();
    left=taskModel.map((element) => element.status.name=='missed').cast<TaskModels>().toList();
    done=taskModel.map((element) => element.status.name=='done').cast<TaskModels>().toList();
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
      appBar: AppBar(
        elevation: 0,
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
              Icon(Icons.person_pin,color: AppColors.blue,size:100.sp,),
              SizedBox(
                height: 10.h,
              ),
              Text(
                StorageRepository.getString(key: 'name'),
                style:Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize:20.sp
                )
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
                      color:AppColors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "${left.length} Task left",
                        style:Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  )),
                  ZoomTapAnimation(
                      child: Container(
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "${done.length} Task done",
                        style:Theme.of(context).textTheme.titleMedium
                      ),
                    ),
                  ))
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.h, left: 20.w, bottom: 16.h),
            child: Text(
              "Settings",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTileWidget(icon: AppImages.settings, title: 'Add Category',onTap: (){
                Navigator.pushNamed(context,RouteNames.settings);
              },),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 16.h),
                child: Text(
                  "Account",
                  style:Theme.of(context).textTheme.titleSmall
                ),
              ),
              ListTileWidget(icon: AppImages.user, title: "Change account name",
              onTap: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          style:AppTextStyle.interMedium.copyWith(
                            color: AppColors.black,fontSize:16.sp,),
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            hintStyle:AppTextStyle.interMedium.copyWith(
                              color: AppColors.black,fontSize: 16.sp
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.8))
                            ),
                            enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.8))
                            ),
                          ),
                        ),
                      ],),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child:const Text('Cancel')),
                      TextButton(onPressed: (){
                        StorageRepository.setString(key: 'name', value:nameController.text);
                        Navigator.pop(context);
                        setState(() {});
                      }, child:const Text('Change')),
                    ],
                  );
                });
              },),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 16.h),
                child: Text(
                  "Up todo",
                  style:Theme.of(context).textTheme.titleSmall
                ),
              ),
              ListTileWidget(icon: AppImages.aboutUs, title:'About us',onTap: (){},),
              TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal:24.w,vertical:16.h)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.logOut,
                      width: 24.w,
                      height: 24.h,
                    ),
                    Text(
                      " Log out",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
