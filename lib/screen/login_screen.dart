import 'package:flutter/material.dart';
import 'package:login_screen/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFromField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    prefix: Icons.email,
                    label: "Email Address",
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "email address most not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFromField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock,
                    suffix:
                    isPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    label: "Password",
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "password is too short";
                      }
                      return null;
                    },
                    onPress: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                    text: "login",
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(passwordController.text);
                        print(emailController.text);
                      }
                    },
                    background: Colors.blue,
                    isUpperCase: true,
                    radius: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ?",
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Register",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}