import 'response_model.dart';

/// [Basic Info]
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

  bool? isPrivate;
  bool? isVerified;
  String? profilePic;
  int? followers;
  int? following;
  String? fullName;
  int? noOfPosts;
  String? bio;
}

/// [Post]
class Post {
  Post({
    this.dimensions,
    this.displayUrl,
    this.caption,
    this.hasNestedImages,
    this.isVideo,
    this.likes,
    this.comments,
    this.images,
  });

  Dimensions? dimensions;
  String? displayUrl;
  bool? isVideo;
  int? likes;
  bool? hasNestedImages;
  String? caption;
  int? comments;
  List<Img>? images;
}

/// [Img]
class Img {
  Img({
    this.id,
    this.dimensions,
    this.displayUrl,
    this.isVideo,
    this.accessibilityCaption,
  });

  String? id;
  Dimensions? dimensions;
  String? displayUrl;
  bool? isVideo;
  String? accessibilityCaption;
}
