import 'package:flutter/material.dart';

import 'package:insta_public_api/insta_public_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: FutureBuilder(
            future: InstaPublicApi('flutter_coders').getProfilePic(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());

              return Image.network(snapshot.data);
            },
          ),
          title: const Text('Example App'),
        ),
        body: FutureBuilder(
          future: InstaPublicApi('flutter_coders').getTimelinePostsImages(),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            List<String> posts = snapshot.data;
            print(posts);
            return ListView(
                children: posts
                    .map((p) => Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            // scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: ClipRRect(
                                  child: Image.network(p),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              // ...p.images
                              //     .map(
                              //       (i) => Container(
                              //         padding:
                              //             EdgeInsets.symmetric(vertical: 10),
                              //         child: ClipRRect(
                              //           child: i.isVideo
                              //               ? Container()
                              //               : Image.network(i.displayUrl),
                              //           borderRadius: BorderRadius.circular(10),
                              //         ),
                              //       ),
                              //     )
                              //     .toList(),
                            ],
                          ),
                        ))
                    .toList());
          },
        ),
      ),
    );
  }
}
