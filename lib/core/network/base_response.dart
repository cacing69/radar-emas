class BaseResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final int? count;
  final String? timestamp;
  final bool? cached;

  const BaseResponse({
    required this.success,
    this.data,
    this.message,
    this.count,
    this.timestamp,
    this.cached,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return BaseResponse(
      success: json['success'] as bool? ?? false,
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : null,
      message: json['message'] as String?,
      count: json['count'] as int?,
      timestamp: json['timestamp'] as String?,
      cached: json['cached'] as bool?,
    );
  }
}
