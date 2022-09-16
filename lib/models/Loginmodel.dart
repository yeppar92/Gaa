/// message : "Success"
/// status : true
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZGE2NWQ5YjM1YjA2YjFmMWMzNzk3MzFjODQ3N2JlOGRmYTY1OWVhZTQ2YTg3MTQ5MWQ4ZTU4YzRhMDU0NTY2MzZmYWFmZDYwNWU2ZTgxOTYiLCJpYXQiOjE2NjI5NjU4MTAsIm5iZiI6MTY2Mjk2NTgxMCwiZXhwIjoxNjk0NTAxODEwLCJzdWIiOiI3MiIsInNjb3BlcyI6W119.ryL-xx-NGbTvPGDGU8-eg76NGZ5KHvrBy_gcgKsRGhPwQKP2FVFD36C7LBdaobe5228qgcHMmmIY3Yc1cNQp2kq3epiaa4Pl5eUqvp0Yl8Q775GU0NeAwgdvdOJz_FPGnh27i1AyNqbmiyjl24i4nZ51RcKqb0gM33EM3MGbYwy9HUTLyzPrw6rpONPHbDk_gUtckYg8iYda6AO_hbR7zucfWYy_HTqUR2B8L2B_eqWywWighg8CyS_mN0vrOL2_LEmrTIg-lanTRBsGb4dslxDoJGNC_42sy41mIhHOJteuFfiEjTUj0vl1bMINmmtF0K6c9fH3oPCFRYfGTor-sFyoLlNucZ7cRcXflMhVUn0oT8EuECiaV1hh5riJIhpu8gdk7TJMEyKaGJr6RRoyDYyR-JLguglwLZqatu_O5ENwk-XO7Sz33KvWQSQOWi1tfeozCPlkdmq0V1q8a0oCtd_gF87t7ZUq6cVkacOwgFItoG-j7yiNfxrpXyR0xfOGuLOL0OiiGOUJA59rLoze9ub80oWT0oiaFD5I_q9z_6th2K2ViR0gFvnluKccXwR21he0e8UrKtbR9WMLuS781vKVANRUCSbmFvd7YpvQi1k6ebTOMOuSnJJBLB0uy0wRiSYBGhOLT5q_qa89O_R_f6K8jQE2nNFoTQAj5Bjq5TA"
/// user_detail : {"id":72,"group_id":1,"user_name":"Test User","email":"testuser@gaa.com","mobile":"1234567890","date_of_birth":null,"institute":"GAA","email_verified_at":"2022-03-07 06:50:25","password_reset_token":null,"status":1,"created_at":"2021-12-14 06:09:04","updated_at":"2022-09-09 11:00:19","ref":"N50TnDfIGQ8Dm8mR9SlJ","api_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiY2ZjMTcyZmNhMTlhOGRhNDNhZWQyY2EwN2M5NzY1YTU4ZmI0MzZmNWIyZGQ4M2JjMTRiNzEyZjA5MDk2YzQyMGVlZWUzZGNhNzQwMjg0YTMiLCJpYXQiOjE2NjI3MjEyMTksIm5iZiI6MTY2MjcyMTIxOSwiZXhwIjoxNjk0MjU3MjE5LCJzdWIiOiI3MiIsInNjb3BlcyI6W119.kC57kZAYRPlloibM_z-D-XOObzMP4Ayvx0Ota85xO_kv-3UWkHoNCst9mJHRN4UC5qp_CraXhaEGIWOgULMNC6lSw6WouyF-GB_zdl9xbHkzWkt41gaJeP2kKQcjWwQpcCSKS0Mff8DNPHorjfDuvEfhBB0D-eyvipYessH4pqDh40r4bEaDZRqDfrKeOpR_1ZyYVkzDeKC0bec4sf9NYlFUzdufvAfRPxcY13PsjkcD0uWGsq3wz49VXkXFrNkRpI6Xq9wvCSl5sSex8LaweLgEg56ULtnGUlrl3hdknll3icQmnPVnSJxdbWTcLegu-8xoyjHb1IEczBA1POGRR0-IU31NLY2GsxW5ku4IdZSBilrczPpV4GGkv7SkN5dkBimZ8BJ6hXauctxVQfV7KpuF_z2AHmc6MbhRRtPYT_v_9R8KiKoCsrcksGy0HzLSEwNIy_8HRRXtPizfh4jHj3tYS5A0BPzNTsrjHPeXH2wA3zZ80jtCltJHifDj83v9rtAwoIClkmmjh6iUXVWGft3tM2lcU6AoWlEkh-XXrtq2z1vrNR5HVgAeON7H2eK9oO1nTLYasfd4qm8EXi1Y-AeUd3Gd0N_tznRc2-vRXR86snCvneHEZReaLDN0js3f0omlQti8NNZjpMpr3aauv7A7thYRzYvR__YkujgBd9g","country_id":101,"state_id":33,"receive_occasional_updates":0,"profile_photo":"72_profile_photo.jpg","provider_id":null,"provider":null,"is_deleted":1}

class Loginmodel {
  Loginmodel({
      this.message, 
      this.status, 
      this.token, 
      this.userDetail,});

