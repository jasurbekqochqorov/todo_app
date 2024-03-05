import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/screens/on_boarding/widgets/boarding_bottom_view.dart';
import 'package:homework12/screens/on_boarding/widgets/page_item.dart';
import 'package:homework12/screens/routes.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../data/models/local/local_storage.dart';
import '../../data/models/page_data_models.dart';
import '../../utils/icons/icon.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int activeIndex = 0;
  final PageController pageController = PageController();

  List<PageDataModel> pagesData = [
    PageDataModel(
      iconPath: AppImages.picture1,
      title: "Manage your tasks",
      subtitle:
      "You can easily manage all of your daily tasks in DoMe for free",
    ),
    PageDataModel(
      iconPath: AppImages.picture2,
      title: "Create daily routine",
      subtitle:
      "In Uptodo  you can create your personalized routine to stay productive",
    ),
    PageDataModel(
      iconPath: AppImages.picture3,
      title: "Orgonaize your tasks",
      subtitle:"You can organize your daily tasks by adding your tasks into separate categories")
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:EdgeInsets.only(top:80.h,left:20.w),
              child: TextButton(
                style: TextButton.styleFrom(
                ),
                onPressed: (){
                  StorageRepository.setBool(key: 'bool', value:true);
                  Navigator.pushNamed(context,RouteNames.welcomeScreen);
                },
                child: Text('SKIP',style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  ...List.generate(
                    pagesData.length,
                        (index) => PageItem(
                      pageDataModel: pagesData[index],
                      horizontalPadding: index == 0 ?44.w : 30.w,
                      activeIndex: activeIndex,
                      pagesData:pagesData,
                    ),
                  )
                ],
              ),
            ),
            BoardingBottomView(
              pagesData: pagesData,
              activeIndex: activeIndex,
              onNextTap: () {
                if (activeIndex < pagesData.length - 1) {
                  setState(() {
                    activeIndex++;
                  });
                  pageController.jumpToPage(activeIndex);
                }
              },
              onBackTap: (){
                if (activeIndex>0) {
                  setState(() {
                    activeIndex--;
                  });
                  pageController.jumpToPage(activeIndex);
                }
              },
              onGetStartTap: (){
                StorageRepository.setBool(key: 'bool', value:true);
                  Navigator.pushReplacementNamed(context,RouteNames.welcomeScreen);
                  },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
