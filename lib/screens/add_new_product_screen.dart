import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:product_management/screens/product_list_screen.dart';
class AddNewProductScreen extends StatefulWidget {
  final Product? product;
  const AddNewProductScreen({super.key, this.product});

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
  final TextEditingController _imgTeController= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if(widget.product!=null){
      _titleTeController.text= widget.product!.productName;
      _productCodeTeController.text= widget.product!.productCode;
      _imgTeController.text=widget.product!.image;
      _quantityTeController.text=widget.product!.quantity;
      _priceTeController.text= widget.product!.unitPrice;
      _totalPriceTeController.text= widget.product!.totalPrice;
    }
    super.initState();
  }
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
  Future<void> updateProduct() async{
    final Map<String, String> inputMap={
      "Img":_imgTeController.text.trim(),
      "ProductCode":_productCodeTeController.text.trim(),
      "ProductName":_titleTeController.text.trim(),
      "Qty":_quantityTeController.text.trim(),
      "TotalPrice":_totalPriceTeController.text.trim(),
      "UnitPrice":_priceTeController.text.trim()
    };
    final Response response = await http.post(Uri.parse('https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product!.id}'),
      headers: {
        'Content-Type':'application/json'
      },
      body: jsonEncode(inputMap)
    );
    print(response.statusCode);
  }
  Future<void> addNewProduct() async{
    final Map<String, String> inputMap={
      "Img":_imgTeController.text.trim(),
      "ProductCode":_productCodeTeController.text.trim(),
      "ProductName":_titleTeController.text.trim(),
      "Qty":_quantityTeController.text.trim(),
      "TotalPrice":_totalPriceTeController.text.trim(),
      "UnitPrice":_priceTeController.text.trim()
    };
    final Response response = await http.post(Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct'),
      headers: {
        'Content-Type':'application/json'
      },
      body: jsonEncode(inputMap)
    );
    print(response.statusCode);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _imgTeController,
              decoration: const InputDecoration(
                label: Text('Image'),
                hintText: 'Enter Product Img Url',
              ),
            ),
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
                child: ElevatedButton(onPressed: (){
                  widget.product==null?addNewProduct():updateProduct();
                }, child: widget.product!=null?Text('Update'): Text('Add Product')))
          ],
        ),
      ),
    );
  }
}
