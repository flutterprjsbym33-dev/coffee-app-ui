import 'package:coffeariverpod/ViewModel/Modelclass.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bannerCatProv = FutureProvider<BannerCat>((ref) async {

  DatabaseReference dRef = FirebaseDatabase.instance.ref();
  final banners = await dRef.child('Banner').get();
  final category = await dRef.child('Category').get();

  final banners1 = banners.value as List;
  print(banners1);
  final bannerList = banners1.map((e)=>e['url'].toString()).toList();

  final category1 = category.value as List;
  final cateGoryList = category1.map((e)=>Category.fromjson( Map<String,dynamic>.from(e as Map))).toList();


  return BannerCat(category: cateGoryList, banners: bannerList);


});