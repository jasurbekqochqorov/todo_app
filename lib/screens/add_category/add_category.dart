import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/data/models/category/category_model.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/global/global.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';


class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});
  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}
class _AddCategoryScreenState extends State<AddCategoryScreen> {
  CategoryModel categoryModel=CategoryModel.initialValue;
  List<CategoryModel> category=[];
  TextEditingController categoryController=TextEditingController();
  int activeColor=-1;
  int activeIcon=-1;
  _init() async{
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        automaticallyImplyLeading: false,
        title: Text('Create new category',style: AppTextStyle.interRegular.copyWith(
          color: AppColors.white,fontSize: 20.sp
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 24.w,vertical:20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Category name :',style: AppTextStyle.interRegular.copyWith(
            color: AppColors.white
          ),),
          SizedBox(height:16.h,),
          TextField(
            style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.white,fontSize:15.sp
            ),
            controller: categoryController,
            onChanged: (v){
              categoryModel=categoryModel.copyWith(title: v);
            },
            decoration: InputDecoration(
              hintText: 'Category name',
              hintStyle: AppTextStyle.interRegular.copyWith(
                color: AppColors.white
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1.sp,color: AppColors.c_979797),
                borderRadius: BorderRadius.circular(4.r)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_979797),
                  borderRadius: BorderRadius.circular(4.r)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Text('Category icon:',style: AppTextStyle.interRegular.copyWith(
            color: AppColors.white
          ),),
        ],),),
          SizedBox(
            height:90.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(cate.length, (index){
                  return TextButton(
                    onPressed: (){
                      activeIcon=index;
                      String icon='';
                      icon=categories[index].iconPath.toString();
                      categoryModel=categoryModel.copyWith(iconPath: icon.toString());
                      setState(() {});
                    },
                    child:SvgPicture.asset(categories[index].iconPath,colorFilter: ColorFilter.mode(
                        (activeIcon==index)?Colors.green:Colors.blue,BlendMode.srcIn
                    ),),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:20.w),
            child: Text('Category color:',style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white
            ),),
          ),
        SizedBox(
          height:90.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(cate.length, (index){
                return TextButton(
                  onPressed: (){
                    activeColor=index;
                    String color=categories[index].color;
                    categoryModel=categoryModel.copyWith(color: color);
                    setState(() {});
                  },child:Column(children: [
                  (activeColor==index)?const Icon(Icons.check,color:Colors.green,):Text(''),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal:5.w),
                    width:36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorExtension(categories[index].color).toColor(),
                    ),
                  )
                ],),);
              }),
            ],
          ),
        ),
          const Spacer(),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(children: [
              Expanded(
                child: TextButton(onPressed:(){
                  Navigator.pop(context);
                },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical:12.h),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.sp,color:AppColors.c_8E7CFF),
                            borderRadius: BorderRadius.circular(4.r)
                        )
                    ),
                    child:Text("Cancel",style: AppTextStyle.interRegular.copyWith(
                        fontSize: 16.sp,color: AppColors.white
                    ),)),
              ),
             SizedBox(width: 20.w,),
              Expanded(
                child: TextButton(onPressed:()async{
                if(categoryModel.canAddTaskToDatabase()){
                  await LocalDatabase.insertCategory(categoryModel);
                  _init();
                  Navigator.pop(context);
                }
                }, style: TextButton.styleFrom(
                        backgroundColor: AppColors.c_8E7CFF,
                        padding: EdgeInsets.symmetric(vertical:12.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r)
                        )
                    ),
                    child:Text("Create category",style: AppTextStyle.interRegular.copyWith(
                        fontSize: 16.sp,color: AppColors.white
                    ),)),
              )
            ],),
          ),
          SizedBox(height:60.h,),
      ],),
    );

  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

