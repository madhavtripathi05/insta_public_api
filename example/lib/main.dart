import 'package:flutter/material.dart';

import 'package:insta_public_api/insta_public_api.dart';
import 'package:insta_public_api/models/basic_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /// Initialize with your username
  final ipa = InstaPublicApi('nikkkhil', postsLimit: 105);

  /// Helper function
  Widget makeText(String text) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Example App'),
        ),
        body: FutureBuilder(
          /// Get All post urls
          future: ipa.getAllPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            /// Wait Until data loads
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            /// List of Post
            List<Post> posts = snapshot.data;

            return ListView(children: [
              SizedBox(height: 20),
              FutureBuilder(
                future: ipa.getBasicInfo(),
                builder:
                    (BuildContext context, AsyncSnapshot<BasicInfo> snapshot) {
                  final info = snapshot.data;
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());

                  return Column(
                    children: [
                      makeText('${info.fullName}'),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child:
                                  Image.network(info.profilePic, height: 100)),
                          makeText('Posts\n${info.noOfPosts}'),
                          makeText('Followers\n${info.followers}'),
                          makeText('Following\n${info.following}'),
                        ],
                      ),
                    ],
                  );
                },
              ),
              ...posts
                  .map(
                    (p) => Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: 450,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: p.hasNestedImages
                                    ? [
                                        ...p.images
                                            .map(
                                              (i) => Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: ClipRRect(
                                                  child: Image.network(
                                                    i.displayUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius: p
                                                              .images.first ==
                                                          i
                                                      ? BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))
                                                      : p.images.last == i
                                                          ? BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10))
                                                          : BorderRadius.all(
                                                              Radius.zero),
                                                ),
                                              ),
                                            )
                                            .toList()
                                      ]
                                    : [
                                        ClipRRect(
                                            child: Image.network(p.displayUrl,
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ]),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.red,
                            ),
                            makeText(' ${p.likes}'),
                            SizedBox(width: 10),
                            Icon(
                              Icons.comment,
                              color: Colors.blue,
                            ),
                            makeText(' ${p.comments}'),
                          ],
                        ),
                        SizedBox(height: 20),
                        makeText('${p.caption}')
                      ],
                    ),
                  )
                  .toList()
            ]);
          },
        ),
      ),
    );
  }
}
