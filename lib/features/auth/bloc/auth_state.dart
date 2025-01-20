abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  AuthError(this.error);

  final String error;
}

class AuthLoggedIn extends AuthState {}

class AuthLoggedOut extends AuthState {}
