import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'component/blog_body.dart';

class BlogPage extends StatefulWidget{
  String id;

  BlogPage(this.id);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Juventus",
        ),
      ),
      body: BlogBody(widget.id),
    );
  }
}