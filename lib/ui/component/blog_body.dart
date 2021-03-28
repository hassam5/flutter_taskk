import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/api.dart';
import 'package:flutter_task/app/globals.dart';
import 'package:flutter_task/model/blog_list.dart';

class BlogBody extends StatefulWidget{
  String id;

  BlogBody(this.id);
  @override
  _BlogBodyState createState() => _BlogBodyState();
}



class _BlogBodyState extends State<BlogBody> {
  ListBlog Data;

  @override
  void initState() {
    super.initState();
    ApiClient.apiClient.GetBlogDetails(SavedToken, widget.id).then((value){
      Data = value;
      setState(() {

      });

      print("recieved Blog Details =" + jsonEncode(value));
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Juventus",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(Data?.createdAt.toString()?? "",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 10,),
              Image.asset("assets/images/load.png",),
              SizedBox(height: 10,),
              Text('In publishing and graphic design, Lorem ipsum is a placeholder'
                  'text commonly used to demonstrate the visual form of a document'
                  'or a typeface without relying on meaningful content. Lorem ipsum'
                  'may be used as a placeholder before final copy is available.'
                  'Lorem Ipsum has been the industry standard dummy text ever since'
                  'the 1500s, when an unknown printer took a galley of type and scrambled'
                  'it to make a type specimen book. It has survived not only five centuries,'
                  'but also the leap into electronic typesetting, remaining essentially unchanged.'
                  'Lorem Ipsum has been the industry standard dummy text ever since the 1500s,'
                  'when an unknown printer took a galley of type and scrambled it to make a'
                  'type specimen book. It has survived not only five centuries, but also '
                  'the leap into electronic typesetting, remaining essentially unchanged.'
                  'Lorem Ipsum has been the industry standard dummy text ever since the 1500s,'
                  'when an unknown printer took a galley of type and scrambled it to make '
                  'a type specimen book. It has survived not only five centuries, but '
                  'also the leap into electronic typesetting, remaining essentially unchanged.'
                  'Lorem Ipsum has been the industry standard dummy text ever since the 1500s, '
                  'when an unknown printer took a galley of type and scrambled it to make '
                  'a type specimen book. It has survived not only five centuries, but also '
                  'the leap into electronic typesetting, remaining essentially unchanged.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}