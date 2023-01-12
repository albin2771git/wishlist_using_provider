import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wishlist_using_provider/provider/movie_provider.dart';

import 'myListScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    // var myList = context.watch().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyListScreen()));
              },
              icon: Icon(Icons.favorite),
              label: Text(
                'Go To My List(${myList.length})',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 20)),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final currentMovie = movies[index];
                      return Card(
                        key: ValueKey(currentMovie.title),
                        color: Colors.amberAccent.shade100,
                        elevation: 4,
                        child: ListTile(
                          title: Text(currentMovie.title),
                          subtitle:
                              Text(currentMovie.runtime ?? 'No information'),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: myList.contains(currentMovie)
                                  ? Colors.red
                                  : Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              if (!myList.contains(currentMovie)) {
                                context
                                    .read<MovieProvider>()
                                    .addToList(currentMovie);
                              } else {
                                context
                                    .read<MovieProvider>()
                                    .removeFromList(currentMovie);
                              }
                            },
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
