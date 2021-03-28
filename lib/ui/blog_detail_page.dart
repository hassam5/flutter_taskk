import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'component/blog_body.dart';

class BlogDetailPage extends StatefulWidget{
  String id;

  BlogDetailPage(this.id);

  @override
  _BlogDetailPageState createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlogBody(widget.id),
    );
  }
}