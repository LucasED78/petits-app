class User {
  String id;
  String email;
  String password;
  String token;
  static User _instance;

  User._({
    this.id,
    this.email,
    this.password,
    this.token
  });

  factory User({
    id,
    email,
    password,
    token
  }) {
    if (_instance == null) _instance = User._(
      id: id,
      email: email,
      password: password,
      token: token
    );

    return _instance;
  }

  factory User.fromJSON(dynamic data){
    return User(
      id: data['id'],
      email: data['email'],
      password: data['password'],
      token: data['token']
    );
  }

 Map<String, String> toJSON() {
   Map<String, String> userMap = {
     "email": email,
     "password": password,
     "token": token
   };

   if (id != null) userMap['id'] = id;

   return userMap.cast<String, String>();
 }
}