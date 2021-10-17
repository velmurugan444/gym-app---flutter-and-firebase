import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrainerViedoScreen extends StatefulWidget {
  @override
  _TrainerViedoScreenState createState() => _TrainerViedoScreenState();
}

class _TrainerViedoScreenState extends State<TrainerViedoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('viedos').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot myPost = snapshot.data.documents[index];
                  var url = myPost['url'];

                  YoutubePlayerController _controller = YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(url),
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                      disableDragSeek: false,
                      loop: false,
                      isLive: false,
                      forceHD: false,
                    ),
                  );
                  return Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0,
                                shadowColor: Color(0x802196F3),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 200.0,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: YoutubePlayer(
                                                controller: _controller,
                                                liveUIColor: Colors.amber,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${myPost['title']}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.justify,
                                            ),
                                            SizedBox(width: 15),
                                            GestureDetector(
                                                onTap: () {
                                                  FirebaseFirestore.instance
                                                      .collection("viedos")
                                                      .where("title",
                                                          isEqualTo:
                                                              myPost['title'])
                                                      .where("description",
                                                          isEqualTo: myPost[
                                                              'description'])
                                                      .get()
                                                      .then((snapshot) =>
                                                          snapshot.docs.first
                                                              .reference
                                                              .delete());
                                                },
                                                child: Icon(Icons.delete))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '${myPost['description']}',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
