import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/services/firebase_authenticate.dart';
import 'package:karbon_ayak_izi_app/services/user_services.dart';
import 'package:karbon_ayak_izi_app/widgets/my_text_fields.dart';

import '../widgets/background_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfController;
  late TextEditingController _nameController;
  late TextEditingController _mobileController;

  FireStoreUtils services = FireStoreUtils();
  UsersServices usersServices = UsersServices();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfController = TextEditingController();
    _nameController = TextEditingController();
    _mobileController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = 'Sign Up';
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundWidget(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
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
                  TextFieldName(
                      text: 'Full Name',
                      controller: _nameController,
                      icon: Icons.person,
                      inputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldPhone(
                      text: 'Mobile Number',
                      controller: _mobileController,
                      icon: Icons.phone,
                      inputType: TextInputType.phone),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldEmail(
                      text: 'E-mail',
                      controller: _emailController,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldPassword(
                    text: 'Password',
                    controller: _passwordController,
                    icon: Icons.lock,
                    suffixIcon: const Icon(Icons.visibility_off),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldPassword(
                    text: 'Confirm Password',
                    controller: _passwordConfController,
                    icon: Icons.lock,
                    suffixIcon: const Icon(Icons.visibility_off),
                  ),
                  buildLoginBtn('LOGİN'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginBtn(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          try {
            if (_passwordController.text == _passwordConfController.text) {
              usersServices.addUser(_nameController.text.trim(),
                  _mobileController.text.trim(), _emailController.text.trim());
              services.createUserWithEmailAndPassword(
                  _emailController.text.trim(),
                  _passwordController.text.trim(),
                  context);
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
        child: Text(
          text,
          style: const TextStyle(
              color: Color(0xff5ac18e),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
