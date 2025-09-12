class ResponseRbJudgement {
  final String? message;
  final List<RbJudgement>? data;

  ResponseRbJudgement({
    this.message,
    this.data,
  });

  factory ResponseRbJudgement.fromJson(Map<String, dynamic> json) {
    return ResponseRbJudgement(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RbJudgement.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}
class RbJudgement {
  final String? id;
  final String? code;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  RbJudgement({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory RbJudgement.fromJson(Map<String, dynamic> json) {
    return RbJudgement(
      id: json['id'] as String?,
      code: json['code']?.toString(),
      name: json['name'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
