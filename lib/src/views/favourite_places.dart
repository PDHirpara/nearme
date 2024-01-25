import 'package:flutter/material.dart';
import 'package:nearme/src/views/login_screen.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: TextButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        print("login");
        return const LoginScreen();
      }));
    }, child: const Text('login')));
  }
}
