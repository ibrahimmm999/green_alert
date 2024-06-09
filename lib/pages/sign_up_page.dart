// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:green_alert/main.dart';
import 'package:green_alert/pages/home_page.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:green_alert/pages/sign_in_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isObscure = true;
  bool loading = false;
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.only(top: 160, left: 20, right: 20, bottom: 20),
          children: [
            Text(
              "Sign Up",
              style: greenText.copyWith(fontSize: 32, fontWeight: bold),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              controller: nameC,
              decoration: InputDecoration(
                  labelText: "Name",
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius))),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: emailC,
              decoration: InputDecoration(
                  labelText: "Email",
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius))),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: passwordC,
              obscureText: isObscure,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off),
                  ),
                  labelText: "Password",
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius))),
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(loading ? grey : green)),
                onPressed: () async {
                  try {
                    loading = true;
                    final response = await supabase.auth.signUp(
                      email: emailC.text,
                      password: passwordC.text,
                    );
                    await supabase
                        .from('profiles')
                        .update({'name': nameC.text}).eq(
                            'id', response.session!.user.id);
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: green,
                        content: const Text(
                          'Silahkan login untuk melanjutkan',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } catch (error) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: red,
                        content: const Text(
                          'Sign Up gagal',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  loading = false;
                },
                child: loading
                    ? CircularProgressIndicator(
                        color: white,
                      )
                    : Text(
                        "Sign Up",
                        style: whiteText.copyWith(fontSize: 16),
                      )),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account?",
                  style: blackText,
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                      (route) => false),
                  child: Text(
                    "Sign In here",
                    style: greenText.copyWith(
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
