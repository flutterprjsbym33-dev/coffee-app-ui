import 'package:coffeariverpod/AppColors.dart';
import 'package:coffeariverpod/ViewModel/AllData.dart';
import 'package:coffeariverpod/ViewModel/ItemsPv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'DetailsScreen.dart';
class SecondCat extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularItem = ref.watch(allDataProvider);

    return Scaffold(
      appBar: AppBar(

          title: Text('Esspersso',style: TextStyle(fontSize: 20,color: AppColors.darkGrey,fontWeight: FontWeight.w700),
          )),
      body: Column(
          children: [



            Expanded(
              child: SingleChildScrollView(
                child: popularItem.when(
                  data: (data) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.firstCt.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 11,
                        mainAxisSpacing: 14,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        final item = data.secCt[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>DetailScreen(item: item,)));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (item.picUrl.isNotEmpty)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network(

                                        item.picUrl[0],
                                        height: 180,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  else
                                    SizedBox(height: 120),
                                  SizedBox(height: 10),
                                  Text(item.title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('\$${item.price}',style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,fontSize: 20),),
                                      Image.asset('assets/images/plus.png',height: 32,)
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error: $e')),
                ),
              ),
            ),]
      ),
    );
  }
}
