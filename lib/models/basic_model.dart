import 'dart:convert';
import 'response_model.dart';

BasicInfo basicInfoFromJson(String str) => BasicInfo.fromJson(json.decode(str));

String basicInfoToJson(BasicInfo data) => json.encode(data.toJson());

class BasicInfo {
  BasicInfo({
    this.isPrivate,
    this.isVerified,
    this.profilePic,
    this.followers,
    this.following,
    this.fullName,
    this.noOfPosts,
    this.bio,
  });

  bool isPrivate;
  bool isVerified;
  String profilePic;
  int followers;
  int following;
  String fullName;
  int noOfPosts;
  String bio;

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
        isPrivate: json["isPrivate"],
        isVerified: json["isVerified"],
        profilePic: json["profilePic"],
        followers: json["followers"],
        following: json["following"],
        fullName: json["fullName"],
        noOfPosts: json["noOfPosts"],
        bio: json["bio"],
      );

  Map<String, dynamic> toJson() => {
        "isPrivate": isPrivate,
        "isVerified": isVerified,
        "profilePic": profilePic,
        "followers": followers,
        "following": following,
        "fullName": fullName,
        "noOfPosts": noOfPosts,
        "bio": bio,
      };
}

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.dimensions,
    this.displayUrl,
    this.isVideo,
    this.likes,
    this.comments,
    this.images,
  });

  Dimensions dimensions;
  String displayUrl;
  bool isVideo;
  int likes;
  int comments;
  List<Image> images;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        dimensions: Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["displayUrl"],
        isVideo: json["isVideo"],
        likes: json["likes"],
        comments: json["comments"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dimensions": dimensions.toJson(),
        "displayUrl": displayUrl,
        "isVideo": isVideo,
        "likes": likes,
        "comments": comments,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.id,
    this.dimensions,
    this.displayUrl,
    this.isVideo,
    this.accessibilityCaption,
  });

  String id;
  Dimensions dimensions;
  String displayUrl;
  bool isVideo;
  String accessibilityCaption;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"],
        isVideo: json["is_video"],
        accessibilityCaption: json["accessibility_caption"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dimensions": dimensions.toJson(),
        "display_url": displayUrl,
        "is_video": isVideo,
        "accessibility_caption": accessibilityCaption,
      };
}
