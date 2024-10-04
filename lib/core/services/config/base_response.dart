class BaseResponse<T> {
  final T? data;
  final int? statusCode;
  final String? message;

  const BaseResponse({
    this.data,
    required this.statusCode,
    this.message,
  }) : super();

  BaseResponse copyWith({
    String? data,
    int? statusCode,
    String? message,
  }) {
    return BaseResponse(
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
    );
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      data: json["data"],
      statusCode: json["status_code"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
        "statusCode": statusCode,
        "message": message,
      };
}
