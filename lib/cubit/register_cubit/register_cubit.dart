import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


Future <void>RegisterUser({required String email,required String password})async{
   
   emit(RegisterLoading());
try { 

  UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  FirebaseAuth auth = FirebaseAuth.instance;
     emit(RegisterSucces());
}  on FirebaseAuthException catch (e) {
                      if (e.code == 'user not found') {
                        emit(RegisterFailure(ErrorMessage: 'user not found',));
                      } else if (e.code == 'email-already-in-use') {
                        emit(RegisterFailure(ErrorMessage: 'email-already-in-use'));
                      }
                    } catch (e) {
                    emit(RegisterFailure(ErrorMessage: '$e'));   
                    }

}
}