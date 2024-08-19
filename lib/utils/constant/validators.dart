class AppValidator{
  static String? validateEmail(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  static String? validatePassword(String? value){
    if(value == null|| value.isEmpty){
      return 'Password is required';
    }
    ///check the minimum password length
    if(value.length < 6){
      return 'Password must be at least 6 characters';
    }
    ///check for uppercase letters
    if(!value.contains(RegExp(r'[A-Z]'))){
      return 'Password must contain at least one uppercase letter';
    }
    ///check for the numbers
    if(!value.contains(RegExp(r'[0-9]'))){
      return 'Password must contain at least one number';
    }
    ///check for the special characters
    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return 'Password must contain at least one special character';
    }
    return null;
  }
  static String? validatePhoneNumber(String? value) {
    if (value==null || value.isEmpty){
      return 'Phone number required';
    }

    final phoneRegExp=RegExp(r'^\d{11}$');
    if(!phoneRegExp.hasMatch(value)){
      return 'Invalid phone Number(11 digits phone number required)';
    }
    return null ;
  }
  static String? validateName(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
       if(value.length < 3){
      return 'Please enter More than 3 Words';
    }
    return null;

  }
  static String? validateOther(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your Other';
    }
       if(value.length < 5){
      return 'Please enter More than 3 Words';
    }
    return null;

  }

}