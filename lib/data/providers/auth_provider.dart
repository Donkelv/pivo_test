import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pivo_test/data/notifier/auth_notifier.dart';
import 'package:pivo_test/domain/repository/auth_repository.dart';
import 'package:pivo_test/domain/states/auth_loading_state.dart';

final signUpProvider =
    StateNotifierProvider<SignUpNotifier, AuthLoadingState>((ref) {
  return SignUpNotifier(
    ref,
    signUpRepository: ref.watch(authLoaderProvider),
  );
});


final signInProvider =
    StateNotifierProvider<SignInLoaderNotifier, AuthLoadingState>((ref) {
  return SignInLoaderNotifier(
    ref,
    signInRepository: ref.watch(authLoaderProvider),
  );
});


final authLoaderProvider = Provider<BaseAuthRepository>((ref) {
  return AuthRepository();
});

