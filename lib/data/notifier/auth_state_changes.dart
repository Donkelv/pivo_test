import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pivo_test/domain/states/auth_state.dart';


class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this.ref)
      : super(
          const AuthState.initial(),
        );

  final Ref ref;

  final _auth = FirebaseAuth.instance;

  Future<void> authState() async {
    _auth.authStateChanges().listen((User? user) {
      debugPrint("Auth state changes $user");
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.unauthenticated();
      }
    });
  }
}
