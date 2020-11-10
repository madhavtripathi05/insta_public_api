# Insta Public Api

Get Details of a Public Instagram Account just by entering it's username
```
// Initialize with username
final ipa = InstaPublicApi('username');

// Get info like Full Name, Followers, Following etc
final info = ipa.getBasicInfo();


```
## Example App
![Example App](screenshots/sr.gif)
<br>
[Click Here for Code](example/lib/main.dart)

## Currently Available Methods
- `String getProfilePic()` returns image url of profile pic
</br>

- `BasicInfo getBasicInfo()` returns fullName, followers, following etc.
</br>

- `List<String> getTimelinePostsImages()` returns a List of imageUrl for each post
</br>

- **WIP** `List<Post> getTimelinePosts()` returns Post(and nested images) with details e.g. no. of likes, comments, caption etc
</br>
