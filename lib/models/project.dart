class Project {
  int? idProject;
  String? projectName;
  String? description;
  String? category;
  String? deadline;
  String? priority;
  String? createdAt;
  String? userId;

  Project(
      {this.idProject,
      this.projectName,
      this.description,
      this.category,
      this.deadline,
      this.priority,
      this.createdAt,
      this.userId});

  Project.fromJson(Map<String, dynamic> json) {
    idProject = json['id_project'];
    projectName = json['project_name'];
    description = json['description'];
    category = json['category'];
    deadline = json['deadline'];
    priority = json['priority'];
    createdAt = json['created_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_project'] = idProject;
    data['project_name'] = projectName;
    data['description'] = description;
    data['category'] = category;
    data['deadline'] = deadline;
    data['priority'] = priority;
    data['created_at'] = createdAt;
    data['user_id'] = userId;
    return data;
  }
}
