import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saathi/utils/const.dart';

class AuthController {
  Stream<User?> get authChanges => firebaseAuth.authStateChanges();

  forgotPassword(String email) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        res = 'success';
      } else {
        res = 'Email field must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  signinWithGoogle() async {
    String res = 'Some error occured';
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          //store user details in firestore
          firebaseFirestore.collection('users').doc(user.uid).set({
            'fname': user.displayName,
            'username': user.email,
            'uid': user.uid,
            'email': user.email,
            'userImage': user.photoURL,
          });
        }
      }
      res = 'success';
    } on FirebaseAuthException catch (e) {
      // print(e);
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signUpUser(String email, String pass, String fname) async {
    String res = 'Some error occured';
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      String downloadUrl;
      downloadUrl = '';
      await userCredential.user!.sendEmailVerification();
      if (userCredential.additionalUserInfo!.isNewUser) {
        firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'fname': fname,
          'uid': userCredential.user!.uid,
          'email': email,
          'userImage': downloadUrl,
        });
      }
      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      }
    } catch (e) {
      res = e.toString();
    }
    // print(res);
    return res;
  }

  loginUsers(String email, String pass) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty && pass.isNotEmpty) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);
        res = 'success';
      } else {
        res = 'Fields must not be empty';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'No user found for this email.';
      } else if (e.code == 'wrong-password') {
        res = 'Incorrect password';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  authSignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Signed Out");
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}

showSnackBarr(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
