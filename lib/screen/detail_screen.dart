import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:netflix_clone/model/model_movie.dart';

class DetailScreen extends StatefulWidget{
  final Movie? movie;

  DetailScreen({this.movie});

  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{
  bool like = false;

  @override
  void initState(){
    super.initState();
    like = widget.movie!.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/' + widget.movie!.poster),
                            fit: BoxFit.cover
                        )),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child: Image.asset('images/' + widget.movie!.poster),
                                  height: 300
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    '0999',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13)
                                  )
                                ),
                                Container(
                                    padding: EdgeInsets.all(7),
                                    child: Text(
                                        widget.movie!.title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                                    )
                                ),
                                Container(
                                    padding: EdgeInsets.all(3),
                                    child: FlatButton(
                                      onPressed: () {},
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.play_arrow),
                                          Text('Play')
                                        ],
                                      )
                                    )
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(widget.movie!.toString())
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'actor : son, hyun'
                                  )
                                )
                              ]
                            )
                          )

                        )
                      )
                    )
                  ),
                  Positioned(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    )
                  )
                ],
              ),
              // menu
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: InkWell(
                        onTap: () {},
                        child: Column(children: <Widget>[
                          like ? Icon(Icons.check) : Icon(Icons.add),
                          Padding(
                            padding: EdgeInsets.all(5)
                          ),
                          Text(
                            'JJIM',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white60
                            )
                          )
                        ],)
                      )
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              'Reputation',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60
                              )
                            )
                          ],
                        )
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Container(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.send),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                Text(
                                    'Share',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white60
                                    )
                                )
                              ],
                            )
                        )
                    )

                  ],
                )
              )
            ],
          )
        )
      )
    );
  }
}