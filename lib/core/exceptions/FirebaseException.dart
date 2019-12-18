class FirebaseException implements Exception {
  String message;

  FirebaseException(this.message);

  @override
  String toString() {
    // TODO: implement toString
    super.toString();
    return message;
  }
}

class FirebaseErrors {
  static throwError(String error) {
    if (error == 'EMAIL_EXISTS') throw FirebaseException("The email address is already in use by another account.");
    else if (error == 'EMAIL_NOT_FOUND') throw FirebaseException("The email address was not founded");
    else if (error == 'INVALID_PASSWORD') throw FirebaseException("Wrong password! Try again.");
    else if (error == 'TOO_MANY_ATTEMPTS_TRY_LATER') throw FirebaseException("Too many atempts!T Try later.");
  }
}