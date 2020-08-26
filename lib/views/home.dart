import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tube/delegates/data_search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Image.asset('images/yt_logo_rgb_dark.png', height: 25),
        actions: [
          Align(alignment: Alignment.center, child: Text('0')),
          IconButton(icon: Icon(Icons.star), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
