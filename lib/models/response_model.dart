import 'dart:convert';

InstaApi instaApiFromJson(String str) => InstaApi.fromJson(json.decode(str));

/// Entry point of InstaApi
class InstaApi {
  InstaApi({
    this.graphql,
  });

  Graphql? graphql;

  ///from json
  factory InstaApi.fromJson(Map<String, dynamic> json) => InstaApi(
        graphql:
            json["graphql"] == null ? null : Graphql.fromJson(json["graphql"]),
      );
}

/// Graphql [User]
class Graphql {
  Graphql({
    this.user,
  });

  User? user;

  ///from json
  factory Graphql.fromJson(Map<String, dynamic> json) => Graphql(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
}

/// [User]
class User {
  User({
    this.biography,
    this.externalUrl,
    this.externalUrlLinkshimmed,
    this.edgeFollowedBy,
    this.followedByViewer,
    this.edgeFollow,
    this.fullName,
    this.id,
    this.isBusinessAccount,
    this.isJoinedRecently,
    this.isPrivate,
    this.isVerified,
    this.profilePicUrl,
    this.profilePicUrlHd,
    this.requestedByViewer,
    this.username,
    this.edgeOwnerToTimelineMedia,
  });

  String? biography;
  String? externalUrl;
  String? externalUrlLinkshimmed;
  Edge? edgeFollowedBy;
  bool? followedByViewer;
  Edge? edgeFollow;
  String? fullName;
  String? id;
  bool? isBusinessAccount;
  bool? isJoinedRecently;
  bool? isPrivate;
  bool? isVerified;
  String? profilePicUrl;
  String? profilePicUrlHd;
  bool? requestedByViewer;
  String? username;
  EdgeOwnerToTimelineMedia? edgeOwnerToTimelineMedia;

  ///from json
  factory User.fromJson(Map<String, dynamic> json) => User(
        biography: json["biography"] == null ? null : json["biography"],
        externalUrl: json["external_url"] == null ? null : json["external_url"],
        externalUrlLinkshimmed: json["external_url_linkshimmed"] == null
            ? null
            : json["external_url_linkshimmed"],
        edgeFollowedBy: json["edge_followed_by"] == null
            ? null
            : Edge.fromJson(json["edge_followed_by"]),
        followedByViewer: json["followed_by_viewer"] == null
            ? null
            : json["followed_by_viewer"],
        edgeFollow: json["edge_follow"] == null
            ? null
            : Edge.fromJson(json["edge_follow"]),
        fullName: json["full_name"] == null ? null : json["full_name"],
        id: json["id"] == null ? null : json["id"],
        isBusinessAccount: json["is_business_account"] == null
            ? null
            : json["is_business_account"],
        isJoinedRecently: json["is_joined_recently"] == null
            ? null
            : json["is_joined_recently"],
        isPrivate: json["is_private"] == null ? null : json["is_private"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        profilePicUrl:
            json["profile_pic_url"] == null ? null : json["profile_pic_url"],
        profilePicUrlHd: json["profile_pic_url_hd"] == null
            ? null
            : json["profile_pic_url_hd"],
        requestedByViewer: json["requested_by_viewer"] == null
            ? null
            : json["requested_by_viewer"],
        username: json["username"] == null ? null : json["username"],
        edgeOwnerToTimelineMedia: json["edge_owner_to_timeline_media"] == null
            ? null
            : EdgeOwnerToTimelineMedia.fromJson(
                json["edge_owner_to_timeline_media"]),
      );
}

/// Edge [count]
class Edge {
  Edge({
    this.count,
  });

  int? count;

  ///from json
  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        count: json["count"] == null ? null : json["count"],
      );
}

/// EdgeOwnerToTimelineMedia [count, pageInfo, edges]
class EdgeOwnerToTimelineMedia {
  EdgeOwnerToTimelineMedia({
    this.count,
    this.pageInfo,
    this.edges,
  });

  int? count;
  PageInfo? pageInfo;
  List<EdgeOwnerToTimelineMediaEdge>? edges;

  ///from json
  factory EdgeOwnerToTimelineMedia.fromJson(Map<String, dynamic> json) =>
      EdgeOwnerToTimelineMedia(
        count: json["count"] == null ? null : json["count"],
        pageInfo: json["page_info"] == null
            ? null
            : PageInfo.fromJson(json["page_info"]),
        edges: json["edges"] == null
            ? null
            : List<EdgeOwnerToTimelineMediaEdge>.from(json["edges"]
                .map((x) => EdgeOwnerToTimelineMediaEdge.fromJson(x))),
      );
}

/// Graphql [EdgeOwnerToTimelineMediaEdge]
class EdgeOwnerToTimelineMediaEdge {
  EdgeOwnerToTimelineMediaEdge({
    this.node,
  });

  PurpleNode? node;

  ///from json
  factory EdgeOwnerToTimelineMediaEdge.fromJson(Map<String, dynamic> json) =>
      EdgeOwnerToTimelineMediaEdge(
        node: json["node"] == null ? null : PurpleNode.fromJson(json["node"]),
      );
}

/// Graphql [PurpleNode]
class PurpleNode {
  PurpleNode({
    this.typename,
    this.id,
    this.shortcode,
    this.dimensions,
    this.displayUrl,
    this.owner,
    this.isVideo,
    this.accessibilityCaption,
    this.edgeMediaToCaption,
    this.edgeMediaToComment,
    this.commentsDisabled,
    this.takenAtTimestamp,
    this.edgeLikedBy,
    this.edgeMediaPreviewLike,
    this.edgeSidecarToChildren,
  });

