import 'package:assignment6/home_screen.dart';
import 'package:assignment6/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffDAE2FF),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome back",
                  style: TextStyle(fontSize: 45),
                ),


                const Text(
                  "Login your account",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: nameCtrl,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "please Filled the field";
                    }
                    return null;
                  },
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      hintText: "Username",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password is Required"),
                    LengthRangeValidator(
                        min: 5, max: 8, errorText: "Enter Strong Password minimum 5 to 8 words")
                  ]),
                  obscureText: true,
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff395BA9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        if (formKey.currentState!.validate() == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                        name: nameCtrl.text,
                                      )));
                        }
                      },
                      child: const Text("Login")),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "Don't have Account ?",
                            style: TextStyle(fontSize: 15),
                          )),
                      GestureDetector(
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold,color: Color(0xff395BA9),
                          ),

                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
