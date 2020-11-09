// To parse this JSON data, do
//
//     final instaApi = instaApiFromJson(jsonString);

import 'dart:convert';

InstaApi instaApiFromJson(String str) => InstaApi.fromJson(json.decode(str));

String instaApiToJson(InstaApi data) => json.encode(data.toJson());

class InstaApi {
  InstaApi({
    this.loggingPageId,
    this.showSuggestedProfiles,
    this.showFollowDialog,
    this.graphql,
    this.toastContentOnLoad,
    this.showViewShop,
    this.profilePicEditSyncProps,
  });

  String loggingPageId;
  bool showSuggestedProfiles;
  bool showFollowDialog;
  Graphql graphql;
  dynamic toastContentOnLoad;
  bool showViewShop;
  dynamic profilePicEditSyncProps;

  factory InstaApi.fromJson(Map<String, dynamic> json) => InstaApi(
        loggingPageId: json["logging_page_id"],
        showSuggestedProfiles: json["show_suggested_profiles"],
        showFollowDialog: json["show_follow_dialog"],
        graphql: Graphql.fromJson(json["graphql"]),
        toastContentOnLoad: json["toast_content_on_load"],
        showViewShop: json["show_view_shop"],
        profilePicEditSyncProps: json["profile_pic_edit_sync_props"],
      );

  Map<String, dynamic> toJson() => {
        "logging_page_id": loggingPageId,
        "show_suggested_profiles": showSuggestedProfiles,
        "show_follow_dialog": showFollowDialog,
        "graphql": graphql.toJson(),
        "toast_content_on_load": toastContentOnLoad,
        "show_view_shop": showViewShop,
        "profile_pic_edit_sync_props": profilePicEditSyncProps,
      };
}

class Graphql {
  Graphql({
    this.user,
  });

  GraphqlUser user;