  String? typename;
  String? id;
  String? shortcode;
  Dimensions? dimensions;
  String? displayUrl;
  Owner? owner;
  bool? isVideo;
  String? accessibilityCaption;
  EdgeMediaToCaption? edgeMediaToCaption;
  Edge? edgeMediaToComment;
  bool? commentsDisabled;
  int? takenAtTimestamp;
  Edge? edgeLikedBy;
  Edge? edgeMediaPreviewLike;
  EdgeSidecarToChildren? edgeSidecarToChildren;

  ///from json
  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        typename: json["__typename"] == null ? null : json["__typename"],
        id: json["id"] == null ? null : json["id"],
        shortcode: json["shortcode"] == null ? null : json["shortcode"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"] == null ? null : json["display_url"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        isVideo: json["is_video"] == null ? null : json["is_video"],
        accessibilityCaption: json["accessibility_caption"] == null
            ? null
            : json["accessibility_caption"],
        edgeMediaToCaption: json["edge_media_to_caption"] == null
            ? null
            : EdgeMediaToCaption.fromJson(json["edge_media_to_caption"]),
        edgeMediaToComment: json["edge_media_to_comment"] == null
            ? null
            : Edge.fromJson(json["edge_media_to_comment"]),
        commentsDisabled: json["comments_disabled"] == null
            ? null
            : json["comments_disabled"],
        takenAtTimestamp: json["taken_at_timestamp"] == null
            ? null
            : json["taken_at_timestamp"],
        edgeLikedBy: json["edge_liked_by"] == null
            ? null
            : Edge.fromJson(json["edge_liked_by"]),
        edgeMediaPreviewLike: json["edge_media_preview_like"] == null
            ? null
            : Edge.fromJson(json["edge_media_preview_like"]),
        edgeSidecarToChildren: json["edge_sidecar_to_children"] == null
            ? null
            : EdgeSidecarToChildren.fromJson(json["edge_sidecar_to_children"]),
      );
}

/// Dimensions [height, width]
class Dimensions {
  Dimensions({
    this.height,
    this.width,
  });

  int? height;
  int? width;

  ///from json
  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
      );
}

/// List of captions
class EdgeMediaToCaption {
  EdgeMediaToCaption({
    this.edges,
  });

  List<EdgeMediaToCaptionEdge>? edges;

  /// List of captions from json
  factory EdgeMediaToCaption.fromJson(Map<String, dynamic> json) =>
      EdgeMediaToCaption(
        edges: json["edges"] == null
            ? null
            : List<EdgeMediaToCaptionEdge>.from(
                json["edges"].map((x) => EdgeMediaToCaptionEdge.fromJson(x))),
      );
}

/// Graphql [EdgeMediaToCaptionEdge]
class EdgeMediaToCaptionEdge {
  EdgeMediaToCaptionEdge({
    this.node,
  });

  FluffyNode? node;

  ///from json
  factory EdgeMediaToCaptionEdge.fromJson(Map<String, dynamic> json) =>
      EdgeMediaToCaptionEdge(
        node: json["node"] == null ? null : FluffyNode.fromJson(json["node"]),
      );
}

/// Graphql [FluffyNode ]
class FluffyNode {
  FluffyNode({
    this.text,
  });

  String? text;

  ///from json
  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        text: json["text"] == null ? null : json["text"],
      );
}

/// Graphql [EdgeSidecarToChildren ]
class EdgeSidecarToChildren {
  EdgeSidecarToChildren({
    this.edges,
  });

  List<EdgeSidecarToChildrenEdge>? edges;

  ///from json
  factory EdgeSidecarToChildren.fromJson(Map<String, dynamic> json) =>
      EdgeSidecarToChildren(
        edges: json["edges"] == null
            ? null
            : List<EdgeSidecarToChildrenEdge>.from(json["edges"]
                .map((x) => EdgeSidecarToChildrenEdge.fromJson(x))),
      );
}

/// Graphql [EdgeSidecarToChildrenEdge]
class EdgeSidecarToChildrenEdge {
  EdgeSidecarToChildrenEdge({
    this.node,
  });

  TentacledNode? node;

  ///from json
  factory EdgeSidecarToChildrenEdge.fromJson(Map<String, dynamic> json) =>
      EdgeSidecarToChildrenEdge(
        node:
            json["node"] == null ? null : TentacledNode.fromJson(json["node"]),
      );
}

/// Graphql [TentacledNode]
class TentacledNode {
  TentacledNode({
    this.typename,
    this.id,
    this.shortcode,
    this.dimensions,
    this.displayUrl,
    this.mediaPreview,
    this.owner,
    this.isVideo,
    this.accessibilityCaption,
  });

  String? typename;
  String? id;
  String? shortcode;
  Dimensions? dimensions;
  String? displayUrl;
  String? mediaPreview;
  Owner? owner;
  bool? isVideo;
  String? accessibilityCaption;

  ///from json
  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        typename: json["__typename"] == null ? null : json["__typename"],
        id: json["id"] == null ? null : json["id"],
        shortcode: json["shortcode"] == null ? null : json["shortcode"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"] == null ? null : json["display_url"],
        mediaPreview:
            json["media_preview"] == null ? null : json["media_preview"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        isVideo: json["is_video"] == null ? null : json["is_video"],
        accessibilityCaption: json["accessibility_caption"] == null
            ? null
            : json["accessibility_caption"],
      );
}

/// Graphql [Owner]
class Owner {
  Owner({
    this.id,
    this.username,
  });

  String? id;
  String? username;

  ///from json
  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
      );
}

/// Graphql [PageInfo]
class PageInfo {
  PageInfo({
    this.hasNextPage,
    this.endCursor,
  });

  bool? hasNextPage;
  String? endCursor;

  ///from json
  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        hasNextPage:
            json["has_next_page"] == null ? null : json["has_next_page"],
        endCursor: json["end_cursor"] == null ? null : json["end_cursor"],
      );
}
