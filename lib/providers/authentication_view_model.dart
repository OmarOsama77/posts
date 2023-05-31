import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel with ChangeNotifier{
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

   User? get currentUser {
     return firebaseAuth.currentUser;
   }
   String? get photo{
     return firebaseAuth.currentUser!.photoURL;
   }

   Future <bool> login(String email,String password)async{
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential!=null){
        return true;
      }
      return false;
   }
   Future <bool> register(String email,String password,String firstName,String secondName)async{
     try{
       await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
       currentUser?.updateDisplayName("$firstName $secondName");
       return true;
     }catch(e){
       print("Error while creating account $e");
       return false;
     }

   }
   Future <bool> signOut()async{
      try{
        await firebaseAuth.signOut();
        return true;
      }catch(e){
        return false;
      }
   }
   Stream get authStateChanges {
     return firebaseAuth.authStateChanges();
   }
   Future <bool> deleteAccount (String email)async{
    try{
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    }catch(e){
      return false;
    }
   }
   Future<void> addUserImage(String userImage)async{
    await currentUser!.updateDisplayName(userImage);
   }

}