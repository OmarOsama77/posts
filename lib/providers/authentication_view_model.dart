import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel with ChangeNotifier{
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

   User? get currentUser {
     return firebaseAuth.currentUser;
   }
   Future <void> login(String email,String password)async{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

   }
   Future <void> register(String email,String password,String firstName,String secondName)async{
     await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
     currentUser?.updateDisplayName("$firstName $secondName");
   }
   Future <void> signOut(String email,String password)async{
      await firebaseAuth.signOut();
   }
   Stream get authStateChanges {
     return firebaseAuth.authStateChanges();
   }
}