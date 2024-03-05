import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/data/models/local/local_storage.dart';
import 'package:homework12/screens/routes.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../utils/color/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 40.w,vertical: 62.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text('Welcome to UpTodo',style:Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height: 26.h,),
            Text('Please enter your name and start',textAlign:TextAlign.center,style:Theme.of(context).textTheme.titleMedium
            ),
            SizedBox(height: 26.h,),
            Form(
              key: _formKey,
              child: TextFormField(
                onSaved: (v){
                  setState(() {
                    name=v!;
                  });
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your name";
                  }
                  return null;
                },
                style:Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 18.sp
                ),
                decoration:InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle:Theme.of(context).textTheme.titleMedium,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(width: 1,color: AppColors.blue.withOpacity(0.8))
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 1,color: AppColors.blue.withOpacity(0.8))
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 1,color: Colors.red)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 1,color: Colors.red)
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width:double.infinity,
              child: TextButton(onPressed:(){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  StorageRepository.setString(key: 'name', value:name);
                Navigator.pushReplacementNamed(context,RouteNames.tabBox);
                }
              },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.c_8E7CFF,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    )
                  ),
                  child:Text('START',style:Theme.of(context).textTheme.titleMedium)),
            ),
            SizedBox(height: 48.h,),
        ],),
      ),
    );
  }
}
