import 'package:flutter/material.dart';
import 'package:rapunzz_shop/screens/shoplist_form.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: ItemStorage.items.length,
        itemBuilder: (context, index) {
          final item = ItemStorage.items[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              subtitle: Text(
                'Price: ${item.price}',
                style: const TextStyle(color: Colors.black54),
              ),
              isThreeLine: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()),
          );
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
