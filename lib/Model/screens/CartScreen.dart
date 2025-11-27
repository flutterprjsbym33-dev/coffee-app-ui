import 'package:coffeariverpod/ViewModel/cartPrv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' hide Consumer;

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Cart Items',style: TextStyle(fontSize: 24),),
     ),
     body: Consumer( 
       builder:(BuildContext context, WidgetRef ref , _) {
         final item = ref
             .watch(cartuse)
             .cartItems;
         return

           ListView.builder(
             itemCount: item.length,
               itemBuilder: (context, index) {
             return Card(
               child: Row(
                 children: [
                   ClipRRect(
                     child: Image.network(item[index].picUrl[0]),
                   )
                 ],
               )

             );
           });
       })

         
       );


  }

}