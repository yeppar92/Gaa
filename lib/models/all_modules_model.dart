class AllModulesModel {
  String? message;
  String? status;
  List<Data>? data;
  String? baseUrl;
  String? baseUrlCourse;
  List<Null>? bannerImage;
  String? bannerBaseUrl;

  AllModulesModel(
      {this.message,
      this.status,
      this.data,
      this.baseUrl,
      this.baseUrlCourse,
      this.bannerImage,
      this.bannerBaseUrl});

  AllModulesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    baseUrl = json['base_url'];
    baseUrlCourse = json['base_url_course'];
   /* if (json['banner_image'] != null) {
      bannerImage = <Null>[];
      json['banner_image'].forEach((v) {
        bannerImage!.add(new Null.fromJson(v));
      });
    }*/
    bannerBaseUrl = json['banner_base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['base_url'] = baseUrl;
    data['base_url_course'] = baseUrlCourse;
    /*if (bannerImage != null) {
      data['banner_image'] = bannerImage!.map((v) => v.toJson()).toList();
    }*/
    data['banner_base_url'] = bannerBaseUrl;
    return data;
  }
}

class Data {
  String? title;
  int? status;
  String? slug;
  String? image;
  String? appContent;
  String? tagline;
  int? categoryId;
  String? mobilevr;
  String? ar;
  String? vr;
  String? mobilevrName;
  String? arName;
  String? vrName;
  int? orderNo;
  int? subParts;

  Data(
      {this.title,
      this.status,
      this.slug,
      this.image,
      this.appContent,
      this.tagline,
      this.categoryId,
      this.mobilevr,
      this.ar,
      this.vr,
      this.mobilevrName,
      this.arName,
      this.vrName,
      this.orderNo,
      this.subParts});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    status = json['status'];
    slug = json['slug'];
    image = json['image'];
    appContent = json['app_content'];
    tagline = json['tagline'];
    categoryId = json['category_id'];
    mobilevr = json['mobilevr'];
    ar = json['ar'];
    vr = json['vr'];
    mobilevrName = json['mobilevr_name'];
    arName = json['ar_name'];
    vrName = json['vr_name'];
    orderNo = json['order_no'];
    subParts = json['sub_parts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['status'] = status;
    data['slug'] = slug;
    data['image'] = image;
    data['app_content'] = appContent;
    data['tagline'] = tagline;
    data['category_id'] = categoryId;
    data['mobilevr'] = mobilevr;
    data['ar'] = ar;
    data['vr'] = vr;
    data['mobilevr_name'] = mobilevrName;
    data['ar_name'] = arName;
    data['vr_name'] = vrName;
    data['order_no'] = orderNo;
    data['sub_parts'] = subParts;
    return data;
  }
}
