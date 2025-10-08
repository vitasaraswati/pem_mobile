import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item? item;
  const ItemPage({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Barang')),
      body: item == null
          ? const Center(child: Text('Tidak ada item yang dipilih'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: item!.name,
                  child: Image.asset(
                    item!.image,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  item!.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Harga: Rp${item!.price}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text('Stok: ${item!.stock}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    Text('${item!.rating}'),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(12),
        child: const Text(
          'Vita — 2341760082',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
