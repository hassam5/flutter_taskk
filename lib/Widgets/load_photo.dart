import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoadPhoto extends StatelessWidget {
  String photoUrl;
  double h;
  BoxFit boxFit;

  LoadPhoto(this.photoUrl, this.h,{this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CachedNetworkImage(
        placeholder: (context, url) => Container(
          child: Image.asset(
            'assets/images/load.png',
            width: double.infinity,
            height: h,
            fit: BoxFit.cover,
          ),
          width: double.infinity,
          height: h,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Material(
          child: Image.asset(
            'assets/images/load.png',
            width: double.infinity,
            height: h,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          clipBehavior: Clip.hardEdge,
        ),
        imageUrl: photoUrl,
        width: double.infinity,
        height: h,
        fit: boxFit,
      ),
    );
  }
}
