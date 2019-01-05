import 'package:flutter/material.dart';
import '../../model/model.dart';
import '../widget/widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: createAppBar(),
        body: PokeList(pokemon: fetchPost(),)
        );
  }
}
