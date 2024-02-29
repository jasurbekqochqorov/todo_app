

import 'package:homework12/data/models/category/category_model.dart';
import 'package:homework12/data/models/local/local_database.dart';
import 'package:homework12/global/global.dart';

CategoryModel categoryModel=CategoryModel.initialValue;
list()async{
  for(int i=0; i<categories.length; i++){
    categoryModel.copyWith(color: categories[i].color);
    categoryModel.copyWith(title: categories[i].title);
    categoryModel.copyWith(iconPath: categories[i].iconPath);
  }
  await LocalDatabase.insertCategory(categoryModel);
}