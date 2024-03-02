

import 'package:homework12/data/models/task/task_model_constants.dart';
import 'package:homework12/data/models/task/task_status.dart';

class TaskModels {
  final int? id;
  final String title;
  final String description;
  final String category;
  final DateTime deadline;
  final int priority;
  final TaskStatus status;

  TaskModels({
    this.id,
    required this.description,
    required this.title,
    required this.status,
    required this.category,
    required this.deadline,
    required this.priority,
  });

  TaskModels copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    DateTime? deadline,
    int? priority,
    TaskStatus? status,
  }) {
    return TaskModels(
      description: description ?? this.description,
      title: title ?? this.title,
      status: status ?? this.status,
      category: category ?? this.category,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
    );
  }

  factory TaskModels.fromJson(Map<String, dynamic> json) {
    return TaskModels(
      description: json[TaskModelConstants.description] as String? ?? "",
      title: json[TaskModelConstants.title] as String? ?? "",
      status: getStatus(json[TaskModelConstants.status] as String? ?? ""),
      category: json[TaskModelConstants.category] as String? ?? "",
      deadline:
      DateTime.parse(json[TaskModelConstants.deadline] as String? ?? ""),
      priority: json[TaskModelConstants.priority] as int? ?? 1,
      id: json[TaskModelConstants.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TaskModelConstants.description: description,
      TaskModelConstants.title: title,
      TaskModelConstants.status: status.name,
      TaskModelConstants.category: category,
      TaskModelConstants.deadline: deadline.toString(),
      TaskModelConstants.priority: priority,
    };
  }

  bool canAddTaskToDatabase() {
    if (title.isEmpty) return false;
    if (description.isEmpty) return false;
    if (category.isEmpty) return false;
    if (priority == 0) return false;
    return true;
  }

  static TaskModels initialValue = TaskModels(
    description: "",
    title: "",
    status: TaskStatus.processing,
    category: "",
    deadline: DateTime.now(),
    priority: 0,
  );
}

TaskStatus getStatus(String statusText) {
  switch (statusText) {
    case "processing":
      {
        return TaskStatus.processing;
      }
    case "done":
      {
        return TaskStatus.done;
      }
    case "canceled":
      {
        return TaskStatus.canceled;
      }
    default:
      {
        return TaskStatus.missed;
      }
  }
}

