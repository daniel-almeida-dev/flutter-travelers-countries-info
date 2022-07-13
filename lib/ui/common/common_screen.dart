import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

//ignore: must_be_immutable
class CommonScreen extends StatelessWidget {
  ProgressDialog? progressDialog;

  CommonScreen({Key? key}) : super(key: key);

  void showLoading(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      progressDialog = ProgressDialog(context,
          type: ProgressDialogType.normal, isDismissible: false);

      progressDialog?.style(
          progressWidget: Lottie.asset('assets/anim/loading.json'),
          insetAnimCurve: Curves.easeInOut,
          message: message,
          backgroundColor: Colors.white,
          borderRadius: 20,
          elevation: 10,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          textAlign: TextAlign.left,
          progressWidgetAlignment: Alignment.center,
          messageTextStyle: const TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 46, 165, 188),
          ));

      progressDialog?.show();
    });
  }

  void cancelLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (progressDialog?.isShowing() ?? false) {
        progressDialog?.hide();
      }
    });
  }

  void showError(String errorMessage) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(errorMessage, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
