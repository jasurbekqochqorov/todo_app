import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/data/models/category/category_model.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/data/models/task/task_models.dart';
import 'package:homework12/screens/add_category/add_category.dart';
import '../../../../../utils/color/color.dart';
import '../../../../../utils/fonts/fonts.dart';

class TaskItemView extends StatefulWidget {
  const TaskItemView(
      {super.key, required this.taskModel, required this.onDelete, required this.onUpdate});

  final TaskModels taskModel;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;
  @override
  State<TaskItemView> createState() => _TaskItemViewState();
}


class _TaskItemViewState extends State<TaskItemView> {
  bool isCheck=false;
  TaskModels task=TaskModels.initialValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
      // height:20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.c_363636,
      ),
      child: Column(children: [
        Row(children: [
          Text(widget.taskModel.title, style: AppTextStyle.interBold.copyWith(
              color: AppColors.white, fontSize: 20.sp
          ),),
          const Spacer(),
          IconButton(
              onPressed: widget.onDelete,
              icon: const Icon(Icons.delete, color: Colors.red,)),
          IconButton(onPressed: widget.onUpdate,
              icon: const Icon(Icons.edit, color: Colors.green,)),
          // Checkbox(value:isCheck, onChanged:(v){
          //   isCheck=v!;
          //   if(isCheck==true){
          //     task=task.copyWith(status:TaskStatus.done);
          //   }
          //   else{
          //     task=task.copyWith(status: TaskStatus.missed);
          //   }
          //   setState((){});
          // }),
        ],),
        Row(children: [
          Text('Today at:${widget.taskModel.deadline.hour.hour()}:${widget
              .taskModel.deadline.minute.minute()}',
            style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white, fontSize: 14.sp
            ),),
          const Spacer(),
          FutureBuilder<CategoryModel>(
              future: LocalDatabase.getCategoryById(
                  widget.taskModel.categoryId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CategoryModel category = snapshot.data as CategoryModel;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: ColorExtension(category.color).toColor()
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(category.iconPath, width: 15.w, height: 15.h,),
                        SizedBox(width: 5.w,),
                        Text(category.title,
                          style: AppTextStyle.interRegular.copyWith(
                              color: AppColors.white, fontSize: 12.sp
                          ),),
                      ],
                    ),
                  );

              }
                return const Center(child:CircularProgressIndicator());
              }),
          SizedBox(width: 12.w,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.c_363636,
                  border: Border.all(width: 2.sp, color: AppColors.c_809CFF)
              ),
              child: Row(children: [
                Icon(Icons.flag_outlined, color: AppColors.white, size: 20.sp,),
                SizedBox(width: 5.w,),
                Text(widget.taskModel.priority.toString(),
                  style: AppTextStyle.interRegular.copyWith(
                      color: AppColors.white, fontSize: 15.sp
                  ),),
              ],)
          )
        ],)
      ],),
    );
  }
}


extension Hour on int{
  hour() {
    if (this < 10) {
      return "0$this";
    }
    else {
      return this;
    }
  }
}
extension Minute on int{
  minute() {
    if (this < 10) {
      return "0$this";
    }
    else {
      return this;
    }
  }
}
