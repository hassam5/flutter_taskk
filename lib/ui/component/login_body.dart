import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/app/api.dart';
import 'package:flutter_task/app/globals.dart';
import 'package:flutter_task/app/utlis.dart';
import 'package:flutter_task/ui/blog_list_page.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return SafeArea(
      child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Email",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Password',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiClient.apiClient
                      .createLoginState(
                          _emailController.text, _passwordController.text)
                      .then((value) {
                    if (value.token.isNotEmpty) {
                      SavedToken = value.token;
                      print("Token = " + value.token);
                      navigateTo(context, BlogList());
                    } else {
                      print("token Not Found");
                    }
                  });
                },
                //color: Colors.blue[700],
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
