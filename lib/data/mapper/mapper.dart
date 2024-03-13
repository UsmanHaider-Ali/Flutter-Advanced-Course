import 'package:flutter_advanced_course/app/extensions.dart';
import 'package:flutter_advanced_course/data/responses/responses.dart';

extension UserResponseMapper on UserResponse? {
  UserResponse toDomain() {
    return UserResponse(this?.id?.isStringNull, this?.name?.isStringNull, this?.email?.isStringNull, this?.phoneNumber?.isStringNull, this?.isNumberVerified?.isBoolNull, this?.isEmailVerified?.isBoolNull, this?.countryOfResidence?.isStringNull, this?.mainReasonForOpeningThisAccount?.isStringNull, this?.proofOfResidence?.toDomain(), this?.profilePicture?.isStringNull, this?.isProofOfResidencyVerified?.isBoolNull, this?.walletBalance, this?.stripeCustomerId?.isStringNull);
  }
}

extension ProofOfResidenceResponseMapper on ProofOfResidenceResponse? {
  ProofOfResidenceResponse toDomain() {
    return ProofOfResidenceResponse(this?.passport?.isStringNull, this?.drivingLiscence?.isStringNull, this?.idCard?.isStringNull);
  }
}

extension LoginResponseMapper on LoginResponse? {
  LoginResponse toDomain() {
    return LoginResponse(this?.token?.isStringNull, this?.user?.toDomain());
  }
}
