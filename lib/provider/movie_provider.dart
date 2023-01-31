import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider_test/model/movie_model.dart';

final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
      imageUrl: 'https://picsum.photos/200',
        title: "Movie ${index+1}",
        runtime: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {
  // transfer initial data to another list
  final List<Movie> _movies = initialData;

  // Retrieve all movies
  List<Movie> get movies => _movies;

  // Favorite movies (that will be shown on the MyList screen)
  final List<Movie> _myList = [];

  // Retrieve favorite movies
  List<Movie> get myList => _myList;

  // Adding a movie to the favorites list
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  // Removing a movie from the favorites list
  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
