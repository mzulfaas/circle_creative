//Merupakan sebuah class model sebagai penampung dalam todolist item
//terlampir 3 parameter dibawah ini

import 'dart:math';

class Item {
  int id;
  String name;
  bool isDone;

  Item({
    required this.name,
    this.isDone = false,
  }): id = Random().nextInt(1000);
}