import 'dart:developer';

import 'package:http/http.dart' as http;

import 'models/basic_model.dart';
import 'models/next_response_model.dart';
import 'models/response_model.dart';

class InstaPublicApi {
  final String username;
  //! Override this limit at your own risk
  final int postsLimit;

  InstaPublicApi(this.username, {this.postsLimit = 100});

  /// For Getting initial JSON
  Future<String> fetchResponse() async {
    final url = "https://www.instagram.com/$username/?__a=1";

    final res = await http.get(url);
    String body = res.body;
    if (body.startsWith('<!DOCTYPE html>')) {
      log('HTML was returned instead of JSON\ni.e.You might have surpassed Instagram\'s no. of requests/hour limit');
      throw Exception(
          'HTML was returned instead of JSON\ni.e.You might have surpassed Instagram\'s no. of requests/hour limit');
    }

    return body;
  }

  /// For getting next response
  Future<String> fetchNextResponse(String id, String endCursor) async {
    final url =
        "https://www.instagram.com/graphql/query/?query_hash=58b6785bea111c67129decbe6a448951&variables=%7B%22id%22%3A%22$id%22%2C%22first%22%3A50%2C%22after%22%3A%22$endCursor%3D%3D%22%7D";
    final res = await http.get(url);
    String body = res.body;
    return body;
  }

  void checkPrivate(bool isPrivate) {
    if (isPrivate) {
      log('Private account!\nPlease enter username of a public account!',
          name: 'Insta Public API');
      throw Exception(
          'Private account!\nPlease enter username of a public account!');
    }
  }

  /// Get all posts
  Future<List<Post>> getAllPosts() async {
    List<Post> posts;
    final initialJson = await fetchResponse();
    checkPrivate(instaApiFromJson(initialJson).graphql.user.isPrivate);
    final id = instaApiFromJson(initialJson).graphql.user.id;
    bool hasNextPage = instaApiFromJson(initialJson)
        .graphql
        .user
        .edgeOwnerToTimelineMedia
        .pageInfo
        .hasNextPage;
    String endCursor = instaApiFromJson(initialJson)
        .graphql
        .user
        .edgeOwnerToTimelineMedia
        .pageInfo
        .endCursor;
    final initialEdges = instaApiFromJson(initialJson)
        .graphql
        .user
        .edgeOwnerToTimelineMedia
        .edges;

    posts = getNestedPosts(initialEdges);
    final totalPosts = instaApiFromJson(initialJson)
        .graphql
        .user
        .edgeOwnerToTimelineMedia
        .count;
    int counter = 12;
    if (totalPosts > postsLimit)
      log('Total Posts are more than the specified limit, this might result in a huge time to load posts and might surpass Instagram\'s no. of requests/hour limit',
          name: "Insta Public API");

    while (hasNextPage) {
      if (counter > postsLimit) {
        log('loaded $counter posts!', name: "Insta Public API");
        break;
      }
      final json = await fetchNextResponse(
          id, endCursor.substring(0, endCursor.length - 2));
      hasNextPage = nextResponseFromJson(json)
          .data
          .user
          .edgeOwnerToTimelineMedia
          .pageInfo
          .hasNextPage;
      endCursor = nextResponseFromJson(json)
          .data
          .user
          .edgeOwnerToTimelineMedia
          .pageInfo
          .endCursor;
      final edges =
          nextResponseFromJson(json).data.user.edgeOwnerToTimelineMedia.edges;
      final tempPosts = getNestedPosts(edges);
      posts += tempPosts;
      counter += tempPosts.length;
    }

    return posts;
  }

  //  Get first 12 image urls
  Future<List<String>> getTimelinePostsImages() async {
    final json = await fetchResponse();

    checkPrivate(instaApiFromJson(json).graphql.user.isPrivate);
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
            likes: e.node.edgeMediaPreviewLike.count ?? 0,
            caption: e.node.edgeMediaToCaption.edges.isNotEmpty
                ? e.node.edgeMediaToCaption.edges?.first?.node?.text ?? ''
                : '',
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

  /// Returns first 12 Posts and its details e.g. likes, comments, caption etc.
  Future<List<Post>> getTimelinePosts() async {
    final json = await fetchResponse();

    checkPrivate(instaApiFromJson(json).graphql.user.isPrivate);

    var edges =
        instaApiFromJson(json).graphql.user.edgeOwnerToTimelineMedia.edges;

    return getNestedPosts(edges);
  }
}
