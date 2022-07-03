import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pivo_test/data/notifier/add_user_notifier.dart';
import 'package:pivo_test/domain/states/add_data_state.dart';

final addUserProvider =
    StateNotifierProvider<AddUserNotifier, AddDataState>((ref) {
  return AddUserNotifier(ref);
});
