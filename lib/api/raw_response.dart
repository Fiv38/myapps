class RawResponse {
  final int? responseCode;
  final bool status;
  final String message;
  final dynamic data;

  RawResponse({
    required this.responseCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory RawResponse.fromJson(Map<String, dynamic> json) {
    return RawResponse(
      responseCode: json['responseCode'] as int?,
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'responseCode': responseCode,
      'status': status,
      'message': message,
      'data': data,
    };
  }

  RawResponse copyWith({
    int? responseCode,
    bool? status,
    String? message,
    dynamic data,
  }) {
    return RawResponse(
      responseCode: responseCode ?? this.responseCode,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is RawResponse &&
            other.responseCode == responseCode &&
            other.status == status &&
            other.message == message &&
            other.data == data);
  }

  @override
  int get hashCode =>
      responseCode.hashCode ^
      status.hashCode ^
      message.hashCode ^
      data.hashCode;
}
