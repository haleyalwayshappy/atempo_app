import 'package:flutter/material.dart';
import 'package:radial_button/widget/circle_floating_button.dart';

// 플로팅 버튼 만들기!

class FloatingButton extends StatelessWidget{
  FloatingButton({super.key});

  var itemsActionBar = [
    FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      onPressed: () {},
      child: Icon(Icons.add),
    ),
    FloatingActionButton(
      backgroundColor: Colors.indigoAccent,
      onPressed: () {},
      child: Icon(Icons.camera),
    ),
    FloatingActionButton(
      backgroundColor: Colors.orangeAccent,
      onPressed: () {},
      child: Icon(Icons.card_giftcard),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  CircleFloatingButton.floatingActionButton(
        items: itemsActionBar,
        color: Colors.purple.shade400,
        icon: Icons.ac_unit,
        duration: Duration(milliseconds: 1000),
        curveAnim: Curves.ease,

        useOpacity: true,
      ),
    );
  }
}
