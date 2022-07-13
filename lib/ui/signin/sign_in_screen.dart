import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/presentation/utils/loading_state.dart';
import 'package:projeto_final_flutter/ui/common/common_screen.dart';
import 'package:projeto_final_flutter/ui/common_widgets/signin_signup/rounded_gradient_button.dart';
import 'package:projeto_final_flutter/ui/common_widgets/signin_signup/rounded_text_form_field.dart';

import '../../presentation/signin/sign_in_presenter.dart';

//ignore: must_be_immutable
class SignInScreen extends CommonScreen {
  static const String id = '/signin';

  final SignInPresenter presenter;
  final TextEditingController controller;
  final GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();

  SignInScreen({Key? key, required this.presenter, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Obx(
            () {
              var loadingState = presenter.loadingState.value;
              loadingState == LoadingState.loading
                  ? showLoading(context, "Autenticando...")
                  : cancelLoading();

              var errorMessage = presenter.errorMessage.value;
              if (errorMessage.isNotEmpty) {
                showError(errorMessage);
              }

              var initialValue = presenter.createdEmail.value;
              if (initialValue.isNotEmpty) {
                controller.text = initialValue;
              }

              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 240,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 140,
                            height: 180,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Form(
                      key: formLoginKey,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 240,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 30, top: 20),
                                child: RoundedTextFormField(
                                  hintText: "Email",
                                  onTextChanged: presenter.onUserEmailUpdate,
                                  enableSuggestions: true,
                                  obscureText: false,
                                  autoCorrect: true,
                                  controller: controller,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: RoundedTextFormField(
                                  hintText: "Senha",
                                  onTextChanged: presenter.onPasswordUpdate,
                                  enableSuggestions: false,
                                  obscureText: true,
                                  autoCorrect: false,
                                  controller: null,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 25),
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                "Esqueceu a senha?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 46, 165, 188)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 60, top: 10),
                      child: Center(
                        child: RoundedGradientButton(
                          formLoginKey: formLoginKey,
                          onPressed: presenter.onSignInButtonPressed,
                          buttonTitle: "Login".toUpperCase(),
                        ),
                      ),
                    ),
                    Center(
                      child: RoundedGradientButton(
                        formLoginKey: formLoginKey,
                        onPressed: presenter.onSignUpButtonPressed,
                        buttonTitle: "Cadastrar".toUpperCase(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
