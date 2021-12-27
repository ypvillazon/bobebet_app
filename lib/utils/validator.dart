
class Validator {

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return "";
  }

  String validatePhone(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El número es requerido";
    } else if (value.length != 8) {
      return "El número debe tener 8 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "El número debe tener solo dígitos";
    }
    return "";
  }

  String validateNumber(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return "El número debe tener solo dígitos";
    }
    return "";
  }

  String validatePasswordLength(String value){
    if(value.length==0){
      return "Password can't be empty";
    } else if (value.length < 10){
      return "Password must be longer than 10 characters";
    }
    return "";
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "La dirección de correo es obligatorio.";
    } else if (!regExp.hasMatch(value)) {
      return "Dirección de correo no válido.";
    } else {
      return "";
    }
  }

  bool isEmpty(String v) {
    return (v == null || v == "");
  }
}
