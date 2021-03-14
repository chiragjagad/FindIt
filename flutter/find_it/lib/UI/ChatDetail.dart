import 'package:find_it/model/ChatMessage.dart';
import 'package:find_it/model/ChatUsers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:find_it/firebase_api.dart';

class ChatDetailPage extends StatefulWidget {
  UserC user;

  ChatDetailPage({@required this.user});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  User mUser = FirebaseAuth.instance.currentUser;
  final fieldText = TextEditingController();
  final _controller = TextEditingController();
  String message = '';

  void sendMessage() async {
    FocusScope.of(context).unfocus();

    await FirebaseApi.uploadMessage(widget.user.idUser, message);

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                      "lib/images/support.png"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.user.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      // SizedBox(
                      //   height: 6,
                      // ),
                      // Text(
                      //   "Online",
                      //   style: TextStyle(
                      //       color: Colors.grey.shade600, fontSize: 13),
                      // ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder<List<Message>>(
              stream: FirebaseApi.getMessages(widget.user.idUser),
              builder: (context, snapshot) {
                // switch (snapshot.connectionState) {
                //   case ConnectionState.waiting:
                //     return Center(child: CircularProgressIndicator());
                //   default:
                //     if (snapshot.hasError) {
                //       return Text('Something Went Wrong Try later');
                //     } else {
                      final messages1 = snapshot.data;
                      List messages=[];
                      for(Message m in messages1){
                        if((m.receiver==mUser.uid)||(m.idUser==mUser.uid)){
                            messages.add(m);
                        }
                      }
                      return ListView.builder(
                        itemCount: messages.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final message = messages[messages.length-index-1];

                          return Container(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 10, bottom: 10),
                              child: Align(
                                alignment: (message.idUser != mUser.uid
                                    ? Alignment.topLeft
                                    : Alignment.topRight),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: (message.idUser != mUser.uid
                                        ? Colors.grey.shade200
                                        : Colors.blue[200]),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    message.message,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ));
                        },
                      );
                //     }
                // }
              }),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: fieldText,
                      onChanged: (value) => setState(() {
                        message = value;
                      }),
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      message.trim().isEmpty ? print("HI") : sendMessage();
                      fieldText.clear();
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget NewMessage(){

  }
}
