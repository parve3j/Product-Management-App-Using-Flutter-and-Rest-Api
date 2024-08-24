import 'package:flutter/material.dart';
import 'package:product_management/screens/add_new_product_screen.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        showDialog(context: context, builder: (context){
          return  productAlertDIalogue(context);
        });
      },
      leading: Image.network('https://cdn.pixabay.com/photo/2024/07/13/22/31/road-8893160_1280.jpg', width: 80,),
      title: const Text('Product Name'),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text('Product code'),
            SizedBox(width: 24,),
            Text('Total Price'),
          ]),
          Text('Product Description'),
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
