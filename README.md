# Insta Public API

Fetch details of a public Instagram account just by entering their username
```dart
// Import the package
import 'package:insta_public_api/insta_public_api.dart';

// Initialize with username (must be public)
final ipa = InstaPublicApi('username');

// Get info like Full Name, Followers, Following etc
final info = await ipa.getBasicInfo();

print('Posts: ${info.noOfPosts}');
print('Followers: ${info.followers}');
print('Following: ${info.following}');

/*
  Basic Info contains:
    isPrivate,
    isVerified,
    profilePic,
    followers,
    following,
    fullName,
    noOfPosts,
    bio and more.
*/

// Get a List of Post with nested images and details eg. number of likes, comments, caption etc for first 12 posts.
final timelinePosts = await ipa.getTimelinePosts();

// Get List of all the posts present on the profile (by default limited to 100, can be modified)
final posts = await ipa.getAllPosts();

/*
  Each Post Contains:
    Nested images,
    no. of comments,
    no. of likes,
    captions and more.
*/
```
## Example App
![Example App](https://github.com/madhavtripathi05/insta_public_api/blob/master/screenshots/ss2.jpg)
<br>
[Click Here for Code](https://github.com/madhavtripathi05/insta_public_api/tree/master/example/lib/main.dart)

## Currently Available Methods
- `String getProfilePic()` returns image url of profile pic
</br>

- `BasicInfo getBasicInfo()` returns fullName, followers, following etc.
</br>

- `List<String> getTimelinePostsImages()` returns a List of imageUrl for first 12 posts.
</br>

-  `List<Post> getTimelinePosts()` returns Post with nested images and details e.g. number of likes, comments, caption etc of first 12 posts.
</br>


-  `List<Post> getAllPosts()` returns List of all the posts present on the profile (by default limited to 100, can be modified).

**Inspired from [this](https://medium.com/@vasu.pal/crawl-instagram-profiles-and-posts-the-most-efficient-way-possible-without-fb-graph-api-7ea270b11e74) article**
