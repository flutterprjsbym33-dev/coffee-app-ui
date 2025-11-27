import 'package:coffeariverpod/Model/screens/DetailsScreen.dart';
import 'package:coffeariverpod/ViewModel/ItemsPv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class MainGridView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularItem = ref.watch(popularProvider);

    return popularItem.when(
      data: (data) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 11,
            mainAxisSpacing: 14,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final item = data[index];
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
    );
  }
}
