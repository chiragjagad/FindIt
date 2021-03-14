

import 'package:find_it/firebase_api.dart';
import 'package:find_it/model/PostItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
class ClaimPage extends StatefulWidget {
  PostItem item;
  ClaimPage({@required this.item});
  @override
  _ClaimPageState createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {
  @override
  Widget build(BuildContext context) {
    bool claimed=false;
    User mUser=FirebaseAuth.instance.currentUser;

    for(String s in widget.item.claimers){
      if(s==mUser.uid){
        claimed=true;
      }
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
          centerTitle: true,

          leading: BackButton(color: Colors.black),
          // title:  new Text('Application Request', style: TextStyle(
          //     fontSize: 20, fontWeight: FontWeight.w600),)
      ),
      body: Container(
        color: AppTheme.nearlyWhite,
        child: SafeArea(
          top: false,
          child: Scaffold(

            backgroundColor: AppTheme.nearlyWhite,
            body: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      left: 16,
                      right: 16),
                  child: Image.asset('lib/images/package.png'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  child: Text(

                    widget.item.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  child: Text(
                    "Found At: "+widget.item.locfound,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 36,left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Think It's Yours?",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      letterSpacing: 1
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16,left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Click on claim below to get in touch with our staff!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 17,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          color: claimed?Colors.grey:Colors.blue,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                offset: const Offset(4, 4),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: Material(

                          color: Colors.transparent,
                          child: AbsorbPointer(
                            absorbing: claimed,
                            child: InkWell(

                              onTap: () async{
                                FirebaseApi api=new FirebaseApi();
                                await api.saveClaim(widget.item);
                                //final scaffold = Scaffold.of(context);
                                // scaffold.showSnackBar(
                                //     SnackBar(
                                //       duration: Duration(seconds: 1),
                                //       content: const Text('Claimed successfully, \n Go to requests to contact our staff.'),
                                //
                                //     ),);
                                setState(() {

                                  claimed=true;
                                });
                              },
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    claimed?'Claimed':'Claim',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      content: const Text('Claimed successfully, \n Go to requests to contact our staff.'),

    ),
  );
}