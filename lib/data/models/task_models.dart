import 'package:homework12/data/models/task_model_constants.dart';
import 'package:homework12/data/models/task_status.dart';

class TaskModels {

  final int? id;
  final String description;
  final String title;
  final TaskStatus status;
  final String category;
  final DateTime deadline;
  final int priority;

  TaskModels({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.deadline,
    required this.priority,
    required this.status

  });

  TaskModels copyWith({
    int? id,
    String? description,
    String? title,
    TaskStatus? status,
    String? category,
    DateTime? deadline,
    int? priority,
  }) {
    return TaskModels(
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        deadline: deadline ?? this.deadline,
        priority: priority ?? this.priority,
        status: status ?? this.status);
  }

  factory TaskModels.fromJson(Map<String,dynamic> json){
    return TaskModels(
        title:json[TaskModelConstants.title] as String? ?? "",
        description:json[TaskModelConstants.description] as String? ?? "",
        category:json['category'] as String? ?? "",
        deadline: DateTime.parse(json['deadline'] as String? ?? ""),
        priority: json['priority'] as int? ?? 1,
        status:getStatus(json['status'] as String? ?? "",),
        id:json['_id'] as int? ?? 0
    );
  }

  Map<String,dynamic> toJson(){
    return {
      TaskModelConstants.description:description,
      TaskModelConstants.title:title,
      TaskModelConstants.status:status.name,
      TaskModelConstants.category:category,
      TaskModelConstants.deadline:deadline.toString(),
      TaskModelConstants.priority:priority,
    };
  }

  bool canAddTaskToDatabase(){
    if(title.isEmpty) return false;
    if(description.isEmpty) return false;
    if(category.isEmpty) return false;
    if(priority==0) return false;
    return true;
  }
  static TaskModels initialVale=TaskModels(
      title:"",
      description:"",
      category:"",
      deadline:DateTime.now(),
      priority: 0,
      status:TaskStatus.done);
}

TaskStatus getStatus(String statusText, {required}){
  switch(statusText){
    case "processing":{
      return TaskStatus.processing;
    }
    case "canceled":{
      return TaskStatus.canceled;
    }
    case "done":{
      return TaskStatus.done;
    }
    default:{
      return TaskStatus.missed;
    }
  }
}
