import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incomeexpensestracker/core/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthProvider extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    return ref.read(authServiceProvider).getCurrentUser();
  }

  Future<User?> signInWithGoogle() async {
    state = const AsyncLoading();
    final authService = ref.read(authServiceProvider);

    try {
      final userCredential = await authService.signInWithGoogle();
      state = AsyncData(userCredential?.user);
      return userCredential?.user;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  Future<void> signOut() async {
    final authService = ref.read(authServiceProvider);
    await authService.signOut();
    state = const AsyncData(null);
  }
}

final authNotifierProvider = AsyncNotifierProvider<AuthProvider, User?>(
  () => AuthProvider(),
);
