import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivo_test/data/constants/color_const.dart';
import 'package:pivo_test/data/constants/image_const.dart';
import 'package:pivo_test/data/constants/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController? email;
  TextEditingController? password;

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: ColorConst.blackColor,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConst.backGround),
              fit: BoxFit.cover,
            )
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Herbalova", style: CustomTheme.largeText(context).copyWith(color: ColorConst.whiteColor,),
              ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0.w,
                      height: 5.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: ColorConst.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Container(
                      width: size.width,
                      height:70.0.h,
                      color: ColorConst.blackColor,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: (){},
                          child: Center(
                            child: Text("Sign in to your account", style: CustomTheme.mediumText(context).copyWith(color: ColorConst.whiteColor,),
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              
              )
            ],
          ),
        ),
      ),
    );
  }
}