  factory Graphql.fromJson(Map<String, dynamic> json) => Graphql(
        user: GraphqlUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class GraphqlUser {
  GraphqlUser({
    this.biography,
    this.blockedByViewer,
    this.businessEmail,
    this.restrictedByViewer,
    this.countryBlock,
    this.externalUrl,
    this.externalUrlLinkshimmed,
    this.edgeFollowedBy,
    this.followedByViewer,
    this.edgeFollow,
    this.followsViewer,
    this.fullName,
    this.hasArEffects,
    this.hasClips,
    this.hasGuides,
    this.hasChannel,
    this.hasBlockedViewer,
    this.highlightReelCount,
    this.hasRequestedViewer,
    this.id,
    this.isBusinessAccount,
    this.isJoinedRecently,
    this.businessCategoryName,
    this.overallCategoryName,
    this.categoryEnum,
    this.isPrivate,
    this.isVerified,
    this.edgeMutualFollowedBy,
    this.profilePicUrl,
    this.profilePicUrlHd,
    this.requestedByViewer,
    this.username,
    this.connectedFbPage,
    this.edgeFelixVideoTimeline,
    this.edgeOwnerToTimelineMedia,
    this.edgeSavedMedia,
    this.edgeMediaCollections,
    this.edgeRelatedProfiles,
  });

  String biography;
  bool blockedByViewer;
  String businessEmail;
  dynamic restrictedByViewer;
  bool countryBlock;
  String externalUrl;
  String externalUrlLinkshimmed;
  EdgeFollowClass edgeFollowedBy;
  bool followedByViewer;
  EdgeFollowClass edgeFollow;
  bool followsViewer;
  String fullName;
  bool hasArEffects;
  bool hasClips;
  bool hasGuides;
  bool hasChannel;
  bool hasBlockedViewer;
  int highlightReelCount;
  bool hasRequestedViewer;
  String id;
  bool isBusinessAccount;
  bool isJoinedRecently;
  String businessCategoryName;
  dynamic overallCategoryName;
  String categoryEnum;
  bool isPrivate;
  bool isVerified;
  EdgeMutualFollowedBy edgeMutualFollowedBy;
  String profilePicUrl;
  String profilePicUrlHd;
  bool requestedByViewer;
  Username username;
  dynamic connectedFbPage;
  EdgeFelixVideoTimelineClass edgeFelixVideoTimeline;
  EdgeFelixVideoTimelineClass edgeOwnerToTimelineMedia;
  EdgeFelixVideoTimelineClass edgeSavedMedia;
  EdgeFelixVideoTimelineClass edgeMediaCollections;
  EdgeRelatedProfilesClass edgeRelatedProfiles;

  factory GraphqlUser.fromJson(Map<String, dynamic> json) => GraphqlUser(
        biography: json["biography"],
        blockedByViewer: json["blocked_by_viewer"],
        businessEmail: json["business_email"],
        restrictedByViewer: json["restricted_by_viewer"],
        countryBlock: json["country_block"],
        externalUrl: json["external_url"],
        externalUrlLinkshimmed: json["external_url_linkshimmed"],
        edgeFollowedBy: EdgeFollowClass.fromJson(json["edge_followed_by"]),
        followedByViewer: json["followed_by_viewer"],
        edgeFollow: EdgeFollowClass.fromJson(json["edge_follow"]),
        followsViewer: json["follows_viewer"],
        fullName: json["full_name"],
        hasArEffects: json["has_ar_effects"],
        hasClips: json["has_clips"],
        hasGuides: json["has_guides"],
        hasChannel: json["has_channel"],
        hasBlockedViewer: json["has_blocked_viewer"],
        highlightReelCount: json["highlight_reel_count"],
        hasRequestedViewer: json["has_requested_viewer"],
        id: json["id"],
        isBusinessAccount: json["is_business_account"],
        isJoinedRecently: json["is_joined_recently"],
        businessCategoryName: json["business_category_name"],
        overallCategoryName: json["overall_category_name"],
        categoryEnum: json["category_enum"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        edgeMutualFollowedBy:
            EdgeMutualFollowedBy.fromJson(json["edge_mutual_followed_by"]),
        profilePicUrl: json["profile_pic_url"],
        profilePicUrlHd: json["profile_pic_url_hd"],
        requestedByViewer: json["requested_by_viewer"],
        username: usernameValues.map[json["username"]],
        connectedFbPage: json["connected_fb_page"],
        edgeFelixVideoTimeline: EdgeFelixVideoTimelineClass.fromJson(
            json["edge_felix_video_timeline"]),
        edgeOwnerToTimelineMedia: EdgeFelixVideoTimelineClass.fromJson(
            json["edge_owner_to_timeline_media"]),
        edgeSavedMedia:
            EdgeFelixVideoTimelineClass.fromJson(json["edge_saved_media"]),
        edgeMediaCollections: EdgeFelixVideoTimelineClass.fromJson(
            json["edge_media_collections"]),
        edgeRelatedProfiles:
            EdgeRelatedProfilesClass.fromJson(json["edge_related_profiles"]),
      );

  Map<String, dynamic> toJson() => {
        "biography": biography,
        "blocked_by_viewer": blockedByViewer,
        "business_email": businessEmail,
        "restricted_by_viewer": restrictedByViewer,
        "country_block": countryBlock,
        "external_url": externalUrl,
        "external_url_linkshimmed": externalUrlLinkshimmed,
        "edge_followed_by": edgeFollowedBy.toJson(),
        "followed_by_viewer": followedByViewer,
        "edge_follow": edgeFollow.toJson(),
        "follows_viewer": followsViewer,
        "full_name": fullName,
        "has_ar_effects": hasArEffects,
        "has_clips": hasClips,
        "has_guides": hasGuides,
        "has_channel": hasChannel,
        "has_blocked_viewer": hasBlockedViewer,
        "highlight_reel_count": highlightReelCount,
        "has_requested_viewer": hasRequestedViewer,
        "id": id,
        "is_business_account": isBusinessAccount,
        "is_joined_recently": isJoinedRecently,
        "business_category_name": businessCategoryName,
        "overall_category_name": overallCategoryName,
        "category_enum": categoryEnum,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "edge_mutual_followed_by": edgeMutualFollowedBy.toJson(),
        "profile_pic_url": profilePicUrl,
        "profile_pic_url_hd": profilePicUrlHd,
        "requested_by_viewer": requestedByViewer,
        "username": usernameValues.reverse[username],
        "connected_fb_page": connectedFbPage,
        "edge_felix_video_timeline": edgeFelixVideoTimeline.toJson(),
        "edge_owner_to_timeline_media": edgeOwnerToTimelineMedia.toJson(),
        "edge_saved_media": edgeSavedMedia.toJson(),
        "edge_media_collections": edgeMediaCollections.toJson(),
        "edge_related_profiles": edgeRelatedProfiles.toJson(),
      };
}

class EdgeFelixVideoTimelineClass {
  EdgeFelixVideoTimelineClass({
    this.count,
    this.pageInfo,
    this.edges,
  });

  int count;
  PageInfo pageInfo;
  List<EdgeFelixVideoTimelineEdge> edges;

  factory EdgeFelixVideoTimelineClass.fromJson(Map<String, dynamic> json) =>
      EdgeFelixVideoTimelineClass(
        count: json["count"],
        pageInfo: PageInfo.fromJson(json["page_info"]),
        edges: List<EdgeFelixVideoTimelineEdge>.from(
            json["edges"].map((x) => EdgeFelixVideoTimelineEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "page_info": pageInfo.toJson(),
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeFelixVideoTimelineEdge {
  EdgeFelixVideoTimelineEdge({
    this.node,
  });

  PurpleNode node;

  factory EdgeFelixVideoTimelineEdge.fromJson(Map<String, dynamic> json) =>
      EdgeFelixVideoTimelineEdge(
        node: PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    this.typename,
    this.id,
    this.shortcode,
    this.dimensions,
    this.displayUrl,
    this.edgeMediaToTaggedUser,
    this.factCheckOverallRating,
    this.factCheckInformation,
    this.gatingInfo,
    this.sharingFrictionInfo,
    this.mediaOverlayInfo,
    this.mediaPreview,
    this.owner,
    this.isVideo,
    this.accessibilityCaption,
    this.edgeMediaToCaption,
    this.edgeMediaToComment,
    this.commentsDisabled,
    this.takenAtTimestamp,
    this.edgeLikedBy,
    this.edgeMediaPreviewLike,
    this.location,
    this.thumbnailSrc,
    this.thumbnailResources,
    this.edgeSidecarToChildren,
  });

  String typename;
  String id;
  String shortcode;
  Dimensions dimensions;
  String displayUrl;
  EdgeMediaToTaggedUser edgeMediaToTaggedUser;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  dynamic gatingInfo;
  SharingFrictionInfo sharingFrictionInfo;
  dynamic mediaOverlayInfo;
  String mediaPreview;
  Owner owner;
  bool isVideo;
  String accessibilityCaption;
  EdgeRelatedProfilesClass edgeMediaToCaption;
  EdgeFollowClass edgeMediaToComment;
  bool commentsDisabled;
  int takenAtTimestamp;
  EdgeFollowClass edgeLikedBy;
  EdgeFollowClass edgeMediaPreviewLike;
  dynamic location;
  String thumbnailSrc;
  List<ThumbnailResource> thumbnailResources;
  EdgeSidecarToChildren edgeSidecarToChildren;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        typename: json["__typename"],
        id: json["id"],
        shortcode: json["shortcode"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"],
        edgeMediaToTaggedUser:
            EdgeMediaToTaggedUser.fromJson(json["edge_media_to_tagged_user"]),
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        gatingInfo: json["gating_info"],
        sharingFrictionInfo:
            SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview:
            json["media_preview"] == null ? null : json["media_preview"],
        owner: Owner.fromJson(json["owner"]),
        isVideo: json["is_video"],
        accessibilityCaption: json["accessibility_caption"],
        edgeMediaToCaption:
            EdgeRelatedProfilesClass.fromJson(json["edge_media_to_caption"]),
        edgeMediaToComment:
            EdgeFollowClass.fromJson(json["edge_media_to_comment"]),
        commentsDisabled: json["comments_disabled"],
        takenAtTimestamp: json["taken_at_timestamp"],
        edgeLikedBy: EdgeFollowClass.fromJson(json["edge_liked_by"]),
        edgeMediaPreviewLike:
            EdgeFollowClass.fromJson(json["edge_media_preview_like"]),
        location: json["location"],
        thumbnailSrc: json["thumbnail_src"],
        thumbnailResources: List<ThumbnailResource>.from(
            json["thumbnail_resources"]
                .map((x) => ThumbnailResource.fromJson(x))),
        edgeSidecarToChildren: json["edge_sidecar_to_children"] == null
            ? null
            : EdgeSidecarToChildren.fromJson(json["edge_sidecar_to_children"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "shortcode": shortcode,
        "dimensions": dimensions.toJson(),
        "display_url": displayUrl,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser.toJson(),
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "gating_info": gatingInfo,
        "sharing_friction_info": sharingFrictionInfo.toJson(),
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview == null ? null : mediaPreview,
        "owner": owner.toJson(),
        "is_video": isVideo,
        "accessibility_caption": accessibilityCaption,
        "edge_media_to_caption": edgeMediaToCaption.toJson(),
        "edge_media_to_comment": edgeMediaToComment.toJson(),
        "comments_disabled": commentsDisabled,
        "taken_at_timestamp": takenAtTimestamp,
        "edge_liked_by": edgeLikedBy.toJson(),
        "edge_media_preview_like": edgeMediaPreviewLike.toJson(),
        "location": location,
        "thumbnail_src": thumbnailSrc,
        "thumbnail_resources":
            List<dynamic>.from(thumbnailResources.map((x) => x.toJson())),
        "edge_sidecar_to_children": edgeSidecarToChildren == null
            ? null
            : edgeSidecarToChildren.toJson(),
      };
}

class Dimensions {
  Dimensions({
    this.height,
    this.width,
  });

  int height;
  int width;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
      };
}

class EdgeFollowClass {
  EdgeFollowClass({
    this.count,
  });

  int count;

  factory EdgeFollowClass.fromJson(Map<String, dynamic> json) =>
      EdgeFollowClass(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class EdgeRelatedProfilesClass {
  EdgeRelatedProfilesClass({
    this.edges,
  });

  List<EdgeRelatedProfilesEdge> edges;

  factory EdgeRelatedProfilesClass.fromJson(Map<String, dynamic> json) =>
      EdgeRelatedProfilesClass(
        edges: List<EdgeRelatedProfilesEdge>.from(
            json["edges"].map((x) => EdgeRelatedProfilesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeRelatedProfilesEdge {
  EdgeRelatedProfilesEdge({
    this.node,
  });

  FluffyNode node;

  factory EdgeRelatedProfilesEdge.fromJson(Map<String, dynamic> json) =>
      EdgeRelatedProfilesEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.text,
  });

  String text;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class EdgeMediaToTaggedUser {
  EdgeMediaToTaggedUser({
    this.edges,
  });

  List<EdgeMediaToTaggedUserEdge> edges;

  factory EdgeMediaToTaggedUser.fromJson(Map<String, dynamic> json) =>
      EdgeMediaToTaggedUser(
        edges: List<EdgeMediaToTaggedUserEdge>.from(
            json["edges"].map((x) => EdgeMediaToTaggedUserEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeMediaToTaggedUserEdge {
  EdgeMediaToTaggedUserEdge({
    this.node,
  });

  TentacledNode node;

  factory EdgeMediaToTaggedUserEdge.fromJson(Map<String, dynamic> json) =>
      EdgeMediaToTaggedUserEdge(
        node: TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class TentacledNode {
  TentacledNode({
    this.user,
    this.x,
    this.y,
  });

  NodeUser user;
  double x;
  double y;

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        user: NodeUser.fromJson(json["user"]),
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "x": x,
        "y": y,
      };
}

class NodeUser {
  NodeUser({
    this.fullName,
    this.id,
    this.isVerified,
    this.profilePicUrl,
    this.username,
  });

  String fullName;
  String id;
  bool isVerified;
  String profilePicUrl;
  String username;

  factory NodeUser.fromJson(Map<String, dynamic> json) => NodeUser(
        fullName: json["full_name"],
        id: json["id"],
        isVerified: json["is_verified"],
        profilePicUrl: json["profile_pic_url"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "id": id,
        "is_verified": isVerified,
        "profile_pic_url": profilePicUrl,
        "username": username,
      };
}

class EdgeSidecarToChildren {
  EdgeSidecarToChildren({
    this.edges,
  });

  List<EdgeSidecarToChildrenEdge> edges;

  factory EdgeSidecarToChildren.fromJson(Map<String, dynamic> json) =>
      EdgeSidecarToChildren(
        edges: List<EdgeSidecarToChildrenEdge>.from(
            json["edges"].map((x) => EdgeSidecarToChildrenEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeSidecarToChildrenEdge {
  EdgeSidecarToChildrenEdge({
    this.node,
  });

  StickyNode node;

  factory EdgeSidecarToChildrenEdge.fromJson(Map<String, dynamic> json) =>
      EdgeSidecarToChildrenEdge(
        node: StickyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class StickyNode {
  StickyNode({
    this.typename,
    this.id,
    this.shortcode,
    this.dimensions,
    this.displayUrl,
    this.edgeMediaToTaggedUser,
    this.factCheckOverallRating,
    this.factCheckInformation,
    this.gatingInfo,
    this.sharingFrictionInfo,
    this.mediaOverlayInfo,
    this.mediaPreview,
    this.owner,
    this.isVideo,
    this.accessibilityCaption,
    this.dashInfo,
    this.hasAudio,
    this.trackingToken,
    this.videoUrl,
    this.videoViewCount,
  });

  Typename typename;
  String id;
  String shortcode;
  Dimensions dimensions;
  String displayUrl;
  EdgeMediaToTaggedUser edgeMediaToTaggedUser;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  dynamic gatingInfo;
  SharingFrictionInfo sharingFrictionInfo;
  dynamic mediaOverlayInfo;
  String mediaPreview;
  Owner owner;
  bool isVideo;
  String accessibilityCaption;
  DashInfo dashInfo;
  bool hasAudio;
  String trackingToken;
  String videoUrl;
  int videoViewCount;

  factory StickyNode.fromJson(Map<String, dynamic> json) => StickyNode(
        typename: typenameValues.map[json["__typename"]],
        id: json["id"],
        shortcode: json["shortcode"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"],
        edgeMediaToTaggedUser:
            EdgeMediaToTaggedUser.fromJson(json["edge_media_to_tagged_user"]),
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        gatingInfo: json["gating_info"],
        sharingFrictionInfo:
            SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview: json["media_preview"],
        owner: Owner.fromJson(json["owner"]),
        isVideo: json["is_video"],
        accessibilityCaption: json["accessibility_caption"],
        dashInfo: json["dash_info"] == null
            ? null
            : DashInfo.fromJson(json["dash_info"]),
        hasAudio: json["has_audio"] == null ? null : json["has_audio"],
        trackingToken:
            json["tracking_token"] == null ? null : json["tracking_token"],
        videoUrl: json["video_url"] == null ? null : json["video_url"],
        videoViewCount:
            json["video_view_count"] == null ? null : json["video_view_count"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typenameValues.reverse[typename],
        "id": id,
        "shortcode": shortcode,
        "dimensions": dimensions.toJson(),
        "display_url": displayUrl,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser.toJson(),
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "gating_info": gatingInfo,
        "sharing_friction_info": sharingFrictionInfo.toJson(),
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview,
        "owner": owner.toJson(),
        "is_video": isVideo,
        "accessibility_caption": accessibilityCaption,
        "dash_info": dashInfo == null ? null : dashInfo.toJson(),
        "has_audio": hasAudio == null ? null : hasAudio,
        "tracking_token": trackingToken == null ? null : trackingToken,
        "video_url": videoUrl == null ? null : videoUrl,
        "video_view_count": videoViewCount == null ? null : videoViewCount,
      };
}

class DashInfo {
  DashInfo({
    this.isDashEligible,
    this.videoDashManifest,
    this.numberOfQualities,
  });

  bool isDashEligible;
  dynamic videoDashManifest;
  int numberOfQualities;

  factory DashInfo.fromJson(Map<String, dynamic> json) => DashInfo(
        isDashEligible: json["is_dash_eligible"],
        videoDashManifest: json["video_dash_manifest"],
        numberOfQualities: json["number_of_qualities"],
      );

  Map<String, dynamic> toJson() => {
        "is_dash_eligible": isDashEligible,
        "video_dash_manifest": videoDashManifest,
        "number_of_qualities": numberOfQualities,
      };
}

class Owner {
  Owner({
    this.id,
    this.username,
  });

  String id;
  Username username;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        username: usernameValues.map[json["username"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": usernameValues.reverse[username],
      };
}

enum Username { FEED_THE_STRAY }

final usernameValues = EnumValues({"feed.the.stray": Username.FEED_THE_STRAY});

class SharingFrictionInfo {
  SharingFrictionInfo({
    this.shouldHaveSharingFriction,
    this.bloksAppUrl,
  });

  bool shouldHaveSharingFriction;
  dynamic bloksAppUrl;

  factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) =>
      SharingFrictionInfo(
        shouldHaveSharingFriction: json["should_have_sharing_friction"],
        bloksAppUrl: json["bloks_app_url"],
      );

  Map<String, dynamic> toJson() => {
        "should_have_sharing_friction": shouldHaveSharingFriction,
        "bloks_app_url": bloksAppUrl,
      };
}

enum Typename { GRAPH_IMAGE, GRAPH_VIDEO }

final typenameValues = EnumValues(
    {"GraphImage": Typename.GRAPH_IMAGE, "GraphVideo": Typename.GRAPH_VIDEO});

class ThumbnailResource {
  ThumbnailResource({
    this.src,
    this.configWidth,
    this.configHeight,
  });

  String src;
  int configWidth;
  int configHeight;

  factory ThumbnailResource.fromJson(Map<String, dynamic> json) =>
      ThumbnailResource(
        src: json["src"],
        configWidth: json["config_width"],
        configHeight: json["config_height"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
        "config_width": configWidth,
        "config_height": configHeight,
      };
}

class PageInfo {
  PageInfo({
    this.hasNextPage,
    this.endCursor,
  });

  bool hasNextPage;
  dynamic endCursor;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        hasNextPage: json["has_next_page"],
        endCursor: json["end_cursor"],
      );

  Map<String, dynamic> toJson() => {
        "has_next_page": hasNextPage,
        "end_cursor": endCursor,
      };
}

class EdgeMutualFollowedBy {
  EdgeMutualFollowedBy({
    this.count,
    this.edges,
  });

  int count;
  List<dynamic> edges;

  factory EdgeMutualFollowedBy.fromJson(Map<String, dynamic> json) =>
      EdgeMutualFollowedBy(
        count: json["count"],
        edges: List<dynamic>.from(json["edges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "edges": List<dynamic>.from(edges.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
