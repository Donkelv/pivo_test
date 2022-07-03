import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pivo_test/data/constants/color_const.dart';
import 'package:pivo_test/data/constants/theme.dart';

import '../../domain/states/add_data_state.dart';

class AddUserNotifier extends StateNotifier<AddDataState> {
  AddUserNotifier(this.ref) : super(const AddDataState.initial());

  final Ref ref;

  FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference user = FirebaseFirestore.instance.collection('user-data');

  Future<void> addUser({
    String? id,
    String? fullName,
    String? email,
    BuildContext? context,
  }) async {
    state = const AddDataState.loading();
    try {
      user.doc(id).set(
        {
          'fullName': fullName,
          'id': id,
          'email': email,
        },
      ).then((value) {
        Navigator.of(context!);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                backgroundColor: ColorConst.blackColor,
                title: Text(
                  "Welcome $fullName",
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
                content: Text(
                  "User data successfully added",
                  style: CustomTheme.normalText(context).copyWith(
                    color: ColorConst.whiteColor,
                  ),
                ),
              );
            });

       
        state = const AddDataState.success("User data successfully added");
      }).catchError((error) {
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorConst.whiteColor,
            textColor: ColorConst.blackColor,
            fontSize: 12.0.sp);
        state = const AddDataState.error("Error adding user");
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: ColorConst.whiteColor,
          textColor: ColorConst.blackColor,
          fontSize: 12.0.sp);
      state = const AddDataState.error("Error adding user");
    }
  }
}
