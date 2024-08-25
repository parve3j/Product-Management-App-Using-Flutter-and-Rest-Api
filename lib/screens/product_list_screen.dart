import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:product_management/screens/add_new_product_screen.dart';

import '../widgets/product_item.dart';
import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool inProgress=false;

  @override
  void initState() {
    // TODO: implement initState
    getProductList();
    super.initState();
  }

  void getProductList() async {
    setState(() {
      inProgress=true;
    });
    Response response = await http
        .get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    print("*******************************************");
    print(response.statusCode);
    print(response.body);
    print("********************************************");

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        productList.clear();
        for (Map<String, dynamic> productJson in responseData['data']) {
          productList.add(Product(
            productJson['_id'] ?? 'N/A',
            productJson['ProductName'] ?? 'Unknown Product',
            productJson['ProductCode'] ?? '000000',
            productJson['Img'] ?? 'https://default-image-url.com',  // Provide a default image URL
            productJson['UnitPrice'] ?? '0 TK',
            productJson['Qty'] ?? '0',
            productJson['TotalPrice'] ?? '0 TK',
          ));
        }
      }else{
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        print("Api error: ${responseData['status']}");
        print("Api error: ${response.statusCode}");
      }
    }
    inProgress=false;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
          actions: [
            IconButton(onPressed: (){
              getProductList();
            }, icon: Icon(Icons.refresh))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNewProductScreen()));
          },
          child: const Icon(Icons.add),
        ),
        body: inProgress? Center(child: CircularProgressIndicator()): ListView.separated(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: productList[index],
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                )));
  }
}

class Product {
  final String id;
  final String productName;
  final String productCode;
  final String image;
  final String unitPrice;
  final String quantity;
  final String totalPrice;

  Product(
    this.id,
    this.productName,
    this.productCode,
    this.image,
    this.unitPrice,
    this.quantity,
    this.totalPrice,
  );
}
