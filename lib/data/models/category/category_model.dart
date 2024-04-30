

import 'dart:ui';

import 'package:homework12/data/models/category/category_model_constants.dart';
import 'package:homework12/data/models/task/task_model_constants.dart';

class CategoryModel {
  final int? id;
  final String title;
  final String iconPath;
  final String color;
  CategoryModel({
    this.id,
    required this.title,
    required this.iconPath,
    required this.color,
  });

  CategoryModel copyWith({
    int? id,
    String? title,
    String? iconPath,
    String? color,
  }) {
    return CategoryModel(
      title:title ?? this.title,
      iconPath: iconPath ?? this.iconPath,
      color: color ?? this.color,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      color: json[CategoryModelConstants.color] as String? ?? "",
      title: json[CategoryModelConstants.title] as String? ?? "",
      iconPath:json[CategoryModelConstants.iconPath] as String? ?? "",
      id: json[TaskModelConstants.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CategoryModelConstants.iconPath:iconPath,
      CategoryModelConstants.title: title,
      CategoryModelConstants.color: color,
    };
  }

  bool canAddTaskToDatabase() {
    if (title.isEmpty) return false;
    if (iconPath.isEmpty) return false;
    return true;
  }

  static CategoryModel initialValue = CategoryModel(
    title: "",
    iconPath: "",
    color:'',
  );
}


