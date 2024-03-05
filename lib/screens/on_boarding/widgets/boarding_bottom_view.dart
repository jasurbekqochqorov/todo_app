import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/page_data_models.dart';
import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class BoardingBottomView extends StatelessWidget {
  const BoardingBottomView({
    super.key,
    required this.pagesData,
    required this.activeIndex,
    required this.onBackTap,
    required this.onNextTap,
    required this.onGetStartTap,
  });

  final List<PageDataModel> pagesData;
  final int activeIndex;
  final VoidCallback onBackTap;
  final VoidCallback onNextTap;
  final VoidCallback onGetStartTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onBackTap,
                child: Text(
                  "BACK",
                  style:Theme.of(context).textTheme.titleMedium
                ),
              ),
              (activeIndex != pagesData.length - 1)
                  ? TextButton(
                      onPressed: onNextTap,
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 12.h),
                          backgroundColor: AppColors.c_8875FF),
                      child: Text(
                        "NEXT",
                        style: Theme.of(context).textTheme.titleMedium,
                      ))
                  : TextButton(
                      onPressed: onGetStartTap,
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 12.h),
                          backgroundColor: AppColors.c_8875FF),
                      child: Text(
                        "GET STARTED",
                        style:Theme.of(context).textTheme.titleMedium
                      ))
            ],
          )
        ],
      ),
    );
  }
}
