part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterSucces  extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterFailure extends RegisterState {
   String? ErrorMessage;
  RegisterFailure({ required String ErrorMessage});
}