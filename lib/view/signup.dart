import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_learnig/res/components/round_button.dart';
import 'package:mvvm_learnig/utility/utils.dart';
import 'package:mvvm_learnig/view/login_screen.dart';
import 'package:mvvm_learnig/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utility/routes/routes_name.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    final authViewModel = Provider.of<AuthViewModel>(context);
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
              RoundButton(
                  title: 'Sign Up',
                  loading: authViewModel.loading,
                  onPress:(){
                    if(emailController.text.isEmpty){
                      Utils.toastMessage('Please enter email ');
                    }
                    else if(passwordController.text.isEmpty){
                      Utils.toastMessage('Please enter Password ');

                    }
                    else if (passwordController.text.length<5){
                      Utils.toastMessage('Please enter 5 digit password');

                    }
                    else{
                      Map data = {
                        'email': emailController.text.toString(),
                        'password': passwordController.text.toString()
                      };
                      authViewModel.signUpApi(data,context);


                    }
                  } ),
              SizedBox(height: height*0.08,),
              Text.rich(TextSpan(
                text: "Already have an Account?",
                style: TextStyle(fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login In ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, RouteName.login);
                      },
                  )
                ],
              ))
            ],
          ),
        )
    );
  }
}