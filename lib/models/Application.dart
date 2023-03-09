class Application {
  String? id;
  String? createDate;
  String? description;
  int? status;

  Application({
    this.id,
    this.createDate,
    this.description,
    this.status
  });

  Application.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    createDate = json['createDate'] ?? "";
    description = json['description'] ?? "";
    status = json['status'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['createDate'] = this.createDate;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}