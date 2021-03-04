// To parse this JSON data, do
//
//     final nextResponse = nextResponseFromJson(jsonString);

import 'dart:convert';
import 'response_model.dart';

NextResponse nextResponseFromJson(String str) =>
    NextResponse.fromJson(json.decode(str));

class NextResponse {
  NextResponse({
    this.data,
    this.status,
  });

  Data? data;
  String? status;

  factory NextResponse.fromJson(Map<String, dynamic> json) => NextResponse(
        data: Data.fromJson(json["data"]),
        status: json["status"],
      );
}

class Data {
  Data({
    this.user,
  });

  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );
}

class User {
  User({
    this.edgeOwnerToTimelineMedia,
  });

  EdgeOwnerToTimelineMedia? edgeOwnerToTimelineMedia;

  factory User.fromJson(Map<String, dynamic> json) => User(
        edgeOwnerToTimelineMedia: EdgeOwnerToTimelineMedia.fromJson(
            json["edge_owner_to_timeline_media"]),
      );
}
