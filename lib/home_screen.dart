import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key,required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff395BA9),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Login "),


                  GestureDetector(
                    child: CircleAvatar( child: Icon(Icons.logout,size: 30.9,)),
                    onTap: (){

                    Navigator.pop(context);

                  },)

                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Welcome",style: TextStyle(fontSize: 30),),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
