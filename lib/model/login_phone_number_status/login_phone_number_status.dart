import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_phone_number_status.g.dart';

@JsonSerializable()
class LoginPhoneNumberStatus extends Equatable {
  final String? result;
  final String? data;

  const LoginPhoneNumberStatus({this.result, this.data});

  factory LoginPhoneNumberStatus.fromJson(Map<String, dynamic> json) {
    return _$LoginPhoneNumberStatusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginPhoneNumberStatusToJson(this);

  @override
  List<Object?> get props => [result, data];
}
