

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pivo_test/data/constants/color_const.dart';

import '../../domain/states/add_data_state.dart';

class AddUserNotifier extends StateNotifier<AddDataState> {
  AddUserNotifier(this.ref) : super(const AddDataState.initial());

  final Ref ref;

  CollectionReference user =
      FirebaseFirestore.instance.collection('user-data');

 

  Future<void> addUser({
    String? id,
    String? fullName,
    String? email,
   
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
        Fluttertoast.showToast(
            msg: "User data successfully added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorConst.whiteColor,
            textColor: ColorConst.blackColor,
            fontSize: 12.0.sp);
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
