import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pivo_test/data/constants/color_const.dart';
import 'package:pivo_test/data/constants/image_const.dart';
import 'package:pivo_test/data/constants/theme.dart';
import 'package:pivo_test/data/providers/auth_provider.dart';
import 'package:pivo_test/domain/states/auth_loading_state.dart';
import 'package:pivo_test/presentation/screens/signup_screen.dart';
import 'package:pivo_test/presentation/widgets/custom_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  final ScrollController? scrollController;
  const LoginScreen({Key? key, this.scrollController}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? email;
  TextEditingController? password;
  bool touched = true;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email!.clear();
    password!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 700.0.h,
      color: ColorConst.blackColor,
      child: Stack(
        children: [
          DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.8,
              maxChildSize: 1.0,
              minChildSize: 0.8,
              builder: (context, scrollableController) {
                return SingleChildScrollView(
                  controller: scrollableController,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0.w),
                        child: Text(
                          "Login",
                          style: CustomTheme.largeText(context).copyWith(
                            color: ColorConst.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0.w),
                        child: Text(
                          "Sign to your account",
                          style: CustomTheme.mediumText(context).copyWith(
                              color: ColorConst.whiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 57.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                        child: Text(
                          "your email".toUpperCase(),
                          style: CustomTheme.normalText(context).copyWith(
                              color: ColorConst.whiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                          child: CustomTextField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "example@email.co",
                            backGroundColor: ColorConst.dark2,
                            style: CustomTheme.normalText(context).copyWith(
                                color: ColorConst.whiteColor,
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        height: 28.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                        child: Text(
                          "your password".toUpperCase(),
                          style: CustomTheme.normalText(context).copyWith(
                              color: ColorConst.whiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                        child: CustomPasswordTextField(
                          obscureText: touched,
                          controller: password,
                          keyboardType: TextInputType.text,
                          hintText: "*******",
                          backGroundColor: ColorConst.dark2,
                          style: CustomTheme.normalText(context).copyWith(
                              color: ColorConst.whiteColor,
                              fontWeight: FontWeight.w400),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  touched = !touched;
                                });
                              },
                              icon: touched == true
                                  ? const Icon(
                                      Icons.visibility,
                                      color: ColorConst.whiteColor,
                                    )
                                  : SvgPicture.asset(ImageConst.visibilityOff)),
                        ),
                      ),
                      SizedBox(
                        height: 24.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: CustomTheme.normalText(context).copyWith(
                                color: ColorConst.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                    ],
                  ),
                );
              }),
          Positioned(
              bottom: 0.0,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showBarModalBottomSheet(
                          
                            isDismissible: false,
                            context: context,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            topControl: Container(
                              width: 50.0.w,
                              height: 6.0.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: ColorConst.blackColor,
                              ),
                            ),
                            barrierColor: Colors.transparent,
                            backgroundColor: ColorConst.blackColor,
                            builder: (context) {
                              return const SignUpScreen();
                            });
                      },
                      child: Text(
                        "I don't have an account",
                        style: CustomTheme.normalText(context).copyWith(
                            color: ColorConst.whiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Consumer(builder: (context, ref, child) {
                    if (ref.watch(signInProvider).isLoading) {
                      return Container(
                         width: size.width,
                        height: 70.0.h,
                        color: ColorConst.primaryColor,
                        child: Center(
                          child: Platform.isIOS
                              ? const CircularProgressIndicator.adaptive(
                                  backgroundColor: ColorConst.whiteColor,
                                )
                              : const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    ColorConst.whiteColor,
                                  ),
                                ),
                        ),
                      );
                    } else {
                      return Container(
                        width: size.width,
                        height: 70.0.h,
                        color: ColorConst.primaryColor,
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {
                              ref.watch(signInProvider.notifier).signIn(
                                  context: context,
                                  email: email!.text,
                                  password: password!.text);
                            },
                            child: Center(
                              child: Text(
                                "Login",
                                style: CustomTheme.mediumText(context).copyWith(
                                  color: ColorConst.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
                ],
              ))
        ],
      ),
    );
  }
}
