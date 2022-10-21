mixin InputValidationMixin {
  String? validatePassword(String? password) {
    password = password ?? "";
    if (password.trim().isEmpty) {
      return "Contraseña no puede ser vacia";
    } else if (password.length < 4) {
      return "Contraseña no puede ser menos de 4 caracteres";
    }
    return null;
  }

  String? validateEmail(String? email) {
    email = email ?? "";
    if (email.trim().isEmpty) {
      return "Email no puede ser vacio";
    } else {
      RegExp regex = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      if (!regex.hasMatch(email.trim())) {
        return "Correo invalido";
      } else {
        return null;
      }
    }
  }
}