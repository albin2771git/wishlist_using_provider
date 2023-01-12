import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishlist_using_provider/provider/movie_provider.dart';
import 'package:wishlist_using_provider/screens/homeScreen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider<MovieProvider>(
        create: (context) => MovieProvider(),
        child: MaterialApp(
          home: HomeScreen(),
        )),
  );
}
