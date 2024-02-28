import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/color/color.dart';
import '../../../../../utils/fonts/fonts.dart';


class TaskTextFieldWidget extends StatefulWidget {
  const TaskTextFieldWidget({super.key, required this.title, required this.onChanged, required this.focusNode, required this.controller});
  final String title;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final TextEditingController controller;
  @override
  State<TaskTextFieldWidget> createState() => _TaskTextFieldWidgetState();
}

class _TaskTextFieldWidgetState extends State<TaskTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      style: AppTextStyle.interMedium.copyWith(
          color:AppColors.white,fontSize:16.sp
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal:10.w,vertical:14.h),
        hintText: widget.title,
        hintStyle: AppTextStyle.interSemiBold.copyWith(
            color:AppColors.white.withOpacity(0.5),fontSize:15.sp
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(width: 1,color: AppColors.white.withOpacity(0.87))
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(width: 1,color: AppColors.white.withOpacity(0.87))
        ),
      ),
    );
  }
}
