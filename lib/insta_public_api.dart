import 'package:http/http.dart' as http;

import 'models/basic_model.dart';
import 'models/response_model.dart';

class InstaPublicApi {
  final String username;

  InstaPublicApi(this.username);

  /// For Getting JSON
  Future<String> fetchResponse() async {
    final url = "https://www.instagram.com/$username/?__a=1";

    final res = await http.get(url);
    String body = res.body;

    return body;
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

  /// Returns Profile Pic of the user
  Future<String> getProfilePic() async {
    final json = await fetchResponse();
    return instaApiFromJson(json).graphql.user.profilePicUrlHd;
  }

  /// Returns Basic info like isPrivate, isVerified, profilePic, noOfPosts
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

  /// Get Nested Posts
  List<Post> getNestedPosts(List<EdgeOwnerToTimelineMediaEdge> edges) {
    return edges
        .map((e) => Post(
            comments: e.node.edgeMediaToComment.count,
            likes: e.node.edgeLikedBy.count,
            caption: e.node.edgeMediaToCaption.edges.first.node.text ?? '',
            dimensions: e.node.dimensions,
            isVideo: e.node.isVideo,
            hasNestedImages: e.node.edgeSidecarToChildren != null,
            displayUrl: e.node.displayUrl,
            images: e.node.edgeSidecarToChildren == null
                ? []
                : e.node.edgeSidecarToChildren.edges
                    .map((e) => Img(
                        id: e.node.id,
                        isVideo: e.node.isVideo,
                        dimensions: e.node.dimensions,
                        displayUrl: e.node.displayUrl,
                        accessibilityCaption:
                            e.node.accessibilityCaption ?? ''))
                    .toList()))
        .toList();
  }

  /// Returns Posts and its details e.g. likes, comments, caption etc.
  Future<List<Post>> getTimelinePosts() async {
    final json = await fetchResponse();
    var edges =
        instaApiFromJson(json).graphql.user.edgeOwnerToTimelineMedia.edges;

    return getNestedPosts(edges);
  }
}
