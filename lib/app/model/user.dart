class User {
  String id;
  String email;
  String password;
  String token;
  static User _instance;

  User._({
    this.email,
    this.password
  });

  factory User({
    email,
    password
  }) {
    if (_instance == null) _instance = User._(
      email: email,
      password: password
    );

    return _instance;
  }

 Map<String, String> toJSON() {
   return {
     "email": email,
     "password": password
   };
 }
}