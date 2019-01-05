import 'package:flutter/material.dart';
import './pokeball.dart';


Widget createAppBar(){
  return AppBar(
          leading: Pokeball(),
          title: Text('Pokedex'),
          backgroundColor: Colors.redAccent[700],
        );
}