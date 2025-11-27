import 'package:coffeariverpod/AppColors.dart';
import 'package:coffeariverpod/ViewModel/ItemsPv.dart';
import 'package:coffeariverpod/ViewModel/cartPrv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexprovider = StateProvider<int>((ref) {
  return -1;
});

class DetailScreen extends StatelessWidget {
  PopularModel item;
  List<String> sizeList = ['Small', 'Medium', 'Large'];
  int index1= -1;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  SafeArea(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
           return GestureDetector(
            onTap: (){
              ref.read(cartuse.notifier).addItemsToCart(item, 1);

            },
            child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: AppColors.darkBrown,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text('Add to Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.cream)),
            Row(
            children: [
            Text('|', style: TextStyle(fontSize: 18, color: AppColors.cream)),
            SizedBox(width: 10),
            Text('\$${item.price}', style: TextStyle(fontSize: 18, color: AppColors.cream)),
            ],
            ),
            ],
            ),
            ),
            ),
            );
          }),
      ),
      body:  SingleChildScrollView(
    child: Column(
    children: [
    // top image
    Container(
      height: 410,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(item.picUrl[0]),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset('assets/images/back.png', color: Colors.white),
            ),
            Image.asset('assets/images/btn_3.png', color: Colors.white),
          ],
        ),
      ),
    ),

    // card overlapping
    Transform.translate(
    offset: Offset(0, -35),
    child: Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
    ),
    ),
    color: AppColors.cream,
    child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Align(
    alignment: Alignment.center,
    child: Text(
    item.title,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    ),
    SizedBox(height: 12),
    Text(
    'Coffee Size',
    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
    ),
    SizedBox(height: 8),

    // size selector
    Consumer(
    builder: (context, ref, child) {
    final selectedIndex = ref.watch(indexprovider);
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(sizeList.length, (index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
    onTap: () => ref.read(indexprovider.notifier).state = index,
    child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    decoration: BoxDecoration(
    color: isSelected ? Colors.orange.shade300 : Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
    color: isSelected ? Colors.black : Colors.grey.shade300,
    width: 2,
    ),
    ),
    child: Text(
    sizeList[index],
    style: TextStyle(
    color: isSelected ? Colors.black : Colors.grey.shade700,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    ),
    ),
    ),
    );
    }),
    );
    },
    ),

    SizedBox(height: 20),
    // qty & rating row
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    Text('Qty:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    SizedBox(width: 5),
    SizedBox(
    height: 45,
    width: 90,
    child: Card(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.remove, size: 20),
    SizedBox(width: 4),
    Text('1', style: TextStyle(fontSize: 18)),
    SizedBox(width: 4),
    Icon(Icons.add, size: 20),
    ],
    ),
    ),
    ),
    ],
    ),
    Row(
    children: [
    Text('${item.rating}', style: TextStyle(fontSize: 16)),
    SizedBox(width: 5),
    Icon(Icons.star, size: 20),
    ],
    ),
    ],
    ),

    SizedBox(height: 14),
    Text(item.discription, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    SizedBox(height: 10),

    // Add to Cart button
SizedBox(height: 100,)
    ],
    ),
    ),
    ),

    ),
    ],
    ),
    )

    );
  }
}