extension NonNullString on String? {
  String get isStringNull => this ?? "";
}

extension NonNullInteger on int? {
  int get isIntNull => this ?? 0;
}

extension NonNullBool on bool? {
  bool get isBoolNull => this ?? false;
}
