import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix_clone/model/model_movie.dart';

import 'package:netflix_clone/widget/carousel_slider.dart';
import 'package:netflix_clone/widget/circle_slider.dart';
import 'package:netflix_clone/widget/box_slider.dart';

class HomeScreen extends StatefulWidget{
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  // List<Movie> movies = [
  //   Movie.fromMap({
  //     'title': 'love acc',
  //     'keyword': 'romance',
  //     'poster': 'test_movie_1.png',
  //     'like': false
  //   })
  // ];

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Stream<QuerySnapshot> streamData;
  final Stream<QuerySnapshot> _streamData = FirebaseFirestore.instance.collection('movie').snapshots();


  @override
  void initState(){
    super.initState();
    //streamData = firestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
        //streamData = FirebaseFirestore.instance.collection('movie').snapshots(),
        stream: _streamData,
        builder: (context, snapshot){
          if( !snapshot.hasData) return LinearProgressIndicator();
          return _buildBody(context, snapshot);
        }
    );
  }

  Widget _buildBody(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
    //List<Movie> movies = snapshot.map( (id) => Movie.fromSnapShot(d)).toList();
    //return ListView();

    //List<Movie> movies = snapshot.data!.docs.map( (DocumentSnapshot document)).toList();
    List<Movie> movies = snapshot.data!.docs.map( (DocumentSnapshot document) => Movie.fromSnapshot(document)).toList();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies),
            TopBar()
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies)
      ]
    );
    // return ListView(
    //   children: snapshot.data!.docs.map( (DocumentSnapshot document){
    //     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    //     return ListTile(
    //       title: Text('aaa')
    //     );
    //   }).toList(),
    // );
  }

  @override
  Widget build(BuildContext context){
    // return TopBar();
    // return ListView(children: <Widget>[
    //   Stack(children: <Widget>[
    //     CarouselImage(movies: movies),
    //     TopBar()
    //   ]),
    //   CircleSlider(movies: movies ),
    //   BoxSlider(movies: movies)
    // ],);
    return _fetchData(context);
  }
}


class TopBar extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/netflix_logo.png',
            fit: BoxFit.contain,
            height:25
          ),
          Container(
            padding: const EdgeInsets.only(right:1),
            child: const Text('TV Program',
                        style: TextStyle(fontSize: 14))
          ),
          Container(
              padding: const EdgeInsets.only(right:1),
              child: const Text('Movies',
                        style: TextStyle(fontSize: 14))
          ),
          Container(
              padding: const EdgeInsets.only(right:1),
              child: const Text('jjim',
                        style: TextStyle(fontSize: 14))
          ),
        ],
      )
    );
  }
}