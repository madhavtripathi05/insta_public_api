import 'package:flutter/material.dart';

import 'package:insta_public_api/insta_public_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            List<String> images = snapshot.data;

            return ListView(
                children: images
                    .map((i) => Container(
                          padding: EdgeInsets.all(20),
                          child: ClipRRect(
                            child: Image.network(i),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))
                    .toList());
          },
        ),
      ),
    );
  }
}
