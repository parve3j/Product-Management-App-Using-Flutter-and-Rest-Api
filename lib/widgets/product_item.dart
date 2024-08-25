import 'package:flutter/material.dart';
import 'package:product_management/screens/add_new_product_screen.dart';
import 'package:product_management/screens/product_list_screen.dart';
class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        showDialog(context: context, builder: (context){
          return  productAlertDIalogue(context);
        });
      },
      leading: product.image!=null? Image.network(product.image, width: 80,): Image.network('https://cdn.pixabay.com/photo/2024/08/08/17/13/salt-8955103_1280.jpg',width: 80,),
      title:  Text(product.productName),
      subtitle:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(product.productCode),
            SizedBox(width: 24),
            Text(product.totalPrice),
          ]),
          Text(product.unitPrice),
        ],
      ),
      trailing: const Text('\$ 120'),
    );
  }

  AlertDialog productAlertDIalogue(BuildContext context) {
    return AlertDialog(
          title: const Text('Select One'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Edit'),
                leading: const Icon(Icons.edit),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddNewProductScreen()));
                },
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text('Delete'),
                leading: const Icon(Icons.delete),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
  }
}
