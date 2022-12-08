import 'package:flutter/material.dart';
import 'package:inicialhooks/Navigation/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed:(){
                  Navigator.pushNamed(context, Routes.homepage, arguments: "Titulo");
                },
                child: const Text("Home Page")),

            ElevatedButton(
                onPressed:(){
                  Navigator.pushNamed(context, Routes.counter, arguments: "Contador");
                },
                child: const Text("Count")),

            ElevatedButton(
                onPressed:(){
                  Navigator.pushNamed(context, Routes.form, arguments: "Form");
                },
                child: const Text("Form")),

            ElevatedButton(
                onPressed:(){
                  Navigator.pushNamed(context, Routes.scroll, arguments: "Scroll");
                },
                child: const Text("Scroll")),
          ],
        ),
      ),
    );
  }
}
