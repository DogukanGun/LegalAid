
class User{
  String email;
  String password;

  User({required this.email,required this.password});

  Map<String, dynamic> getUserForFirebase(){
    return {
      "email": email,
      "password": password,
    };
  }
}