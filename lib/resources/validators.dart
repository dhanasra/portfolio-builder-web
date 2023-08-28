class Validators {

  static String? isNotNullOrEmpty(String? val, String fieldName){
    if(val!=null && val.trim().isNotEmpty){
      return null;
    }else{
      return '$fieldName is required';
    }
  }

  static String? validateEmail(String? val, String fieldName){
    if(val!=null && val.trim().isNotEmpty){
      if(!isValidEmail(val)){
        return 'Invalid email format';
      }
      return null;
    }else{
      return '$fieldName is required';
    }
  }

  static bool isValidEmail(String input) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(input);
  }

  static String? validatePassword(String? val, String fieldName){
    if(val!=null && val.trim().isNotEmpty){
      if(val.length<8){
        return 'Password should contains minimum 8 characters';
      }
      return null;
    }else{
      return '$fieldName is required';
    }
  }

}