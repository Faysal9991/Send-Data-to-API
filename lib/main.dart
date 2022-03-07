import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController idController=TextEditingController();
  TextEditingController request_idController=TextEditingController();
  TextEditingController attemptController=TextEditingController();
  TextEditingController statusController=TextEditingController();
  void login(String id, String reqid ,String attemt,String stutas) async{
    try{
      Response response = await  post(
        Uri.parse('https://hooks.zapier.com/hooks/catch/6864535/biqeouu/'),
       body: {
         "id":id,
         "request_id": reqid,
         "attempt": attemt,
         "status": stutas,
       }
      );
      if(response.statusCode ==200){
        print("account created Succesfully");
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
        backgroundColor: Colors.green,
        title: Text("Demo"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),hintText: 'Enter Your Email'),
              controller: idController,
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),hintText: 'Enter your name'),
              controller: request_idController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),hintText: 'age'),
              controller: attemptController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),hintText: 'Status'),
              controller: statusController,
            ),
          ),
          InkWell(
            onTap: (

                ){
              login(idController.text.toString(),
                request_idController.text.toString(),attemptController.text.toString(),
                statusController.text.toString(),);
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Mainpage()));
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("sing in",style: TextStyle(color: Colors.black),),
              ),

            ),
          )

        ],
      ),
    );
  }
}