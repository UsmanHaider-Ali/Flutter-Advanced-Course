// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..message = json['message'] as String?
  ..success = json['success'] as bool?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone_number'] as String?,
      json['isNumberVerified'] as bool?,
      json['isEmailVerified'] as bool?,
      json['countryOfResidence'] as String?,
      json['mainReasonForOpeningThisAccount'] as String?,
      json['proofOfResidence'] == null
          ? null
          : ProofOfResidenceResponse.fromJson(
              json['proofOfResidence'] as Map<String, dynamic>),
      json['profilePicture'] as String?,
      json['isProofOfResidencyVerified'] as bool?,
      json['walletBalance'],
      json['stripeCustomerId'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'isNumberVerified': instance.isNumberVerified,
      'isEmailVerified': instance.isEmailVerified,
      'countryOfResidence': instance.countryOfResidence,
      'mainReasonForOpeningThisAccount':
          instance.mainReasonForOpeningThisAccount,
      'proofOfResidence': instance.proofOfResidence,
      'profilePicture': instance.profilePicture,
      'isProofOfResidencyVerified': instance.isProofOfResidencyVerified,
      'walletBalance': instance.walletBalance,
      'stripeCustomerId': instance.stripeCustomerId,
    };

ProofOfResidenceResponse _$ProofOfResidenceResponseFromJson(
        Map<String, dynamic> json) =>
    ProofOfResidenceResponse(
      json['passport'] as String?,
      json['drivingLiscence'] as String?,
      json['idCard'] as String?,
    );

Map<String, dynamic> _$ProofOfResidenceResponseToJson(
        ProofOfResidenceResponse instance) =>
    <String, dynamic>{
      'passport': instance.passport,
      'drivingLiscence': instance.drivingLiscence,
      'idCard': instance.idCard,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['token'] as String?,
      json['data'] == null
          ? null
          : UserResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..success = json['success'] as bool?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'token': instance.token,
      'data': instance.user,
    };
