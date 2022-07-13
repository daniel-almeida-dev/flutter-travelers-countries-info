import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_final_flutter/ui/countries/countries_screen.dart';

import '../../ui/signin/sign_in_screen.dart';

class StartPresenter extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    if (await FirebaseAuth.instance.currentUser?.uid == null) {
      openNextPage(SignInScreen.id);
    } else {
      openNextPage(CountriesScreen.id);
    }
  }

  void openNextPage(String pageId) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(pageId);
    });
  }
}
