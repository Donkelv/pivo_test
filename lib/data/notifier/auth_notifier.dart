import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pivo_test/data/constants/color_const.dart';
import 'package:pivo_test/data/constants/theme.dart';
import 'package:pivo_test/domain/repository/auth_repository.dart';
import 'package:pivo_test/domain/states/auth_loading_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../providers/add_user_provider.dart';

///SIGN IN LOADER NOTIFIER
class SignInLoaderNotifier extends StateNotifier<AuthLoadingState> {
  SignInLoaderNotifier(
    this.ref, {
    required BaseAuthRepository signInRepository,
  })  : _signInRepository = signInRepository,
        super(
          const AuthLoadingState.initial(),
        );
  final Ref ref;
  final BaseAuthRepository _signInRepository;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signIn(
      {String? email, String? password, required BuildContext context}) async {
    // final userType = Hive.box<String>(StringConst.userTypeBox);
    // final userId = Hive.box<String>(StringConst.userIdBox);
    if (email!.isEmpty || password!.isEmpty) {
      state = const AuthLoadingState.error('Please fill all the fields');
      Fluttertoast.showToast(
          msg: "Please fill all the fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0.sp);
      return;
    } else {
      state = const AuthLoadingState.loading();
      try {
        final data =
            await _signInRepository.signInWithEmailAndPassword(email, password);
        data.fold((l) {
          Fluttertoast.showToast(
              msg: l,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12.0.sp);
          state = AuthLoadingState.error(l.toString());
        }, (r) {
          state = AuthLoadingState.authenticated(r);
          Navigator.pop(context);
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: ColorConst.blackColor,
                  title: Text(
                    "Welcome ${r.displayName}",
                    style: CustomTheme.semiLargeText(context).copyWith(
                      color: ColorConst.whiteColor,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        auth.signOut();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorConst.primaryColor,
                      ),
                      child: Text(
                        "Sign out",
                        style: CustomTheme.normalText(context)
                            .copyWith(color: ColorConst.whiteColor),
                      ),
                    ),
                  ],
                );
              });

          //Navigator.pushNamed(context, RouteGenerator.bottomAppBarScreen);
        });
      } catch (e) {
        state = AuthLoadingState.error(e.toString());
        Fluttertoast.showToast(
            msg: "$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0.sp);
      }
    }
  }
}

////SIGN UP LOADER NOTIFIER
class SignUpNotifier extends StateNotifier<AuthLoadingState> {
  SignUpNotifier(
    this.ref, {
    required BaseAuthRepository signUpRepository,
  })  : _signUpRepository = signUpRepository,
        super(
          const AuthLoadingState.initial(),
        );

  final Ref ref;
  final BaseAuthRepository _signUpRepository;

  Future signUp(
      {String? fullName,
      String? email,
      String? password,
      required BuildContext context}) async {
    //final userType = Hive.box<String>(StringConst.userTypeBox);
    //final userId = Hive.box<String>(StringConst.userIdBox);
    if (fullName!.isEmpty || email!.isEmpty || password!.isEmpty) {
      state = const AuthLoadingState.error('Please fill all the fields');
      Fluttertoast.showToast(
          msg: "Please fill all the fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0.sp);
      return;
    } else {
      state = const AuthLoadingState.loading();
      try {
        final data = await _signUpRepository.createUserWithEmailAndPassword(
          email,
          password,
        );
        data.fold((l) {
          state = AuthLoadingState.error(l.toString());
          Fluttertoast.showToast(
              msg: l,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12.0.sp);
        }, (r) {
          Fluttertoast.showToast(
              msg: "Setting up user data",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12.0.sp);
          r.updateDisplayName(fullName);
          ref.watch(addUserProvider.notifier).addUser(
              id: r.uid, fullName: fullName, email: email, context: context);
          state = AuthLoadingState.authenticated(r);
        });
      } catch (e) {
        state = AuthLoadingState.error(e.toString());
        Fluttertoast.showToast(
            msg: "$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0.sp);
      }
    }
  }
}
