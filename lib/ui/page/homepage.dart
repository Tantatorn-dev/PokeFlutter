import 'package:flutter/material.dart';
import '../../model/model.dart';
import '../widget/widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Pokeball(),
          title: Text('Pokedex'),
          backgroundColor: Colors.redAccent[700],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: PokeList(
              pokemon: fetchPokemonList(),
            ))
          ],
        ));
  }
}
