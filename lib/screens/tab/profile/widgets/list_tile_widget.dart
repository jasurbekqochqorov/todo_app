import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/color/color.dart';
import '../../../../utils/icons/icon.dart';


class ListTileWidget extends StatefulWidget {
  const ListTileWidget({super.key, required this.icon, required this.title,this.onTap});
  final String icon;
  final String title;
  final VoidCallback? onTap;
  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  TextEditingController nameController=TextEditingController();
  _init(){
    setState(() {
    });
  }
  @override
  void initState() {
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:widget.onTap,
      contentPadding: EdgeInsets.only(left:20.w),
      leading: SvgPicture.asset(
        widget.icon,
        width: 24.w,
        height: 24.h,
        colorFilter: ColorFilter.mode(AppColors.blue,BlendMode.srcIn),
      ),
      title: Text(
        widget.title,
        style:Theme.of(context).textTheme.titleMedium,
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppImages.arrowLeft,
            width: 23.w,
            height: 23.h,
          )),
    );
  }
}
