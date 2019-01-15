import 'package:flutter/material.dart';
import '../page/page.dart';
import '../../model/model.dart';
import '../widget/widget.dart';

class PokeList extends StatelessWidget {

  final Future<ResultList> pokemon;

  PokeList({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pokemon,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Loading();
        }
        else{return ListView.builder(
          itemCount: snapshot.data.count,
          itemBuilder: (context, index) {
            return ListTile(
              title:
                  Text('  ${index + 1}  ' + snapshot.data.results[index].name),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PokemonPage(
                              pokemon: fetchPokemonData(index + 1),
                            )));
              },
            );
          },
        );}
      },
    );
  }
}
