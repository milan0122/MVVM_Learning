import 'package:flutter/material.dart';
import 'package:mvvm_learnig/utility/routes/routes_name.dart';
import 'package:mvvm_learnig/view_model/services/splash_services.dart';
import 'package:mvvm_learnig/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
              itemBuilder:(context)=>[
                PopupMenuItem(child: InkWell(
                  onTap: (){
                    userPreferences.removeUser().then((value){
                      Navigator.pushNamed(context, RouteName.login);
                    });

                  },
                    child: Text('Log Out')))
              ]
          )

        ],
        centerTitle: true,
        
      ),
    );
  }
}
