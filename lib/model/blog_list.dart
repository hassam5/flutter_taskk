

import 'dart:convert';

List<ListBlog> listBlogFromJson(String str) => List<ListBlog>.from(json.decode(str).map((x) => ListBlog.fromJson(x)));

String listBlogToJson(List<ListBlog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListBlog {
  ListBlog({
    this.id,
    this.createdAt,
    this.title,
    this.imageUrl,
  });

  String id;
  DateTime createdAt;
  String title;
  String imageUrl;

  factory ListBlog.fromJson(Map<String, dynamic> json) => ListBlog(
    id: json["id"] == null ? null : json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    title: json["title"] == null ? null : json["title"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "title": title == null ? null : title,
    "imageUrl": imageUrl == null ? null : imageUrl,
  };
}
