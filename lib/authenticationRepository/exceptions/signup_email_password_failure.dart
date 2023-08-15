class signUpWidgetEmailAndPasswordFailure {
  final String message;

  signUpWidgetEmailAndPasswordFailure(
      [this.message = "As Unknown error occurred."]);

  factory signUpWidgetEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return signUpWidgetEmailAndPasswordFailure(
            'Please enter a stronger password');
      case 'invalid-email':
        return signUpWidgetEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return signUpWidgetEmailAndPasswordFailure(
            'An Account already exists for that email.');
      case 'Operation-not-allowed':
        return signUpWidgetEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return signUpWidgetEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      default:
        return signUpWidgetEmailAndPasswordFailure();
    }
  }
}
