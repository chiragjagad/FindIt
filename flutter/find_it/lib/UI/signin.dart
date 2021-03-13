
import 'package:find_it/UI/navigationbase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:find_it/services/auth.dart';

class Signin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return(new SigninState());
    throw UnimplementedError();
  }

}
class SigninState extends State {
  void initState() {
    super.initState();

    mUserPointsRef = databaseReference.child('userPoints');
    //databaseReference.child('userPoints').once().then((value) => result=value);
  }
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  String error = '';
  final databaseReference = FirebaseDatabase.instance.reference();
  User mFirebaseUser = FirebaseAuth.instance.currentUser;
  DatabaseReference mUserPointsRef;
  @override
  Widget build(BuildContext context) {
    return (
        new Scaffold(
            body: new Container(
              color: Colors.white,
              child: Column(
                children: [
                  new Expanded(flex:3,child: new Container(color: Colors.white)),
                  new Expanded(
                      flex:3,
                      child: Container(
                        child: Center(
                          child:Image.asset("lib/images/search.png")
                        ),
                      )),
                  new Expanded(
                      flex: 6,
                      child: Text(
                        'Welcomes You!'
                        ,style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),)
                  ),
                  // new Expanded(child: new Container(color: Colors.black)),
                  Expanded(
                    flex: 0,
                    child: Text('Login With:'
                      ,style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),),
                  ),
                  new Expanded(
                      flex: 4,
                      child: new Container(
                          child: new Row(
                              children:[
                                new Expanded(child: new Container(color: Colors.white,)),
                                new Expanded(
                                    child:Container(
                                        height: 70,
                                        decoration:BoxDecoration(
                                          border:Border.all(color: HexColor("#03FDFC")),
                                          shape: BoxShape.circle,),
                                        child: IconButton(
                                          icon: new Image.asset('lib/images/Google Logo.png',height: 40,width: 45,),
                                          color: Colors.black,
                                          onPressed:() async {

                                            User result = await _auth.signInWithGoogle();
                                            if (result == null) {
                                              setState(() {
                                                error = "Error.";
                                                print(error);
                                                print("ERROR");
                                              });
                                            }
                                            else {

                                              print("done $result");
                                              Navigator.push((context), MaterialPageRoute(builder: (context) => NavigationHomeScreen(),));
                                            }
                                          },
                                        )
                                    )),

                                new Expanded(child: new Container(color: Colors.white,)),

                              ]
                          )
                      )
                  ),
                  new Expanded( flex:7,child: new Container())
                ],
              ),
            )

        )

    );
    throw UnimplementedError();
  }

}

