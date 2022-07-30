import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridList extends StatefulWidget {
  GridList({required this.pokeList});
  final List pokeList;

  @override
  _GridviewState createState() => _GridviewState();
}

//  void fetchImage(urlStart,urlEnd) {
//     var url = Uri.http(urlStart,urlEnd);
//     http.get(url).then((value) {
//       if (value.statusCode == 200) {
//         var decodedJson = jsonDecode(value.body);
//         pokeDex = decodedJson;
//       } else {
//         print('the value is ${value.statusCode} cannot be reached!');
//       }
//     });
//   }

class _GridviewState extends State<GridList> {
  @override
  Widget build(BuildContext context) {
    var list = this.widget.pokeList;
    print(list);

    return Column(
      children: [
        if (list.isNotEmpty)
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: Colors.white70),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.5),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Column(children: [
                  Text(list[index]['name']),
                  // Image.network(
                  //     list[index]['sprites']['dream_world']['front_default'])
                ]));
              },
            ),
          ))
        else
          Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }
}
