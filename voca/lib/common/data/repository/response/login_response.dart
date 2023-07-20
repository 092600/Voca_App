class LoginRespinse {
  static String getLoginResponse({
    required String status,
  }) {
    switch (status) {
      case "ACTIVE":
        return "VALIDATE";
      case "NEED_PREPARE":
        return "NEED_PREPARE";
      default:
        return "UNVALIDATE";
    }
  }
}
