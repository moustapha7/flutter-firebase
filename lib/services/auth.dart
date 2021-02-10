import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/usermodel.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object on FireBaseUser
  UserModel _userFromFireBaseUser (User user)
  {
    return user !=null ? UserModel(uid: user.uid) : null;
  }


  //auth change user stream
  Stream<UserModel> get user{
    return _auth.onAuthStateChanged
       // .map((User user) => _userFromFireBaseUser(user));
        .map(_userFromFireBaseUser);
  }



  //sign in avec n'importe quel utilisateur
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
        User user = result.user;
        return _userFromFireBaseUser(user);
    } catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password


  // register with email and password

  // sign out
}


