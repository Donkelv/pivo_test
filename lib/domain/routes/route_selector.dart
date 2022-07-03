import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivo_test/data/constants/theme.dart';
import 'package:pivo_test/domain/routes/route_generator.dart';

import '../../data/constants/color_const.dart';
import '../../data/constants/string_const.dart';

class RouteSelector extends StatelessWidget {
  const RouteSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
        designSize: const Size(375, 854),
        builder: (context, child) {
          return MaterialApp(
            theme: CustomTheme.getTheme(),
            debugShowCheckedModeBanner: false,
            title: StringConst.appName,
            color: ColorConst.whiteColor,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: RouteGenerator.login,
          );
        });
  }
}
