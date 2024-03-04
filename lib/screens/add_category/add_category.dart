import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/data/models/category/category_model.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/global/global.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class AddCategoryScreen extends StatefulWidget {

  const AddCategoryScreen({super.key, this.onCategoryAdded});

  final VoidCallback? onCategoryAdded;
  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}
class _AddCategoryScreenState extends State<AddCategoryScreen> {
  CategoryModel categoryModel=CategoryModel.initialValue;
  TextEditingController categoryController=TextEditingController();
  int activeColor=-1;
  int activeIcon=-1;
  String categoryName="";
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
            color: AppColors.white,fontSize:16.sp
          ),),
          SizedBox(height:16.h,),
          TextField(
            style: AppTextStyle.interRegular.copyWith(
              color: AppColors.white,fontSize:20.sp
            ),
            controller: categoryController,
            onChanged: (v){
              categoryName=v;
            },
            decoration: InputDecoration(
              hintText: 'Category name',
              hintStyle: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize:16.sp
              ),
              focusedBorder: OutlineInputBorder(
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
            color: AppColors.white,fontSize:16.sp
          ),),
        ],),),
          SizedBox(
            height:75.h,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal:12.w),
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(categories.length, (index){
                  return ZoomTapAnimation(
                    onTap: (){
                      activeIcon=index;
                      setState(() {});
                    },
                    child:Container(
                      margin: EdgeInsets.symmetric(horizontal:8.w),
                      decoration: BoxDecoration(
                      color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal:20.w,vertical:10.h),
                      child: Column(children: [
                        SvgPicture.asset(categories[index].iconPath,width:30.w,height:30.h,),
                        (activeIcon==index)?const Icon(Icons.check,color: AppColors.black,):const Text('')
                      ],),
                    ),
                  );
                }),
              ],
            ),
          ),
          SizedBox(height:20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:20.w),
            child: Text('Category color:',style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize:16.sp
            ),),
          ),
          SizedBox(height:20.h,),
        SizedBox(
          height:60.h,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal:20.w),
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(categories.length, (index){
                return Row(children: [
                  TextButton(
                    onPressed: (){
                      activeColor=index;
                      setState(() {});
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical:20.h,horizontal:20.w),
                      backgroundColor:ColorExtension(categories[index].color).toColor(),
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                    child:(activeColor==index)?const Icon(Icons.check,color:Colors.white,):Text(''),),
                  SizedBox(width:8.w,),
                ],);
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
                if(categoryName.isNotEmpty && activeColor>-1 && activeIcon>-1){
                  await LocalDatabase.insertCategory(CategoryModel(title: categoryName, iconPath:categories[activeIcon].iconPath, color:categories[activeColor].color));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Category saved!'))
                  );
                  await Future.delayed(const Duration(seconds: 1),(){
                    Navigator.pop(context);
                    if(widget.onCategoryAdded!=null){
                      widget.onCategoryAdded!.call();
                    }
                  });
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Something is error'))
                  );
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

