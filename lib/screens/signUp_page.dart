import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/screens/home_page.dart';
import 'package:karbon_ayak_izi_app/services/firebase_authenticate.dart';
import 'package:karbon_ayak_izi_app/services/user_services.dart';
import 'package:karbon_ayak_izi_app/widgets/my_text_fields.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                      'Sign Up',
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
                      isVisible: true,
                      icon: Icons.lock,
                      suffixIcon: const Icon(Icons.visibility_off),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldPassword(
                      text: 'Confirm Password',
                      controller: _passwordConfController,
                      isVisible: true,
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
      ),
    );
  }

  Widget buildTextFormField(String text, TextEditingController controller,
      IconData icon, bool obsecureText) {
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
            obscureText: obsecureText,
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

  Widget buildTextField(
      String text, TextEditingController controller, TextInputType inputType) {
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
            keyboardType: inputType,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(13),
              border: InputBorder.none,
              hintText: text,
              hintStyle: const TextStyle(color: Colors.black38),
            ),
          ),
        ),
      ],
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
              usersServices.addUser(_nameController.text,
                  _mobileController.text, _emailController.text);
              services.createUserWithEmailAndPassword(
                  _emailController.text, _passwordController.text, context);
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

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x665ac18e),
              Color(0x995ac18e),
              Color(0xcc5ac18e),
              Color(0xff5ac18e),
            ]),
      ),
    );
  }
}
