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
    return Scaffold(
      backgroundColor: const Color(0xffDAE2FF),
      body: SafeArea(
        child: Form(
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Register",style: TextStyle(fontSize: 40),),
                const SizedBox(height: 20,),
                TextFormField(
                  validator: RequiredValidator(errorText: "Required*"),
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.grey,),
                    hintText: "Username",
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.grey,),
                      hintText: "Email",
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.grey,),
                      hintText: "Email",
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.grey,),
                      hintText: "Email",
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                    width: size.width*0.9,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  const Color(0xff395BA9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                        onPressed: (){
                          Navigator.pop(context);

                        }, child: const Text("Register"))),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 10,),
                      child: const Text("Already have an Account",),
                    ),
                    GestureDetector(
                      child: const Text("Login",style:  TextStyle(fontWeight: FontWeight.bold),),
                      onTap:(){
                      Navigator.pop(context);
                    } ,)
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

