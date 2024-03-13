class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class User {
  String id;
  String name;
  String email;
  String phoneNumber;
  bool isNumberVerified;
  bool isEmailVerified;
  String countryOfResidence;
  String mainReasonForOpeningThisAccount;
  ProofOfResidence proofOfResidence;
  String profilePicture;
  bool isProofOfResidencyVerified;
  double walletBalance;
  String stripeCustomerId;

  User(this.id, this.name, this.email, this.phoneNumber, this.isNumberVerified, this.isEmailVerified, this.countryOfResidence, this.mainReasonForOpeningThisAccount, this.proofOfResidence, this.profilePicture, this.isProofOfResidencyVerified, this.walletBalance, this.stripeCustomerId);
}

class ProofOfResidence {
  String passport;
  String drivingLiscence;
  String idCard;

  ProofOfResidence(this.passport, this.drivingLiscence, this.idCard);
}

class Login {
  User user;
  String token;

  Login(this.user, this.token);
}
