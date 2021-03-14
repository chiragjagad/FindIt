import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_it/model/PostItem.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:find_it/model/ChatMessage.dart';
import 'package:find_it/model/ChatUsers.dart';

import './utils.dart';

class FirebaseApi {

  Future saveClaim(PostItem item) async {
    User mUser=FirebaseAuth.instance.currentUser;
    final refUsers = FirebaseFirestore.instance.collection('lost-items');
    item.claimers.add( mUser.uid);
    await refUsers
        .doc(item.idX)
        .update({'claimers': item.claimers});

  }
  static Stream<List<UserC>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      .orderBy(UserField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(UserC.fromJson));
  static Stream<List<PostItem>> getItems() => FirebaseFirestore.instance
      .collection('lost-items')
      .snapshots()
      .transform(Utils.transformer(PostItem.fromJson));
  static Future uploadMessage(String idUser, String message) async {
    final refMessages =
    FirebaseFirestore.instance.collection('chats');

    final newMessage = Message(
      idUser: FirebaseAuth.instance.currentUser.uid,
      receiver: idUser,
      urlAvatar: FirebaseAuth.instance.currentUser.photoURL,
      username: FirebaseAuth.instance.currentUser.displayName,
      message: message,
      createdAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('users');
    await refUsers
        .doc(idUser)
        .update({UserField.lastMessageTime: DateTime.now()});
  }
  static Future uploadItem(PostItem item) async {
    final refMessages =
    FirebaseFirestore.instance.collection('lost-items');


    await refMessages.add(item.toJson());


  }
  static Stream<List<Message>> getMessages(String idUser) =>
      FirebaseFirestore.instance
          .collection('chats')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static Future addRandomUsers(List<UserC> users) async {
    final refUsers = FirebaseFirestore.instance.collection('users');

    final allUsers = await refUsers.get();
    if (allUsers.size != 0) {
      return;
    } else {
      for (final user in users) {
        final userDoc = refUsers.doc();
        final newUser = user.copyWith(idUser: userDoc.id);

        await userDoc.set(newUser.toJson());
      }
    }
  }

}