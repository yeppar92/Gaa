class SubModulesModel {
  String? message;
  String? status;
  List<Data>? data;
  String? baseUrl;

  SubModulesModel({this.message, this.status, this.data, this.baseUrl});

  SubModulesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['base_url'] = baseUrl;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? code;
  String? slug;
  String? image;
  String? ar;
  String? vr;
  String? mobilevr;
  String? arName;
  String? vrName;
  String? mobilevrName;
  String? content;
  String? about;
  int? categoryId;
  int? orderNo;
  int? subParts;
  int? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.code,
      this.slug,
      this.image,
      this.ar,
      this.vr,
      this.mobilevr,
      this.arName,
      this.vrName,
      this.mobilevrName,
      this.content,
      this.about,
      this.categoryId,
      this.orderNo,
      this.subParts,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    slug = json['slug'];
    image = json['image'];
    ar = json['ar'];
    vr = json['vr'];
    mobilevr = json['mobilevr'];
    arName = json['ar_name'];
    vrName = json['vr_name'];
    mobilevrName = json['mobilevr_name'];
    content = json['content'];
    about = json['about'];
    categoryId = json['category_id'];
    orderNo = json['order_no'];
    subParts = json['sub_parts'];
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
    data['image'] = image;
    data['ar'] = ar;
    data['vr'] = vr;
    data['mobilevr'] = mobilevr;
    data['ar_name'] = arName;
    data['vr_name'] = vrName;
    data['mobilevr_name'] = mobilevrName;
    data['content'] = content;
    data['about'] = about;
    data['category_id'] = categoryId;
    data['order_no'] = orderNo;
    data['sub_parts'] = subParts;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
