import 'package:easychat/cubit/Login_cubit/login_cubit.dart';
import 'package:easychat/cubit/register_cubit/register_cubit.dart';
import 'package:easychat/screens/chat_page.dart';
import 'package:easychat/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textField.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  String? email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading){
          RegisterLoading();
     
        }else if(state is RegisterSucces){
           Navigator.push(context, MaterialPageRoute(builder: (context){
                return ChatPage(email:email!);
              }));

        }else if (state is LoginFailure){
           LoginFailure(ErrorMessage: 'register failure');
        }
         else{
           const   Center(child:Text('something is weny wrong'));
             }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Image.asset(
                  'images/Chat.png',
                  height: 110,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'EasyChat',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'REGISTER',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                CustomTextField(
                  labelText: 'Enter Email',
                  onChanged: (data) {
                    email = data;
                  },
                  obscureText: false,
                ),
                CustomTextField(
                  obscureText: true,
                  labelText: 'Enter Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                CustomButton(
                  TextButton: 'Register',
                  OnClick: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        BlocProvider.of<RegisterCubit>(context)
                            .RegisterUser(email: email!, password: password!);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ChatPage(
                              email: email!,
                            );
                          },
                        ));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('The password provided is too weak.'),
                            ),
                          );
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'The account already exists for that email.'),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('there was an error.'),
                        ));
                      }
                    } else {}
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("already have an acount"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                const Spacer(
                  flex: 5,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
