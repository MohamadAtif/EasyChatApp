part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSucces extends LoginState {}
class LoginLoading extends LoginState {
}
class LoginFailure extends LoginState {
  String ErrorMessage;
  LoginFailure({required this.ErrorMessage});
}