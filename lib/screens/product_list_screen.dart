import 'package:flutter/material.dart';
import 'package:product_management/screens/add_new_product_screen.dart';

import '../widgets/product_item.dart';
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index){
        return const ProductItem();
      }, separatorBuilder: (_,__)=>const SizedBox(height: 10,))
    );
  }
}

