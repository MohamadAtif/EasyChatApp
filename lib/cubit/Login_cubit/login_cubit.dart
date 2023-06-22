
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

Future <void>LoginUser({required String email,required String password})async{
   
   emit(LoginLoading());
      
    try {
  UserCredential user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  FirebaseAuth auth = FirebaseAuth.instance;
  emit(LoginSucces());
} on FirebaseAuthException catch (e) {
                      if (e.code == 'user not found') {
                        emit(LoginFailure(ErrorMessage: 'user not found'));
                      } else if (e.code == 'email-already-in-use') {
                        emit(LoginFailure(ErrorMessage: 'email-already-in-use'));
                      }
                    } catch (e) {
                    emit(LoginFailure(ErrorMessage: '$e'));   
                    }


}

}

