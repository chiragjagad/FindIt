
import 'package:find_it/UI/ChatPage.dart';
import 'package:find_it/services/auth.dart';
import 'package:find_it/wrapper/Wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome. setEnabledSystemUIOverlays([]);
  //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  await Firebase.initializeApp();
  runApp(StreamProvider<User>.value(
    value: AuthService().user,
    child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title:"DJCSI",
        color: Colors.white,
        home:Wrapper()),
  ));
}

