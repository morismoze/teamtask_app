class ApiResponse<T> {
  bool isSuccess;
  T? data;
  List<ApiError> errors;

  ApiResponse({
    required this.isSuccess,
    this.data,
    required this.errors,
  });

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic)? fromJsonT) =>
      ApiResponse(
        isSuccess: json["isSuccess"],
        data: json["data"] != null && fromJsonT != null
            ? fromJsonT(json["data"])
            : null,
        errors: List<ApiError>.from(
            json["errors"].map((x) => ApiError.fromJson(x))),
      );
}

class ApiError {
  String? field;
  String message;

  ApiError({
    this.field,
    required this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        field: json["field"],
        message: json["message"],
      );
}
