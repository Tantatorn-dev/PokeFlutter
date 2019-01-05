import 'package:flutter/material.dart';

class Pokeball extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:30.0,
      height: 30.0,
      child:Image.asset('assets/images/pokeball.png'),);
  }

}