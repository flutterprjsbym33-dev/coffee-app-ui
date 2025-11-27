

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularProvider = StreamProvider<List<PopularModel>>((ref) {
  DatabaseReference dRef = FirebaseDatabase.instance.ref('Popular');

  return dRef.onValue.map((event) {
    final data = event.snapshot.value;
    print('Firebase data type: ${data.runtimeType}');
    print('Firebase data value: $data');
    if (data == null) return [];

    if (data is List) {
      // When your Firebase data is a list
      return data
          .where((e) => e != null)
          .map((e) => PopularModel.fromjson(Map<String, dynamic>.from(e as Map)))
          .toList();

    } else if (data is Map) {
      // When your Firebase data is a map
      return data.values
          .where((e) => e != null)
          .map((e) => PopularModel.fromjson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } else {
      return [];
    }
  });

});



class PopularModel{
  String discription;
  String extra;
  String title;
  double price;
  double rating;
  List<String> picUrl;
  String category;

  PopularModel({required this.title,
    required this.extra,
    required this.rating,
    required this.discription,
    required this.price,
    required this.picUrl,
     required this.category,

  });

  factory PopularModel.fromjson(Map<String,dynamic> map){
    double parseDouble(dynamic value) {
      if (value is int) return value.toDouble();
      if (value is double) return value;
      return 0.0; // fallback default
    }

    return PopularModel(
      title: map['title'] ?? '',
      extra: map['extra'] ?? '',
      rating: parseDouble(map['rating']),
      discription: map['description'] ?? '',
      price: parseDouble(map['price']),
      picUrl: (map['picUrl'] as List<dynamic>).map((e) => e.toString()).toList(),
      category: map['categoryId'] ?? ''
    );
  }


}