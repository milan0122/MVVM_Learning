import 'package:flutter/material.dart';
import 'package:mvvm_learnig/res/components/round_button.dart';
import 'package:mvvm_learnig/utility/utils.dart';

import '../utility/routes/routes_name.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> visibility = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text('MVVM Learning'),
          centerTitle: true,
        ),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType:TextInputType.emailAddress,
              controller: emailController,
              focusNode: emailFocusNode,
              decoration:const InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value){
                //FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.FieldFocusChange(context, emailFocusNode,passwordFocusNode);

              },

            ),
            ValueListenableBuilder(valueListenable:visibility , builder: (context,value,child){
              return TextFormField(
                controller: passwordController,
                obscureText: visibility.value,
                obscuringCharacter: '*',
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                    hintText: 'Password',
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                        onTap: (){
                          visibility.value =!visibility.value;
                        },
                        child:Icon(visibility.value?Icons.visibility_off:Icons.visibility))
                ),

              );
            }),


           SizedBox(height: height * .09,),
            RoundButton(title: 'Login', onPress:(){
              if(emailController.text.isEmpty){
                Utils.toastMessage('Please enter email ');
              }
              else if(passwordController.text.isEmpty){
                Utils.toastMessage('Please enter Password ');

              }
              else if (passwordController.text.length<6){
                Utils.toastMessage('Please enter 6 digit password');

              }
              else{
               print("login success");

              }
            } ),
          ],
        ),
      )
    );
  }
}
