import 'package:flutter/material.dart';
import './page.dart';
import '../../model/model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
        ),
        body: PokeList(pokemon: fetchPost(),)
        );
  }
}
