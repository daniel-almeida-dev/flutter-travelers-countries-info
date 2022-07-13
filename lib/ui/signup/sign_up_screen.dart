import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/ui/common/common_screen.dart';

import 'package:projeto_final_flutter/ui/common_widgets/signin_signup/rounded_gradient_button.dart';
import 'package:projeto_final_flutter/ui/common_widgets/signin_signup/rounded_text_form_field.dart';

import '../../presentation/signup/sign_up_presenter.dart';
import '../../presentation/utils/loading_state.dart';

//ignore: must_be_immutable
class SignUpScreen extends CommonScreen {
  static const String id = '/signup';

  final SignUpPresenter presenter;
  final formLoginKey = GlobalKey<FormState>();

  SignUpScreen({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: const Color.fromARGB(255, 46, 165, 188),
            onPressed: () {
              presenter.onAppBarBackButtonPressed();
            },
          ),
        ),
        body: SafeArea(
          child: Obx(
            () {
              var loadingState = presenter.loadingState.value;
              loadingState == LoadingState.loading
                  ? showLoading(context, "Cadastrando...")
                  : cancelLoading();

              var errorMessage = presenter.errorMessage.value;
              if (errorMessage.isNotEmpty) {
                showError(errorMessage);
              }

              return SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: bottom),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 190,
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
                          height: 350,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, top: 40),
                                  child: RoundedTextFormField(
                                    hintText: "Nome",
                                    onTextChanged: presenter.onUserNameUpdate,
                                    enableSuggestions: true,
                                    obscureText: false,
                                    autoCorrect: true,
                                    controller: null,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: RoundedTextFormField(
                                    hintText: "Telefone",
                                    onTextChanged: presenter.onUserPhoneUpdate,
                                    enableSuggestions: true,
                                    obscureText: false,
                                    autoCorrect: true,
                                    controller: null,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: RoundedTextFormField(
                                    hintText: "Email",
                                    onTextChanged: presenter.onUserEmailUpdate,
                                    enableSuggestions: true,
                                    obscureText: false,
                                    autoCorrect: true,
                                    controller: null,
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
                            ],
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