  Loginmodel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    token = json['token'];
    userDetail = json['user_detail'] != null ? UserDetail.fromJson(json['user_detail']) : null;
  }
  String? message;
  bool? status;
  String? token;
  UserDetail? userDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    map['token'] = token;
    if (userDetail != null) {
      map['user_detail'] = userDetail!.toJson();
    }
    return map;
  }

}

/// id : 72
/// group_id : 1
/// user_name : "Test User"
/// email : "testuser@gaa.com"
/// mobile : "1234567890"
/// date_of_birth : null
/// institute : "GAA"
/// email_verified_at : "2022-03-07 06:50:25"
/// password_reset_token : null
/// status : 1
/// created_at : "2021-12-14 06:09:04"
/// updated_at : "2022-09-09 11:00:19"
/// ref : "N50TnDfIGQ8Dm8mR9SlJ"
/// api_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiY2ZjMTcyZmNhMTlhOGRhNDNhZWQyY2EwN2M5NzY1YTU4ZmI0MzZmNWIyZGQ4M2JjMTRiNzEyZjA5MDk2YzQyMGVlZWUzZGNhNzQwMjg0YTMiLCJpYXQiOjE2NjI3MjEyMTksIm5iZiI6MTY2MjcyMTIxOSwiZXhwIjoxNjk0MjU3MjE5LCJzdWIiOiI3MiIsInNjb3BlcyI6W119.kC57kZAYRPlloibM_z-D-XOObzMP4Ayvx0Ota85xO_kv-3UWkHoNCst9mJHRN4UC5qp_CraXhaEGIWOgULMNC6lSw6WouyF-GB_zdl9xbHkzWkt41gaJeP2kKQcjWwQpcCSKS0Mff8DNPHorjfDuvEfhBB0D-eyvipYessH4pqDh40r4bEaDZRqDfrKeOpR_1ZyYVkzDeKC0bec4sf9NYlFUzdufvAfRPxcY13PsjkcD0uWGsq3wz49VXkXFrNkRpI6Xq9wvCSl5sSex8LaweLgEg56ULtnGUlrl3hdknll3icQmnPVnSJxdbWTcLegu-8xoyjHb1IEczBA1POGRR0-IU31NLY2GsxW5ku4IdZSBilrczPpV4GGkv7SkN5dkBimZ8BJ6hXauctxVQfV7KpuF_z2AHmc6MbhRRtPYT_v_9R8KiKoCsrcksGy0HzLSEwNIy_8HRRXtPizfh4jHj3tYS5A0BPzNTsrjHPeXH2wA3zZ80jtCltJHifDj83v9rtAwoIClkmmjh6iUXVWGft3tM2lcU6AoWlEkh-XXrtq2z1vrNR5HVgAeON7H2eK9oO1nTLYasfd4qm8EXi1Y-AeUd3Gd0N_tznRc2-vRXR86snCvneHEZReaLDN0js3f0omlQti8NNZjpMpr3aauv7A7thYRzYvR__YkujgBd9g"
/// country_id : 101
/// state_id : 33
/// receive_occasional_updates : 0
/// profile_photo : "72_profile_photo.jpg"
/// provider_id : null
/// provider : null
/// is_deleted : 1

class UserDetail {
  UserDetail({
      this.id, 
      this.groupId, 
      this.userName, 
      this.email, 
      this.mobile, 
      this.dateOfBirth, 
      this.institute, 
      this.emailVerifiedAt, 
      this.passwordResetToken, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.ref, 
      this.apiToken, 
      this.countryId, 
      this.stateId, 
      this.receiveOccasionalUpdates, 
      this.profilePhoto, 
      this.providerId, 
      this.provider, 
      this.isDeleted,});

  UserDetail.fromJson(dynamic json) {
    id = json['id'];
    groupId = json['group_id'];
    userName = json['user_name'];
    email = json['email'];
    mobile = json['mobile'];
    dateOfBirth = json['date_of_birth'];
    institute = json['institute'];
    emailVerifiedAt = json['email_verified_at'];
    passwordResetToken = json['password_reset_token'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ref = json['ref'];
    apiToken = json['api_token'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    receiveOccasionalUpdates = json['receive_occasional_updates'];
    profilePhoto = json['profile_photo'];
    providerId = json['provider_id'];
    provider = json['provider'];
    isDeleted = json['is_deleted'];
  }
  int? id;
  int? groupId;
  String? userName;
  String? email;
  String? mobile;
  dynamic? dateOfBirth;
  String? institute;
  String? emailVerifiedAt;
  dynamic? passwordResetToken;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? ref;
  String? apiToken;
  int? countryId;
  int? stateId;
  int? receiveOccasionalUpdates;
  String? profilePhoto;
  dynamic? providerId;
  dynamic? provider;
  int? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['group_id'] = groupId;
    map['user_name'] = userName;
    map['email'] = email;
    map['mobile'] = mobile;
    map['date_of_birth'] = dateOfBirth;
    map['institute'] = institute;
    map['email_verified_at'] = emailVerifiedAt;
    map['password_reset_token'] = passwordResetToken;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['ref'] = ref;
    map['api_token'] = apiToken;
    map['country_id'] = countryId;
    map['state_id'] = stateId;
    map['receive_occasional_updates'] = receiveOccasionalUpdates;
    map['profile_photo'] = profilePhoto;
    map['provider_id'] = providerId;
    map['provider'] = provider;
    map['is_deleted'] = isDeleted;
    return map;
  }

}