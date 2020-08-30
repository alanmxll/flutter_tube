import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/video.dart';

class FavoritesBloc implements BlocBase {
  Map<String, Video> _favorites = {};

  final StreamController<Map<String, Video>> _favoritesController =
      StreamController<Map<String, Video>>.broadcast();

  Stream<Map<String, Video>> get outFavorite => _favoritesController.stream;

  FavoritesBloc() {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getKeys().contains('favorites')) {
        _favorites = json
            .decode(prefs.getString('favorites'))
            .map((key, value) => MapEntry(key, Video.fromJson(value)))
            .cast<String, Video>();

        _favoritesController.add(_favorites);
      }
    });
  }

  void toggleFavorite(Video video) {
    if (_favorites.containsKey(video.id)) {
      _favorites.remove(video.id);
    } else {
      _favorites[video.id] = video;
    }

    _favoritesController.sink.add(_favorites);

    _saveFavorites();
  }

  void _saveFavorites() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('favorites', json.encode(_favorites));
    });
  }

  @override
  void dispose() {
    _favoritesController.close();
  }
}
