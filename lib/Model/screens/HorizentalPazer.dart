import 'package:coffeariverpod/AppColors.dart';
import 'package:coffeariverpod/Model/screens/1stcat.dart';
import 'package:coffeariverpod/Model/screens/2ndCat.dart';
import 'package:coffeariverpod/Model/screens/TestScreen.dart';
import 'package:coffeariverpod/ViewModel/CatBannerprov.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateProvider<int>((ref) {
  return -1;
});

class HorizentalPager extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banner = ref.watch(bannerCatProv);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        banner.when(
          data: (data) {
            final bannerList = data.banners;
            return SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: bannerList.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(bannerList[index]),
                  );
                },
              ),
            );
          },
          error: (e, _) => Text(e.toString()),
          loading: () => Align(
            alignment: Alignment.topCenter,
            child: SizedBox(height: 200, child: Card()),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        banner.when(
          data: (data) {
            final categoryList = data.category;
            return SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      final selectedIndex =  ref.watch(indexProvider);
                      return GestureDetector(
                        onTap: () {
                          ref.read(indexProvider.notifier).state = index;
                          OnTap(ref,context);

                        },
                        child: SizedBox(
                          width: 150,
                          child: Card(
                          color:     selectedIndex==index ? AppColors.black : Colors.white,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                categoryList[index].title,
                                style: TextStyle(fontSize: 18,color: selectedIndex==index ? Colors.white : Colors.black ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
          error: (e, _) => Text(e.toString()),
          loading: () => Text('null'),
        ),
      ],
    );
  }
}

void OnTap(WidgetRef ref,BuildContext context)
{
  switch(ref.watch(indexProvider))
      {
    case 0:Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstCat()));
    case 1:Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondCat()));

    case 2:Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupLogin()));
  }

}