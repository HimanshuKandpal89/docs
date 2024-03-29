
import 'dart:convert';

import 'package:google_docs/constants.dart';
import 'package:google_docs/models/user_model.dart';
import 'package:google_docs/models/error_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';



final authRepoProvider = Provider(
  (ref)=> AuthRepo(googleSignIn: GoogleSignIn(), client:Client())
  );
  final userProvider = StateProvider<UserModel?>((ref)=> null);

class AuthRepo{
final GoogleSignIn _googleSignIn;
final Client _client;
AuthRepo({
  required GoogleSignIn googleSignIn,
  required Client client
}): _googleSignIn = googleSignIn , _client  = client;


Future<ErrorModel> signinwithgoogle()async {
 ErrorModel error = ErrorModel(error:'some unexpecte error',data:null,);
  try {
   final user = await _googleSignIn.signIn();

   if (user != null){
    final userAcc = UserModel(
      name: user.displayName!, 
      email: user.email,
      profilepic: user.photoUrl!, 
      uid: '',
      token: '');

      var res = await _client.post(Uri.parse('$host/api/signup'),
      body: userAcc.toJson(),
      headers:{
        'Content-Type' : "application/json; charset = UTF-8"
      } ); // send the data to server and get back a token from it
    
    switch(res.statusCode){
       case 200:
       final newUser = userAcc.copyWith(
        // getting the uid from the  response of the server.
        // converting this response to json 
        uid:  jsonDecode(res.body)['user']['_id'],
       );
       error = ErrorModel(error: null, data: newUser);
       break;
       
    }

   }
    
  } catch (e) {
    error = ErrorModel(error: e.toString(), data: null);
    
  }
  return error;

}}