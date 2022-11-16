class FieldValidations {
  String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? validateYoutubeLink(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    } else if(!value.contains("http")) {
      return 'Please enter valid link';
    }
    return null;
  }

  String? validateMobile(String value) {
    if (value.isEmpty) {
      return "Field is Required";
    } else if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Field is Required";
    } else if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Field is Required";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String? validateCPassword(String value, String pass, String cPass) {
    if (value.isEmpty) {
      return "Field is Required";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else if (pass != cPass) {
      return "Password are not same";
    }
    return null;
  }


}
