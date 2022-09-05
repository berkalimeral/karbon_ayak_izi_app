import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/screens/signUp_page.dart';
import 'package:karbon_ayak_izi_app/viewmodel/login_viewmodel.dart';
import 'package:karbon_ayak_izi_app/widgets/my_text_fields.dart';
import 'package:provider/provider.dart';

import '../services/firebase_authenticate.dart';
import '../widgets/background_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late final LoginViewModel loginViewModel;

  FireStoreUtils services = FireStoreUtils();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    loginViewModel = LoginViewModel();

    services.auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint(
            'User is signed in! ${user.email} email status: ${user.emailVerified}');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = 'Sign In';
    return ChangeNotifierProvider.value(
      value: loginViewModel,
      builder: (context, child) {
        return bodyView(data, context);
      },
    );
  }

  Scaffold bodyView(String data, BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundWidget(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFieldEmail(
                    text: 'E-mail',
                    controller: _emailController,
                    icon: Icons.email,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldPassword(
                    text: 'Password',
                    controller: _passwordController,
                    icon: Icons.lock,
                    suffixIcon: const Icon(Icons.visibility_off),
                  ),
                  buildLoginBtn(),
                  buildSignUpBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    const data = 'LOGİN';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          try {
            services.signInWithEmailAndPassword(_emailController.text.trim(),
                _passwordController.text.trim(), context);
            services.firestore.collection('users').get().then((value) {
              debugPrint(value.docs.length.toString());
            });
          } catch (e) {
            debugPrint(e.toString());
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.white,
        ),
        child: const Text(
          data,
          style: TextStyle(
              color: Color(0xff5ac18e),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    var text2 = 'Don\'t have an Account? ';
    var text3 = 'Sign Up';
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text2,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
                text: text3,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
