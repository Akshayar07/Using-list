import 'package:flutter/material.dart';

import 'detail.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                  height: 200,
                  width: 200,
                ),
                Text(
                  'Log In  Now',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please login to continue using our app',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.purple),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.purple))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.purple),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.purple))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.purple),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.purple))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.purple, fontSize: 18),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do not have an account ?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          ' Sign Up',
                          style: TextStyle(color: Colors.purple, fontSize: 18),
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Detail()));

                },
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 100),
                      child: Text('Submit'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

