import 'package:flutter_advanced_course/app/extensions.dart';
import 'package:flutter_advanced_course/data/response/response.dart';
import 'package:flutter_advanced_course/domain/model.dart';

const String _defaultString = "";
const bool _defaultBool = false;

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
      this?.id?.isStringNull ?? _defaultString,
      this?.name!.isStringNull ?? _defaultString,
      this?.email?.isStringNull ?? _defaultString,
      this?.phoneNumber?.isStringNull ?? _defaultString,
      this?.isNumberVerified?.isBoolNull ?? _defaultBool,
      this?.isEmailVerified?.isBoolNull ?? _defaultBool,
      this?.countryOfResidence?.isStringNull ?? _defaultString,
      this?.mainReasonForOpeningThisAccount?.isStringNull ?? _defaultString,
      this?.proofOfResidence?.toDomain() ?? ProofOfResidence("", "", ""),
      this?.profilePicture?.isStringNull ?? _defaultString,
      this?.isProofOfResidencyVerified?.isBoolNull ?? _defaultBool,
      this?.walletBalance,
      this?.stripeCustomerId?.isStringNull ?? _defaultString,
    );
  }
}

extension ProofOfResidenceResponseMapper on ProofOfResidenceResponse? {
  ProofOfResidence toDomain() {
    return ProofOfResidence(
      this?.passport?.isStringNull ?? _defaultString,
      this?.drivingLiscence?.isStringNull ?? _defaultString,
      this?.idCard?.isStringNull ?? _defaultString,
    );
  }
}

extension LoginResponseMapper on LoginResponse? {
  Login toDomain() {
    return Login(
      this?.user?.toDomain() ?? User("", "", "", "", false, false, "", "", ProofOfResidence("", "", ""), "", false, 0, ""),
      this?.token?.isStringNull ?? _defaultString,
    );
  }
}
