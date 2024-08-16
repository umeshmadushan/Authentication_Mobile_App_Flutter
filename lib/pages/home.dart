import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/916781ae-582e-47e0-a96f-cb34ab399dee/IK3NjX5PUX.json',
              height: 100,
            ),
            const SizedBox(
                height: 20), // Add some spacing between the animation and text
            const Text(
              'Logged In!',
              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            ),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20.0,color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
