import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/92309/AndroidStudioProjects/flutter_task/lib/Widgets/load_photo.dart';

import 'package:flutter_task/app/api.dart';
import 'package:flutter_task/app/utlis.dart';
import 'package:flutter_task/model/blog_list.dart';
import 'package:flutter_task/ui/blog_detail_page.dart';
import 'package:jiffy/jiffy.dart';

class BlogListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder<List<ListBlog>>(
          future: ApiClient.apiClient.GetBlogList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return _blogList(context, snapshot.data[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox();
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  _blogList(BuildContext context, ListBlog mlists) {
    return Container(
      child: InkWell(
        onTap: () {
          navigateTo(context, BlogDetailPage(mlists.id.toString()));
        },
        child: Card(
          margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mlists.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Text(
                Jiffy(mlists.createdAt).MEd,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              LoadPhoto(
                mlists.imageUrl,
                200,
                boxFit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
