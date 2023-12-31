abstract class SignInState {}

class SignInInitial extends SignInState {}

final class SignInVisibilityState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;

  SignInErrorState(this.message);
}
