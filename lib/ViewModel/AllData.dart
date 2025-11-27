import 'package:async/async.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'ItemsPv.dart';

final allDataProvider = StreamProvider<Alldata>((ref) {
final dbRef = FirebaseDatabase.instance.ref();

final popularStream = dbRef.child('Popular').onValue.map((event) {
final data = event.snapshot.value as List?;
if (data == null) return <PopularModel>[];
return data
    .where((e) => e != null)
    .map((e) => PopularModel.fromjson(Map<String, dynamic>.from(e as Map)))
    .toList();
});

final itemsStream = dbRef.child('Items').onValue.map((event) {
final data = event.snapshot.value as List?;
if (data == null) return {
'first': <PopularModel>[],
'sec': <PopularModel>[],
'third': <PopularModel>[],
'fourth': <PopularModel>[],
};

final tempList = data
    .where((e) => e != null)
    .map((e) => PopularModel.fromjson(Map<String, dynamic>.from(e as Map)))
    .toList();

return {
'first': tempList.where((e) => e.category== '1').toList(),
'sec': tempList.where((e) => e.category == '2').toList(),
'third': tempList.where((e) => e.category == '3').toList(),
'fourth': tempList.where((e) => e.category == '4').toList(),
};
});

return Rx.combineLatest2<List<PopularModel>, Map<String, List<PopularModel>>, Alldata>(
popularStream,
itemsStream,
(popular, itemsMap) {
return Alldata(
popularModel: popular,
firstCt: itemsMap['first'] ?? [],
secCt: itemsMap['sec'] ?? [],
thirdtCt: itemsMap['third'] ?? [],
fourthCt: itemsMap['fourth'] ?? [],
);
},
);

});


class Alldata{
  List<PopularModel> popularModel;
  List<PopularModel> firstCt;
List<PopularModel> secCt;
List<PopularModel> thirdtCt;
List<PopularModel> fourthCt;


Alldata({
    required this.firstCt,
  required this.secCt,
  required this.thirdtCt,
  required this.fourthCt,
  required this.popularModel,

});


}