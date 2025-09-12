
class ResponseAuthLogin {
  ResponseAuthLogin({
    this.message,
    this.data,
  });

  ResponseAuthLogin.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataAuthLogin.fromJson(json['data']) : null;
  }

  String? message;
  DataAuthLogin? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class DataAuthLogin {
  DataAuthLogin({
    this.token,
    this.user,
   
  });

  DataAuthLogin.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
   
  }

  String? token;
  User? user;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
   
    return map;
  }
}
class User {
  User({
    this.id,
    this.email,
    this.passwordLastUpdatedAt,
    this.passwordLastUpdatedAtToString,
    this.fullname,
    this.isActive,
    this.avatarPath,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    passwordLastUpdatedAt = json['passwordLastUpdatedAt'];
    passwordLastUpdatedAtToString = json['passwordLastUpdatedAtToString'];
    fullname = json['fullname'];
    isActive = json['isActive'];
    avatarPath = json['avatarPath'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  String? id;
  String? email;
  String? passwordLastUpdatedAt;
  String? passwordLastUpdatedAtToString;
  String? fullname;
  bool? isActive;
  String? avatarPath;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['passwordLastUpdatedAt'] = passwordLastUpdatedAt;
    map['passwordLastUpdatedAtToString'] = passwordLastUpdatedAtToString;
    map['fullname'] = fullname;
    map['isActive'] = isActive;
    map['avatarPath'] = avatarPath;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['deletedAt'] = deletedAt;
    return map;
  }
}
