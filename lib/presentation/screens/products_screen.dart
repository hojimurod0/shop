import 'dart:developer';

import 'package:ecommerce_app/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 165, 198),
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(
            fontSize: 35,
            color: Colors.amberAccent,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 52, 136),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              color: Colors.amberAccent,
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ProductSearchDelegate(),
                );
              },
            ),
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          log("coming data length: ${productProvider.products}");

        
          final filteredProducts = productProvider.products
              .where((product) => product.title!
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
              .toList();

          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return ProductCard(
                newProduct: product,
                title: product.title.toString(),
                image: product.image.toString(),
                price: product.price!,
                rating: 5.0,
                reviewCount: 10,
              );
            },
          );
        },
      ),
    );
  }
}

// search

class ProductSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search products...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      ),
    );
  }

// card

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        final filteredProducts = productProvider.products
            .where((product) =>
                product.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return ProductCard(
              newProduct: product,
              title: product.title.toString(),
              image: product.image.toString(),
              price: product.price!,
              rating: 5.0,
              reviewCount: 10,
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
