import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item? itemArgs =
        ModalRoute.of(context)?.settings.arguments as Item?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Barang'),
        backgroundColor: Colors.blue,
      ),
      body: itemArgs == null
          ? const Center(child: Text('No item selected'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: itemArgs.name,
                  child: Image.asset(
                    itemArgs.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  itemArgs.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp${itemArgs.price}',
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                const SizedBox(height: 8),
                Text('Stok: ${itemArgs.stock}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    Text('${itemArgs.rating}'),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Produk berkualitas tinggi dengan harga terjangkau. '
                    'Cocok untuk kebutuhan sehari-hari.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
    );
  }
}
