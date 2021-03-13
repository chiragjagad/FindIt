import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:google_sign_in/google_sign_in.dart';
// import 'com.facebook.FacebookSdk';
//  import 'com.facebook.appevents.AppEventsLogger';

class AuthService {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future signUpEmailPassword(String email, String pass) async {
    try {
      User user = (await _auth.
      createUserWithEmailAndPassword(email: email, password: pass))
          .user;

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Stream<User> get user{
    return _auth.authStateChanges();
  }
  Future signInEmailPassword(String email, String pass) async {
    try {
      User user = (await _auth.
      signInWithEmailAndPassword(email: email, password: pass))
          .user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> signInWithGoogle() async {
    print('hey i am in sign in');
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn
        .signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
        .authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult = await _auth.signInWithCredential(
        credential);
    final User user = authResult.user;
    print('hey');
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      final QuerySnapshot result =
      await FirebaseFirestore.instance.collection('users').where('id', isEqualTo: user.uid).get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        // Update data to server if new user
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': user.displayName,
          'urlAvatar': user.photoURL,
          'idUser': user.uid,
          'lastMessageTime': null
        });
      }
      print('hey');
      print('signInWithGoogle succeeded: $user');
      return user;
    }
    else {
      print("failed");
      return null;
    }
  }
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;

    }
  }
}
