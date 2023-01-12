import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wishlist_using_provider/models/model.dart';

final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: 'Movie $index',
        runtime: '${Random().nextInt(100) + 60}minutes'));

class MovieProvider with ChangeNotifier {
  // All movies (that will be displayed on the Home screen)
  final List<Movie> _movies = initialData;

  // Retrieve all movies
  List<Movie> get movies => _movies;

  // Favorite movies (that will be shown on the MyList screen)
  final List<Movie> _myList = [];

  //retrive favorite movie
  List<Movie> get myList => _myList;

  // Adding a movie to the favorites list
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  //-------REmove------------
  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
