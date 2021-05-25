// To parse this JSON data, do
//
//     final nextResponse = nextResponseFromJson(jsonString);

import 'dart:convert';
import 'response_model.dart';

NextResponse nextResponseFromJson(String str) =>
    NextResponse.fromJson(json.decode(str));

/// Next Response
class NextResponse {
  NextResponse({
    this.data,
    this.status,
  });

  Data? data;
  String? status;

  ///from json
  factory NextResponse.fromJson(Map<String, dynamic> json) => NextResponse(
        data: Data.fromJson(json["data"]),
        status: json["status"],
      );
}

/// Data
class Data {
  Data({
    this.user,
  });

  User? user;

  ///from json
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );
}

/// User
class User {
  User({
    this.edgeOwnerToTimelineMedia,
  });

  EdgeOwnerToTimelineMedia? edgeOwnerToTimelineMedia;

  ///from json
  factory User.fromJson(Map<String, dynamic> json) => User(
        edgeOwnerToTimelineMedia: EdgeOwnerToTimelineMedia.fromJson(
            json["edge_owner_to_timeline_media"]),
      );
}
