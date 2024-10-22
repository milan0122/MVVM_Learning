import 'package:flutter/material.dart';
import 'package:mvvm_learnig/utility/utils.dart';

import '../colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {required this.title,
      this.loading = false,
      required this.onPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: onPress,
          //(){
          // Utils.toastMessage('No internet connection');

          // Utils.flushBarErrorMessage(
          //     'No Internet Connection',context);
          //Navigator.pushNamed(context, RouteName.home);

          //Utils.snakBar('No internet connection', context);
          //},

          child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
                child:loading ? const CircularProgressIndicator(color: Colors.white,): Text(
              title,
              style: const TextStyle(fontSize: 25),
            )),
          )),
    );
  }
}
