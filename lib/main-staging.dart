import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'core/data/enums/type_enums.dart';
import 'core/di/di_config.dart';
import 'core/platform/env_config.dart';
import 'core/presentation/state/provider_initializer.dart';
import 'core/utils/navigation_service.dart';
import 'features/onboarding/presentation/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initInjectors();
  await dotenv.load(fileName: ".env");
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  EnvConfig(
    flavor: Env.STAGING,
    values: EnvVar(baseUrl: dotenv.env['STAGING_BASE_URL'].toString()),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(NewProject());
}

class NewProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
      ),
      child: OverlaySupport(
        child: MultiProvider(
          providers: ProviderInitializer.providers,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: router.navigatorKey,
              theme: ThemeData(
                fontFamily: 'Manrope',
                useMaterial3: false,
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                ),
              ),
              home: SplashScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
