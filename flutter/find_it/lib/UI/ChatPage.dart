import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_it/loading.dart';
import 'package:find_it/model/ChatUsers.dart';
import 'package:find_it/model/PostItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../app_theme.dart';
import '../firebase_api.dart';
import 'ChatDetail.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  User mFirebaseUser;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  int _limit = 20;
  int _limitIncrement = 20;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    mFirebaseUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 0.07*MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Requests",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<List<PostItem>>(
                stream: FirebaseApi.getItems(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Text('Something Went Wrong Try later');
                      } else {
                        final items1 = snapshot.data;


                        if (items1.isEmpty) {
                          return Text('No Users Found');
                        } else{
                          List<PostItem> items=[];
                          for(PostItem item in items1){
                            if(item.claimers.contains(mFirebaseUser.uid)){
                              items.add(item);
                            }
                          }
                          return ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 16),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildItem(context, items[index]),
                            // itemBuilder: (context, index) {
                            //   return ConversationList(
                            //     name: chatUsers[index].name,
                            //     messageText: chatUsers[index].messageText,
                            //     imageUrl: chatUsers[index].image,
                            //     time: chatUsers[index].time,
                            //     isMessageRead:
                            //         (index == 0 || index == 3) ? true : false,
                            //   );
                            // },
                          );}
                      }
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, PostItem item) {
    return GestureDetector(
      onTap: () async{
        print(item.admin.toString());
        UserC user=await FirebaseFirestore.instance.collection('users').doc(item.admin).get().then((value) {
          print(value.data());
          return UserC.fromJson(value.data());
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage(user: user,);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("lib/images/package.png"),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.description,
                            style: TextStyle(fontWeight: FontWeight.w400,
                              fontSize: 19,
                              letterSpacing: 0.27,
                              color: AppTheme.darkerText,),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          // Text(
                          //   widget.messageText,
                          //   style: TextStyle(
                          //       fontSize: 13,
                          //       color: Colors.grey.shade600,
                          //       fontWeight: FontWeight.normal),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Text(
            //   widget.time,
            //   style: TextStyle(
            //       fontSize: 12,
            //       fontWeight: FontWeight.normal),
            // ),
          ],
        ),
      ),
    );
  }
}

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;

  ConversationList(
      {@required this.name,
      @required this.messageText,
      @required this.imageUrl,
      @required this.time,
      @required this.isMessageRead});

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
