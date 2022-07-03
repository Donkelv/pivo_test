import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pivo_test/data/constants/image_const.dart';
import 'package:pivo_test/data/constants/theme.dart';

import '../../data/constants/color_const.dart';
import '../widgets/custom_text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  
  const SignUpScreen({Key? key, }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? name;
  bool touched = false;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email!.clear();
    password!.clear();
    name!.clear();
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
                physics: const BouncingScrollPhysics(),
                controller: scrollableController,
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
                        "Register",
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
                        "Create your account",
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
                        "your name".toUpperCase(),
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
                          controller: name,
                          keyboardType: TextInputType.name,
                          hintText: "Full Name",
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
                        height: 40.0.h,
                      ),
                  ],
                ),
              );
            }
          ),
          Positioned(
              bottom: 0.0,
              child: Container(
                width: size.width,
                height: 70.0.h,
                color: ColorConst.primaryColor,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Register",
                        style: CustomTheme.mediumText(context).copyWith(
                          color: ColorConst.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
