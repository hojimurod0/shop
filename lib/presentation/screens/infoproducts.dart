import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

class Infoproducts extends StatelessWidget {
  final Product product;
  const Infoproducts({required this.product, super.key});

  // get title => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
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
            SizedBox(height: 40),
            Text(
              'Description: ${product.description}',
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 15),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Text(
                '  Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
