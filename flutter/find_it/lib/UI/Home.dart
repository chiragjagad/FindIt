import 'package:find_it/model/PostItem.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../app_theme.dart';
import '../firebase_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int a=0,b=0,c=0;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme.nearlyWhite,
        child: SafeArea(
            top: false,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(children: <Widget>[
                  // Container(
                  //   padding: EdgeInsets.only(
                  //       top: MediaQuery.of(context).padding.top,
                  //       left: 16,
                  //       right: 16),
                  //   child: Text(""),
                  // ),
                  SizedBox(
                    height: 0.07 * MediaQuery.of(context).size.height,
                  ),

                  Expanded(
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(
                              child: Column(children: <Widget>[
                            Container(
                              child: Center(
                                  child: Image.asset(
                                "lib/images/search.png",
                                width: 150,
                                height: 150,
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15,bottom: 15),
                              child: Text(
                                'WELCOME TO FINDIT',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2),
                              ),
                            ),
                            StreamBuilder<List<PostItem>>(
                                stream: FirebaseApi.getItems(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Center(
                                          child: CircularProgressIndicator());
                                    default:
                                      if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return Text(
                                            'Something Went Wrong Try later');
                                      } else {
                                        final items=snapshot.data;
                                        a=items.length;
                                        for(PostItem i in items){
                                          if(i.claimedby.isEmpty){
                                            c++;
                                          } else{
                                            b++;
                                          }
                                        }
                                        return Container(
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          child: Column(
                                            children: [
                                              Card(
                                                  margin: EdgeInsets.only(bottom: 20),
                                                elevation:10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),

                                                  child: new Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(

                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(8.0),
                                                                    topRight: Radius.circular(8.0),
                                                                    bottomLeft: Radius.circular(8.0),
                                                                    bottomRight: Radius.circular(8.0)

                                                                ),

                                                                image: DecorationImage(
                                                                    image: AssetImage('lib/images/unnamed.png'),

                                                                    fit: BoxFit.fitWidth
                                                                )

                                                            ),
                                                            height:110,
                                                            child:Container(
                                                              alignment: Alignment.centerLeft,
                                                              margin: EdgeInsets.only(left: 40,),

                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    margin:EdgeInsets.only(bottom:5),
                                                                    child: Text("TOTAL ITEMS",style: TextStyle(
                                                                        color: HexColor("#1247d0"),
                                                                        fontSize: 17,
                                                                        fontWeight: FontWeight.w500,
                                                                        letterSpacing: 1),),
                                                                    alignment: Alignment.centerLeft,
                                                                  ),
                                                                  Container(
                                                                    child: Text(a.toString(),style: TextStyle(

                                                                        fontSize: 19,
                                                                        fontWeight: FontWeight.w500,
                                                                        letterSpacing: 1)),
                                                                    alignment: Alignment.centerLeft,
                                                                  )
                                                                ],
                                                              ),
                                                            )


                                                        ),
                                                      ])),
                                              Card(
                                                margin: EdgeInsets.only(bottom: 20),
                                                  elevation:10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),

                                                  child: new Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                      children: [
                                                        Container(

                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(8.0),
                                                                  topRight: Radius.circular(8.0),
                                                                  bottomLeft: Radius.circular(8.0),
                                                                  bottomRight: Radius.circular(8.0)

                                  ),

                                                            image: DecorationImage(
                                                              image: AssetImage('lib/images/unnamed2.png'),

                                                              fit: BoxFit.fitWidth
                                                            )

                                                          ),
                                                          height:110,
                                                          child:Container(
                                                            alignment: Alignment.centerLeft,
                                                            margin: EdgeInsets.only(left: 40,),

                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin:EdgeInsets.only(bottom:5),
                                                                  child: Text("FOUND ITEMS",style: TextStyle(
                                                                      color: HexColor("#eec255"),
                                                                      fontSize: 17,
                                                                      fontWeight: FontWeight.w500,
                                                                      letterSpacing: 1),),
                                                                  alignment: Alignment.centerLeft,
                                                                ),
                                                                Container(
                                                                  child: Text(b.toString(),style: TextStyle(

                                                                      fontSize: 19,
                                                                      fontWeight: FontWeight.w500,
                                                                      letterSpacing: 1)),
                                                                  alignment: Alignment.centerLeft,
                                                                )
                                                              ],
                                                            ),
                                                          )


                                                        ),
                                                      ])),
                                              Card(
                                                  margin: EdgeInsets.only(bottom: 20),
                                                  elevation:10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),

                                                  child: new Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                      children: [
                                                        Container(

                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(8.0),
                                                                    topRight: Radius.circular(8.0),
                                                                    bottomLeft: Radius.circular(8.0),
                                                                    bottomRight: Radius.circular(8.0)

                                                                ),

                                                                image: DecorationImage(
                                                                    image: AssetImage('lib/images/unnamed1.png'),

                                                                    fit: BoxFit.fitWidth
                                                                )

                                                            ),
                                                            height:110,
                                                            child:Container(
                                                              alignment: Alignment.centerLeft,
                                                              margin: EdgeInsets.only(left: 40,),

                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    margin:EdgeInsets.only(bottom:5),
                                                                    child: Text("PENDING ITEMS",style: TextStyle(
                                                                        color: HexColor("#43c094"),
                                                                        fontSize: 17,
                                                                        fontWeight: FontWeight.w500,
                                                                        letterSpacing: 1),),
                                                                    alignment: Alignment.centerLeft,
                                                                  ),
                                                                  Container(

                                                                    child: Text(c.toString(),
                                                                        style: TextStyle(

                                                                        fontSize: 19,
                                                                        fontWeight: FontWeight.w500,
                                                                        letterSpacing: 1)),
                                                                    alignment: Alignment.centerLeft,
                                                                  )
                                                                ],
                                                              ),
                                                            )


                                                        ),
                                                      ])),
                                            ],
                                          ),
                                        );
                                      }
                                  }
                                })
                          ]))))
                ]))));
  }
}
