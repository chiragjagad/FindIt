
import 'package:find_it/UI/home_screen.dart';
import 'package:find_it/UI/navigationbase.dart';
import 'package:find_it/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:find_it/UI/signin.dart';
class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user =Provider.of<User>(context);

    if(user==null){
      return Signin();
    } else{
      return NavigationHomeScreen();
    }
  }

}