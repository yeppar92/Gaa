class AllCoursesModel {
  String? message;
  String? status;
  String? baseUrl;
  List<CourseData>? courseData;

  AllCoursesModel({this.message, this.status, this.courseData});

  AllCoursesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    baseUrl = json['base_url'];
    if (json['data'] != null) {
      courseData = <CourseData>[];
      json['data'].forEach((v) {
        courseData!.add(CourseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['base_url'] = baseUrl;
    if (courseData != null) {
      data['data'] = courseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseData {
  int? id;
  String? title;
  String? code;
  String? slug;
  String? description;
  String? content;
  String? image;
  String? logo;
  int? orderNo;
  int? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  CourseData(
      {this.id,
      this.title,
      this.code,
      this.slug,
      this.description,
      this.content,
      this.image,
      this.logo,
      this.orderNo,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  CourseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    slug = json['slug'];
    description = json['description'];
    content = json['content'];
    image = json['image'];
    logo = json['logo'];
    orderNo = json['order_no'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['code'] = code;
    data['slug'] = slug;
    data['description'] = description;
    data['content'] = content;
    data['image'] = image;
    data['logo'] = logo;
    data['order_no'] = orderNo;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
