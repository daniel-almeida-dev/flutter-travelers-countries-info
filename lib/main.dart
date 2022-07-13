import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_final_flutter/ui/countries/countries_screen.dart';
import 'package:projeto_final_flutter/ui/countrydetail/country_detail_screen.dart';
import 'package:projeto_final_flutter/ui/signin/sign_in_screen.dart';
import 'package:projeto_final_flutter/ui/signup/sign_up_screen.dart';
import 'package:projeto_final_flutter/ui/start/start_screen.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main/factories/pages/countries/countries_screen_factory.dart';
import 'main/factories/pages/countrydetail/country_detail_screen_factory.dart';
import 'main/factories/pages/signin/sign_in_screen_factory.dart';
import 'main/factories/pages/signup/sign_up_screen_factory.dart';
import 'main/factories/pages/start/start_screen_factory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GetMaterialApp(
      title: 'Traverler\'s Countries Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.sairaStencilOneTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: StartScreen.id,
      getPages: [
        GetPage(name: StartScreen.id, page: makeStartScreen),
        GetPage(name: SignInScreen.id, page: makeSignInScreen),
        GetPage(name: SignUpScreen.id, page: makeSignUpScreen),
        GetPage(name: CountriesScreen.id, page: makeCountriesScreen),
        GetPage(name: CountryDetailScreen.id, page: makeCountryDetailScreen),
      ],
    );
  }
}
