import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../blocs/favorites_bloc.dart';
import '../models/video.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoritesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: StreamBuilder<Map<String, Video>>(
        stream: bloc.outFavorite,
        initialData: {},
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data.values.map((video) {
              return InkWell(
                onTap: () {},
                onLongPress: () {
                  bloc.toggleFavorite(video);
                },
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      child: Image.network(video.thumb),
                    ),
                    Expanded(
                      child: Text(
                        video.title,
                        style: TextStyle(color: Colors.white70),
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
