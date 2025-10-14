import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/homepage/homepage.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/splash/splash_page.dart';

class CheckingLoginStatus extends StatelessWidget {
  const CheckingLoginStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData && snapshot.data != null) {
          return const Homepage();
        }
        return const SplashPage();
      },
    );
  }
}
