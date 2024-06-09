import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:green_alert/main.dart';
import 'package:green_alert/pages/home_page.dart';
import 'package:green_alert/pages/sign_up_page.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isObscure = true;
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController emailController = TextEditingController();
  late StreamSubscription<AuthState> _authStateSubscription;
  TextEditingController passwordC = TextEditingController();

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await supabase.auth.signInWithOtp(
        email: emailController.text.trim(),
        emailRedirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      );
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign In Success')),
        );
        emailController.clear();
      }
    } on AuthException catch (error) {
      if (mounted) {
        SnackBar(
          content: Text(error.message),
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    } catch (error) {
      if (mounted) {
        SnackBar(
          content: const Text('Unexpected error occurred'),
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          children: [
            Image.asset(
              "assets/splash.png",
              height: 120,
            ),
            Center(
              child: Text(
                "Welcome to GreenAlert",
                style: greenText.copyWith(
                    fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Image.asset(
              "assets/illustration.png",
              height: 220,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Monitor and manage your plant's health effortlessly with real-time insights.",
              style: greyText.copyWith(fontSize: 16, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email",
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius))),
            ),
            // TextFormField(
            //   controller: passwordC,
            //   obscureText: isObscure,
            //   decoration: InputDecoration(
            //       suffixIcon: GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             isObscure = !isObscure;
            //           });
            //         },
            //         child: Icon(
            //             isObscure ? Icons.visibility : Icons.visibility_off),
            //       ),
            //       labelText: "Password",
            //       focusedBorder:
            //           OutlineInputBorder(borderSide: BorderSide(color: green)),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(defaultRadius))),
            // ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(green)),
                onPressed: _signIn,
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: white,
                      )
                    : Text(
                        "Sign In",
                        style: whiteText.copyWith(fontSize: 16),
                      )),
            const SizedBox(
              height: 12,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Don't have an account?",
            //       style: blackText,
            //     ),
            //     const SizedBox(
            //       width: 8,
            //     ),
            //     GestureDetector(
            //       onTap: () => Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const SignUpPage()),
            //           (route) => false),
            //       child: Text(
            //         "Sign Up here",
            //         style: greenText.copyWith(
            //             decoration: TextDecoration.underline),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
