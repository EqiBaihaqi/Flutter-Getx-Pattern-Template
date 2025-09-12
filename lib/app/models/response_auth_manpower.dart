class ResponseManpower {
  ResponseManpower({
    this.message,
    this.data,
  });

  ResponseManpower.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? ManpowerData.fromJson(json['data']) : null;
  }

  String? message;
  ManpowerData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class ManpowerData {
  ManpowerData({
    this.id,
    this.idManpower,
    this.label,
    this.createdAt,
    this.updatedAt,
  });

  ManpowerData.fromJson(dynamic json) {
    id = json['id'];
    idManpower = json['idManpower'];
    label = json['label'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? idManpower;
  String? label;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['idManpower'] = idManpower;
    map['label'] = label;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
