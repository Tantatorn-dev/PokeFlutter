import 'package:flutter/material.dart';
import '../../model/model.dart';

class PokemonPage extends StatelessWidget {
  final Future<Pokemon> pokemon;

  PokemonPage({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pokemon,
      builder: (context, snapshot) {
      return Scaffold(
          appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(snapshot.data.name),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
      ));
    });
  }
}
