import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> readDataFromFirestore() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    // Get a reference to the collection
    CollectionReference users = firestore.collection('users');

    // Get documents from the collection
    QuerySnapshot querySnapshot = await users.get();

    // Iterate through documents and print data
    querySnapshot.docs.forEach((doc) {
      print('User ID: ${doc.id}, Data: ${doc.data()}');
    });
  } catch (e) {
    print('Error reading data: $e');
  }
}
