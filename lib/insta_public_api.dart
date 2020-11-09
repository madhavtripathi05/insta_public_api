import 'dart:html';

import 'models/basic_model.dart';
import 'models/response_model.dart' hide Dimensions;

class InstaPublicApi {
  final String username;

  InstaPublicApi(this.username);

  Future<String> fetchResponse() async {
    final url = "https://www.instagram.com/$username/?__a=1";
    return await HttpRequest.getString(url);
  }

  Future<List<String>> getTimelinePostsImages() async {
    final json = await fetchResponse();
    final images = instaApiFromJson(json)
        .graphql
        .user
        .edgeOwnerToTimelineMedia
        .edges
        .map((e) => e.node.displayUrl)
        .toList();

    return images;
  }

  Future<String> getProfilePic() async {
    final json = await fetchResponse();
    return instaApiFromJson(json).graphql.user.profilePicUrlHd;
  }

  Future<BasicInfo> getBasicInfo() async {
    final json = await fetchResponse();
    var user = instaApiFromJson(json).graphql.user;
    return BasicInfo(
      isPrivate: user.isPrivate,
      isVerified: user.isVerified,
      profilePic: user.profilePicUrlHd,
      noOfPosts: user.edgeOwnerToTimelineMedia.count,
      followers: user.edgeFollowedBy.count,
      following: user.edgeFollow.count,
      fullName: user.fullName,
      bio: user.biography,
    );
  }

  List<Post> getNestedPosts(List<EdgeFelixVideoTimelineEdge> edges) {
    return edges
        .map((e) => Post(
            comments: e.node.edgeMediaToComment.count,
            likes: e.node.edgeLikedBy.count,
            dimensions: e.node.dimensions,
            isVideo: e.node.isVideo,
            displayUrl: e.node.displayUrl,
            images: e.node.edgeSidecarToChildren.edges
                .map((e) => Img(
                    id: e.node.id,
                    isVideo: e.node.isVideo,
                    dimensions: e.node.dimensions,
                    displayUrl: e.node.displayUrl,
                    accessibilityCaption: e.node.accessibilityCaption))
                .toList()))
        .toList();
  }

  Future<List<Post>> getTimelinePosts() async {
    final json = await fetchResponse();
    var edges =
        instaApiFromJson(json).graphql.user.edgeOwnerToTimelineMedia.edges;
    return getNestedPosts(edges);
  }
}
