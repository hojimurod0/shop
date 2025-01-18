// import 'package:ecommerce_app/providers/catagory_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CatagoryScreen extends StatelessWidget {
//   const CatagoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final catagoryProvider = Provider.of<CatagoryProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Categories'),
//       ),
//       body: catagoryProvider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8.0,
//                   mainAxisSpacing: 8.0,
//                   childAspectRatio: 3 / 4,
//                 ),
//                 itemCount: 6,
//                 itemBuilder: (context, index) {
//                   final categoryTitle = catagoryProvider.catagories[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: const BorderRadius.vertical(
//                                 top: Radius.circular(12),
//                               ),
//                               image: const DecorationImage(
//                                 image:
//                                     AssetImage('assets/images/headphones.png'),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),

//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             categoryTitle,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
// }
