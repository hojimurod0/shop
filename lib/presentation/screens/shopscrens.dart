import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

class Shovscreens extends StatelessWidget {
  final Product product;
  const Shovscreens({required this.product, super.key});

  // get title => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Product Info',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: Image.network(product.image!),
            ),
            Text(
              product.title ?? 'No title available',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 170),
            Container(
                height: 60,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Color.fromARGB(255, 3, 52, 136),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(' ${product.title}     sotib olindi, '),
                      ),
                    );
                    // Add to cart functionality
                    //...
                  },
                  child: Text(
                      'Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}'),
                )),
          ],
        ),
      ),
    );
  }
}
