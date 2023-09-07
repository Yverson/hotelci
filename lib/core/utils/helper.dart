class Helper {
  static bool isEmail(String em) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(em);
  }

  static bool isPassword(String em) {
    return em.length > 5;
  }

  static bool isPhoneNumber(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length >= 10);
  }

  static bool iscardNo(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length >= 16);
  }

  static bool isCVV(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length == 3);
  }
}
