import 'package:flutter/material.dart';
import 'package:mobile/features/pages/colors.dart';
import 'package:mobile/features/pages/my_widgets.dart';
import 'package:email_validator/email_validator.dart';

GlobalKey<FormState> formKey = GlobalKey();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _obscurePassword = true;
  bool _rememberMe = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/features/images/background.jpg"),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: MyColors.color2,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/features/images/logo.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: MyColors.basicColor,
                    fontFamily: "InstrumentSerif",
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 2),
                LineText(text: "Sign in to continue"),
                SizedBox(height: 5),
                MyTextField(
                  hint: "Email or Username",
                  icon: Icons.person,
                  controller: _emailController,
                  validator: validateEmail,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hint: "Password",
                  icon: Icons.lock,
                  controller: _passwordController,
                  validator: validatePassword,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 25,
                      color: MyColors.basicColor,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          width: 35,
                          height: 35,
                          child: Checkbox(
                            value: _rememberMe,
                            activeColor: MyColors.basicColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _rememberMe = val ?? false;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.basicColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColors.basicColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Container(
                  height: 50,
                  width: 350,
                  child: MaterialButton(
                    onPressed: () {
                      login();
                    },
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: MyColors.basicColor,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: MyColors.color3,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                LineText(text: "Or"),
                SizedBox(height: 3),
                Container(
                  height: 50,
                  width: 350,
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: MyColors.basicColor, width: 1),
                    ),
                    color: MyColors.color3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            "lib/features/images/google.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: MyColors.basicColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: MyColors.basicColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: MyColors.basicColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  final text = value?.trim() ?? '';
  if (text.isEmpty) return 'Enter your email or username';
  if (text.contains('@') && !EmailValidator.validate(text)) {
    return 'Enter a valid email';
  }
  if (!text.contains('@') && text.length < 3) {
    return 'Username must be at least 3 characters';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Enter your password';
  if (value.length < 6) return 'At least 6 characters';
  return null;
}

void login() {
  if (formKey.currentState!.validate()) {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
  }
}
