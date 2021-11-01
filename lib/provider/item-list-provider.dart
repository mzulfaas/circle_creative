// class ini digunakan sebagai management state atau proses saat klik button
// terdapat fungsi yaitu addItem(), updateItem(), dan deleteItem(),

import 'package:circle_creative/model/item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//deklarasi provider sebagai globalVariable yang nanti akan digunakan di
//halaman ui sebagai lalulintas event-state "merujuk kepada penggunaan plugin
// hooks_riverpod 0.14.0+5 pada pub.dev"
final itemListProvider = StateNotifierProvider<ItemListNotifier, List<Item>>(
  (_) => ItemListNotifier(),
);

class ItemListNotifier extends StateNotifier<List<Item>> {
  ItemListNotifier() : super([]);

  // fungsi penambahan todolist item dari controller pada TextField yang akan
  //menampilkan pada CheckboxListTile
  //String name =  parameter yang menampung saat kita mengetikan pada textfield
  void addItem(String name) {
    // fungsi update
    List<Item> _listAddItem = [...state];
    final newAddItem = Item(name: name);
    _listAddItem.add(newAddItem);
    state = _listAddItem;
  }

  //fungsi untuk mengupdate item pada checkbox
  void updateItem(Item item) {
    state = [
      for (var i in state)
        if (i.id == item.id) item else i,
    ];
  }

  //fungsi untuk menghapus item pada checkbox
  void deleteItem(Item item) {
    state = state..removeWhere((element) => element.id == item.id);
  }
}
