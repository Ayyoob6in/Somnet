class OtpResponse {
  final String? result;
  final int? errorCode;
  final String? errorDesc;
  final String? data;
  final String? refreshToken;

  OtpResponse({
    this.result,
    this.errorCode,
    this.errorDesc,
    this.data,
    this.refreshToken,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      result: json['result'],
      errorCode: json['errorCode'],
      errorDesc: json['errorDesc'],
      data: json['data'],
      refreshToken: json['refreshToken'],
    );
  }
}
