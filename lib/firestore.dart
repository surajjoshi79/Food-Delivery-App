import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  Future<void> saveOrder(String receipt) async{
    await FirebaseFirestore.instance.collection("orders").add({
      "date":DateTime.now(),
      "order":receipt
    });
  }
}