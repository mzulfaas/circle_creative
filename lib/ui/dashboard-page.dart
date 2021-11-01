import 'package:circle_creative/model/item.dart';
import 'package:circle_creative/provider/item-list-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//file ini merupaka ui pada tampilan aplikasi
//mengikuti panduan penggunaan Riverpod menggunakan flutter_hooks: ^0.18.0
//extends menggunakan HookWidget , dikarenakan diperlukanya
//useTextEditingController

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller yang digunakan didalam textfield sebagai isi dari todolist
    final todolistcontroller = useTextEditingController();
    //Scaffold widget parent yang menampung semua widget turunan ibarat sebuah
    //papan tulis
    return Scaffold(
      //widget judul text yang berada pada posisi atas layar aplikasi
      appBar: AppBar(
        //keterangan
        title: Text("TodoList"),
      ),
      body: Column(
        children: [
          //widget untuk menginput todolist
          TextField(
            decoration: const InputDecoration(
              labelText: "Todo",
            ),
            //controller penampung hasil ketikan kita
            controller: todolistcontroller,
            //kondisi setelah kita mengklik pada textfield akan memanggil state
            //pada file item-list-provider.dart untuk menambahkan item todolist
            onSubmitted: (value){
              context.read(itemListProvider.notifier).addItem(Item(name: value).name);
              todolistcontroller.clear();
            },
          ),
          Expanded(
            //Consumer widget ini agar bisa menerima perubahan pada provider
            //apabila membutuhkan auto update pada tampilan saat dibutuhkan
            //melalui builder watch
            child: Consumer(builder: (context, watch, child) {
              //deklarasi pemanggilan itemListProvider
              final itemList = watch(itemListProvider);
              return ListView.builder(
                //parameter banyaknya list data yang ditampilkan
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  //nilai dari item yang akan diambil pada widget
                  final Item item =itemList[index];
                  return Dismissible(
                    key: ValueKey(item.id),
                    //untuk mengahapus item dengan memanggil deleteItem pada
                    //itemListProvider
                    onDismissed: (direction){
                      context.read(itemListProvider.notifier).deleteItem(item);
                    },
                    child: CheckboxListTile(
                        value: item.isDone,
                        title: Text(item.name),
                        //untuk update is done state yang ada di funsgi itemListProvider
                        onChanged: (value){
                          context.read(itemListProvider.notifier).updateItem(item..isDone=value??false);
                        }),
                  );
                },);
            },),
          )
        ],
      ),
    );
  }
}