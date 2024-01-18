sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class IsPasswordLoadingState extends AuthState {}

final class IsPasswordSuccessState extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpErrorState extends AuthState {}
