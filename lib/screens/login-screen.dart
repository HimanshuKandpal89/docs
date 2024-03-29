import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs/models/error_model.dart';
import 'package:google_docs/repositories/auth_repo.dart';
import 'package:google_docs/screens/home_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  void signinwithgoogle(WidgetRef ref, BuildContext context) async{
    final Smessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final errorModel =  await ref.watch(authRepoProvider).signinwithgoogle();
    if(errorModel.error == null){
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      navigator.push(MaterialPageRoute(builder: (context) => const  HomeScreen(),
      ),);
    }
    else{
      Smessenger.showSnackBar(
        SnackBar(
          content: Text(errorModel.error!),
          ),
          );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authRepoProvider).signinwithgoogle();
    return  Scaffold(
      body: Center(
        child: ElevatedButton.icon( 
          onPressed: () => signinwithgoogle(ref,context),
         icon: Image.asset('assets/7611770.png',height:40,),
         label: const Text("Sign in with Google")
         ),
         ),

    );
  }
}