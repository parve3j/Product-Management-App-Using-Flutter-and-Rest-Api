import 'package:flutter/material.dart';
class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _titleTeController= TextEditingController();
  final TextEditingController _productCodeTeController= TextEditingController();
  final TextEditingController _quantityTeController= TextEditingController();
  final TextEditingController _priceTeController= TextEditingController();
  final TextEditingController _totalPriceTeController= TextEditingController();
  final TextEditingController _descriptionTeController= TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _titleTeController.dispose();
    _productCodeTeController.dispose();
    _quantityTeController.dispose();
    _priceTeController.dispose();
    _totalPriceTeController.dispose();
    _descriptionTeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleTeController,
              decoration: const InputDecoration(
                label: Text('Title'),
                hintText: 'Enter Product Title',
              ),
            ),
            TextFormField(
              controller: _quantityTeController,
              decoration: const InputDecoration(
                label: Text('Quantity'),
                hintText: 'Enter Product Quantity',
              ),
            ),
            TextFormField(
              controller: _productCodeTeController,
              decoration: const InputDecoration(
                label: Text('Code'),
                hintText: 'Enter Product Code',
              ),
            ),
            TextFormField(
              controller: _priceTeController,
              decoration: const InputDecoration(
                label: Text('Price'),
                hintText: 'Enter Product Price',
              ),
            ),
            TextFormField(
              controller: _totalPriceTeController,
              decoration: const InputDecoration(
                label: Text('Total Price'),
                hintText: 'Enter total Price',
              ),
            ),
            TextFormField(
              controller: _descriptionTeController,
              decoration: const InputDecoration(
                label: Text('Description'),
                hintText: 'Enter Product Description',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: const Text('Add Product')))
          ],
        ),
      ),
    );
  }
}
