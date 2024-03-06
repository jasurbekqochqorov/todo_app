import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/data/models/category/category_model.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';
import '../routes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, this.onCategoryAdded});
  final VoidCallback? onCategoryAdded;
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<CategoryModel> category=[];
  int selectedCategoryId=0;
  _init()async{
    category=await LocalDatabase.getAllCategory();
    setState((){});
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
        title: Text('Setting',style:Theme.of(context).textTheme.headlineMedium),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back_ios,color: AppColors.white,),),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(height: 30.h,),
        Expanded(
          child: GridView.count(crossAxisCount: 3,children:[
          ...List.generate(category.length, (index){
            return ZoomTapAnimation(
              onTap: (){
                selectedCategoryId=category[index].id!;
                _init();
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
                        int d= await LocalDatabase.deleteCategory(category[index].id!);
                        _init();
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
                        color:ColorExtension(category[index].color).toColor()
                    ),
                    child:SvgPicture.asset(category[index].iconPath,width:32.h,height:32.h,),
                  ),
                  Text(category[index].title,style:(category[index].id==selectedCategoryId)?AppTextStyle.interRegular
                      .copyWith(color: AppColors.blue,fontSize:16.sp):Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            );
          }),]),
        ),
        Container(
          width: double.infinity,
          padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
          child: TextButton(onPressed:(){
            Navigator.pushNamed(context,RouteNames.addCategory,
                arguments:()async{
                  category=await LocalDatabase.getAllCategory();
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
              child:Text("Add category",style:Theme.of(context).textTheme.titleMedium )),
        ),
        SizedBox(
          height: 30.h,
        )
      ],),
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor =this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
