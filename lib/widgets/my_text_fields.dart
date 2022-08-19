import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class TextFieldEmail extends StatefulWidget {
  String text;
  TextEditingController controller;
  IconData icon;
  TextInputType inputType;
  TextFieldEmail({
    Key? key,
    required this.text,
    required this.controller,
    required this.icon,
    required this.inputType,
  }) : super(key: key);

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (!EmailValidator.validate(value!)) {
              return 'Geçerli Mail Giriniz!';
            } else {
              null;
            }
          },
          controller: widget.controller,
          keyboardType: widget.inputType,
          decoration: inputDecoration(Icons.email, 'E-mail'),
        ),
      ],
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  String text;
  TextEditingController controller;
  IconData icon;
  Widget suffixIcon;
  TextFieldPassword({
    Key? key,
    required this.text,
    required this.controller,
    required this.icon,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPassword();
}

class _TextFieldPassword extends State<TextFieldPassword> {
  late final LoginViewModel loginViewModel;

  @override
  void initState() {
    super.initState();
    loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: loginViewModel,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.length < 4) {
                  return 'Password en az 4 karakter olmalıdır!';
                }
              },
              obscureText: context.watch<LoginViewModel>().isVisible,
              controller: widget.controller,
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecorationPass(),
            ),
          ],
        );
      },
    );
  }

  InputDecoration inputDecorationPass() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
            width: 3, color: Colors.black26, style: BorderStyle.solid),
      ),
      suffixIcon: IconButton(
        icon: loginViewModel.isVisible
            ? widget.suffixIcon
            : const Icon(Icons.visibility),
        onPressed: () {
          setState(() {
            debugPrint(loginViewModel.isVisible.toString());
            //context.read<LoginViewModel>().isVisibleChange();
            loginViewModel.isVisibleChange();
          });
        },
      ),
      prefixIcon: Icon(
        widget.icon,
        color: const Color(0xff5ac18e),
      ),
      hintText: widget.text,
      hintStyle: const TextStyle(color: Colors.black38),
    );
  }
}

class TextFieldName extends StatefulWidget {
  String text;
  TextEditingController controller;
  IconData icon;
  TextInputType inputType;
  TextFieldName({
    Key? key,
    required this.text,
    required this.controller,
    required this.icon,
    required this.inputType,
  }) : super(key: key);

  @override
  State<TextFieldName> createState() => _TextFieldName();
}

class _TextFieldName extends State<TextFieldName> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Lütfen bir isim giriniz!';
              } else {
                null;
              }
            },
            controller: widget.controller,
            keyboardType: widget.inputType,
            decoration: inputDecoration(Icons.person, 'Full Name'),
          ),
        ],
      ),
    );
  }
}

class TextFieldPhone extends StatefulWidget {
  String text;
  TextEditingController controller;
  IconData icon;
  TextInputType inputType;
  TextFieldPhone({
    Key? key,
    required this.text,
    required this.controller,
    required this.icon,
    required this.inputType,
  }) : super(key: key);

  @override
  State<TextFieldPhone> createState() => _TextFieldPhone();
}

class _TextFieldPhone extends State<TextFieldPhone> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Lütfen bir telefon numarası giriniz!';
              } else {
                null;
              }
            },
            controller: widget.controller,
            keyboardType: widget.inputType,
            decoration: inputDecoration(Icons.phone, 'Mobile Number'),
          ),
        ],
      ),
    );
  }
}

InputDecoration inputDecoration(IconData icon, String text) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
          width: 3, color: Colors.black26, style: BorderStyle.solid),
    ),
    prefixIcon: Icon(
      icon,
      color: const Color(0xff5ac18e),
    ),
    hintText: text,
    hintStyle: const TextStyle(color: Colors.black38),
  );
}
