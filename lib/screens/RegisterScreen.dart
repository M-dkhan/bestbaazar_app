import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget{
  const RegisterScreen({Key ? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async{
    try{
      Response response = await post(
        Uri.parse('https://88af-2401-4900-1f33-1829-5c2d-8f75-6e4b-88b8.ngrok-free.app/api/login'),
        body: {
          'email': email,
          'password': password
        }

      );
      if (response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print(data['user']);
        print('login successfully');
      }
      else{
        var data = response.body.toString();
        
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Login'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}