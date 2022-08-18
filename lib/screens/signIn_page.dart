import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/model/user_model.dart';
import 'package:karbon_ayak_izi_app/screens/home_page.dart';
import 'package:karbon_ayak_izi_app/screens/signUp_page.dart';
import 'package:karbon_ayak_izi_app/viewmodel/login_viewmodel.dart';
import 'package:karbon_ayak_izi_app/widgets/my_text_fields.dart';
import 'package:provider/provider.dart';

import '../services/firebase_authenticate.dart';

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
                    isVisible: true,
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

  Widget buildTextFormEmail(
      String text, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
              ]),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                icon,
                color: const Color(0xff5ac18e),
              ),
              hintText: text,
              hintStyle: const TextStyle(color: Colors.black38),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextFormPassword(String text, TextEditingController controller,
      IconData icon, Widget suffixIcon) {
    bool isVisible = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
              ]),
          child: TextFormField(
            obscureText: context.watch<LoginViewModel>().isVisible,
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: suffixIcon,
                onPressed: () {
                  setState(() {
                    context.read<LoginViewModel>().isVisibleChange();
                    // loginViewModel.isVisibleChange();
                  });
                },
              ),
              prefixIcon: Icon(
                icon,
                color: const Color(0xff5ac18e),
              ),
              hintText: text,
              hintStyle: const TextStyle(color: Colors.black38),
            ),
          ),
        ),
      ],
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
            services.signInWithEmailAndPassword(
                _emailController.text, _passwordController.text, context);

            if (await FirebaseAuth.instance.currentUser != null) {
              print("current içi");
            } else {
              null;
            }
          } catch (e) {
            debugPrint(e.toString());
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          primary: Colors.white,
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
