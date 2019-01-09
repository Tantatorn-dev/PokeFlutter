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
            ),
            body: Column(
              children: <Widget>[
                PokemonPortrait(
                  image: snapshot.data.image,
                ),
                PokemonInfo(
                  pokemon: snapshot.data,
                ),
                PokemonTypeText(pokemonTypes: snapshot.data.types)
              ],
            ),
          );
        });
  }
}

class PokemonPortrait extends StatelessWidget {
  final PokemonImage image;

  PokemonPortrait({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 130.0,
      height: 130.0,
      margin: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightBlueAccent,
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(image.url))),
    ));
  }
}

class PokemonInfo extends StatelessWidget {
  final Pokemon pokemon;

  PokemonInfo({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 250.0,
            height: 150.0,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(6.0)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Weight  ${pokemon.weight / 10} kg',
                        style: PokemonInfoTextStyle.createStyle(context),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Height  ${pokemon.height / 10} m',
                          style: PokemonInfoTextStyle.createStyle(context),
                        )),
                  ],
                ),
              ],
            )));
  }
}

class PokemonInfoTextStyle {
  static TextStyle createStyle(BuildContext context) {
    return TextStyle(fontSize: 16.0);
  }
}

class PokemonTypeText extends StatelessWidget {
  final List<PokemonType> pokemonTypes;

  PokemonTypeText({Key key, this.pokemonTypes}) : super(key: key);

  List<Widget> createPokemonTypesText() {
    List<Widget> lists = [];
    for (int i = 0; i < pokemonTypes.length; i++) {
      lists.add(Container(padding: EdgeInsets.only(left: 5.0),child:Text(pokemonTypes[i].name)));
    }
    return lists;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.0,top: 10.0),
        child: Row(
      children: <Widget>[
            Text('Types',),
          ] +
          createPokemonTypesText(),
    ));
  }
}
