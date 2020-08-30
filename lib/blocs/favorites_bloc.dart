import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

import '../models/video.dart';

class FavoritesBloc implements BlocBase {
  Map<String, Video> _favorites = {};

  final StreamController<Map<String, Video>> _favoritesController =
      StreamController<Map<String, Video>>.broadcast();

  Stream<Map<String, Video>> get outFavorite => _favoritesController.stream;

  void toggleFavorite(Video video) {
    if (_favorites.containsKey(video.id)) {
      _favorites.remove(video.id);
    } else {
      _favorites[video.id] = video;
    }

    _favoritesController.sink.add(_favorites);
  }

  @override
  void dispose() {
    _favoritesController.close();
  }
}
