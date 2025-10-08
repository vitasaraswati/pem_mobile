import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item? itemArgs = ModalRoute.of(context)?.settings?.arguments as Item?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Belanja'),
      ),
      body: Center(
        child: Text(itemArgs?.name != null ? '${itemArgs!.name} with ${itemArgs!.price}' : 'No item selected'),
      ),
    );
  }
}