import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'success')
  bool? success;
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'isNumberVerified')
  bool? isNumberVerified;
  @JsonKey(name: 'isEmailVerified')
  bool? isEmailVerified;
  @JsonKey(name: 'countryOfResidence')
  String? countryOfResidence;
  @JsonKey(name: 'mainReasonForOpeningThisAccount')
  String? mainReasonForOpeningThisAccount;
  @JsonKey(name: "proofOfResidence")
  ProofOfResidenceResponse? proofOfResidence;
  @JsonKey(name: 'profilePicture')
  String? profilePicture;
  @JsonKey(name: 'isProofOfResidencyVerified')
  bool? isProofOfResidencyVerified;
  @JsonKey(name: 'walletBalance')
  dynamic walletBalance;
  @JsonKey(name: 'stripeCustomerId')
  String? stripeCustomerId;

  UserResponse(this.id, this.name, this.email, this.phoneNumber, this.isNumberVerified, this.isEmailVerified, this.countryOfResidence, this.mainReasonForOpeningThisAccount, this.proofOfResidence, this.profilePicture, this.isProofOfResidencyVerified, this.walletBalance, this.stripeCustomerId);

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class ProofOfResidenceResponse {
  @JsonKey(name: 'passport')
  String? passport;
  @JsonKey(name: 'drivingLiscence')
  String? drivingLiscence;
  @JsonKey(name: 'idCard')
  String? idCard;

  ProofOfResidenceResponse(this.passport, this.drivingLiscence, this.idCard);

  factory ProofOfResidenceResponse.fromJson(Map<String, dynamic> json) => _$ProofOfResidenceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProofOfResidenceResponseToJson(this);
}

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "data")
  UserResponse? user;

  LoginResponse(this.token, this.user);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
