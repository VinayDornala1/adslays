import 'package:adslay/BoolProvider.dart';
import 'package:adslay/SplashScreen.dart';
import 'package:adslay/stripe/blocs/pay/pay_bloc.dart';
import 'package:adslay/stripe/services/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'MultipleNotifier3.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'bottom_bar.dart';

main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await Firebase.initializeApp();
  return runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => BoolProvider()),
        BlocProvider(create: ( _ ) => PayBloc())
      ],
        child: MyApp(),
      )
  );
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    StripeService().init();
    return Consumer<BoolProvider>(
      builder: (context, model, child){
        return GetMaterialApp(
            builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 1200,
              minWidth: 375,
              defaultScale: false,
              breakpoints: [
                // ResponsiveBreakpoint.resize(375, name: MOBILE),
                // ResponsiveBreakpoint.autoScale(800, name: TABLET),
                // ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                // ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                // ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
            ),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color(0xFFFAFAFA),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home:SplashScreen()

        );
      },
    );
  }
}
