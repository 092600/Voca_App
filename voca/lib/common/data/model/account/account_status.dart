enum AccountStatus {
  ACTIVE,
  NEED_PREPARE,
  NONE;

  static AccountStatus getAccountStatusFromString({
    required String statusStr,
  }) {
    switch (statusStr) {
      case "ACTIVE":
        return AccountStatus.ACTIVE;
      case "NEED_PREPARE":
        return AccountStatus.NEED_PREPARE;

      default:
        return AccountStatus.NONE;
    }
  }
}
