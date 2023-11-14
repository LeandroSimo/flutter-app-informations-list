import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:target/src/service/launch_url.dart';
import 'package:target/src/service/navigation_service.dart';
import 'package:target/src/core/global/app_colors.dart';
import 'package:target/src/core/widgets/custom_buttom.dart';
import 'package:target/src/core/widgets/custom_text_field.dart';
import 'package:target/src/core/utils/validator.dart';
import 'package:target/locator.dart';
import 'package:target/src/stories/login_store.dart';
import 'package:target/src/ui/widgets/custom_rich_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with Validator, LaunchUrl {
  LoginStore loginStore = LoginStore();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ReactionDisposer? disposer;
  late FocusNode _focusPassword;

  @override
  void initState() {
    super.initState();
    _focusPassword = FocusNode();
  }

  @override
  void dispose() {
    _focusPassword.dispose();
    disposer!();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction(
      (_) => loginStore.loggedIn,
      (loggedIn) {
        if (loggedIn) {
          locator<NavigationService>().navigateTo('/home');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final _loginStore = Provider.of<LoginStore>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                primaryColor,
                secondaryColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                child: Observer(builder: (context) {
                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),
                        CustomTextFormField(
                          text: 'User',
                          prefixIcon: Icons.person,
                          hintText: 'Username or Email',
                          isPrefixIcon: true,
                          isLabel: true,
                          obscureText: false,
                          controller: loginStore.controllerData,
                          readOnly: loginStore.readOnly,
                          validator: userValidate,
                          onChanged: (_) {
                            loginStore
                                .setUserEmail(loginStore.controllerData.text);
                            loginStore
                                .setUserName(loginStore.controllerData.text);
                          },
                          onEditingComplete: () =>
                              _focusPassword.requestFocus(),
                          onTap: () => loginStore.setReadOnly(false),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          text: 'Password',
                          prefixIcon: Icons.lock,
                          hintText: 'Password',
                          isLabel: true,
                          isPrefixIcon: true,
                          readOnly: loginStore.readOnly,
                          focusNode: _focusPassword,
                          obscureText: loginStore.isObscure,
                          controller: loginStore.controllerPassword,
                          validator: passwordValidate,
                          onChanged: loginStore.setPassword,
                          onEditingComplete: () {
                            formKey.currentState!.validate()
                                ? loginStore.login()
                                : null;
                            loginStore.setReadOnly(true);
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginStore.isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: loginStore.setObscure,
                          ),
                        ),
                        const SizedBox(height: 35),
                        CustomButtom(
                            heigtht: size.height * .07,
                            child: loginStore.loading
                                ? CircularProgressIndicator.adaptive(
                                    valueColor: AlwaysStoppedAnimation(
                                    Colors.white,
                                  ))
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            color: buttonPrimaryColor,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginStore.login();
                                _focusPassword.unfocus();
                              }
                              // locator<NavigationService>().navigateTo('/home');
                            }),
                        const Spacer(),
                        CustomRichText(
                          bottom: 20,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
