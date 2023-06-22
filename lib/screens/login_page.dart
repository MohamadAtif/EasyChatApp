import 'package:easychat/cubit/Login_cubit/login_cubit.dart';
import 'package:easychat/cubit/chat_cubit/chat_cubit.dart';
import 'package:easychat/screens/register_page.dart';
import 'package:easychat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_textField.dart';
import 'chat_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });
  String? email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          formkey.currentState!.validate();
              if (state is LoginLoading){
                   LoginLoading();
              }

         else if(state is LoginSucces){
          BlocProvider.of<ChatCubit>(context).getMessages();
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ChatPage(email:email!);
              }));
             }
             else if(state is LoginFailure ){
              LoginFailure(ErrorMessage: 'login failure');
             } else{
           const   Center(child:Text('something is weny wrong'));
             }
        },
        builder: (context, state) =>BodyPage(context),
    
      ),
    );
  }

  Scaffold BodyPage(BuildContext context) {
    return Scaffold(
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
              'SIGN IN',
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
              TextButton: 'Login',
              OnClick: () async {
                if (formkey.currentState!.validate()) {
                 
                    BlocProvider.of<LoginCubit>(context).LoginUser(email: email!, password: password!);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ChatPage(
                          email: email!,
                        );
                      },
                    ));
                 
                }else{}
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("don't have an acount?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                    child: const Text(
                      'Sign Up',
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
      );
  }
}
