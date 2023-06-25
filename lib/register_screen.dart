import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final passwordValidator =
        MultiValidator([RequiredValidator(errorText: "required"),
        LengthRangeValidator(min: 5, max: 8, errorText: "Enter Strong password min 5 to 8 words")]);
    dynamic password;
    GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xffDAE2FF),
      body: SafeArea(
        child: Form(
          key: formKey2,
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Create your account",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: RequiredValidator(errorText: "Required*"),
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
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
                    EmailValidator(errorText: "enter a valid email address"),
                    RequiredValidator(errorText: "this field is required")
                  ]),
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),

                      hintText: "Email",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(

                  onChanged: (val) => password = val,
                  validator: passwordValidator,
                  obscureText: true,
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintText: "Password",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) =>
                      MatchValidator(errorText: 'passwords do not match')
                          .validateMatch(val.toString(), password),
                  cursorColor: Colors.grey,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintText: "Confirm Password",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff395BA9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          if (formKey2.currentState!.validate() == true) {
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Please filled all field")));
                          }
                        },
                        child: const Text("Register"))),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: const Text(
                        "Already have an Account",
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff395BA9)),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
