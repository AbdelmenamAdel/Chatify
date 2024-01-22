sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class IsPasswordLoadingState extends AuthState {}

final class IsPasswordSuccessState extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpErrorState extends AuthState {}

final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {
  final String email;

  SignInSuccessState(this.email);
}

final class SignInErrorState extends AuthState {}

final class SignOutLoadingState extends AuthState {}

final class SignOutSuccessState extends AuthState {}

final class SignOutErrorState extends AuthState {}
