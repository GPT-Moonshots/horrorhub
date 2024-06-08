import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horrorhub/models/poem_model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  static final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future getPoems() async {
    List<PoemModel> itemList = [];
    try {
      await userCollection
          .doc(uid)
          .collection('poems')
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          itemList.add(PoemModel.fromFirestore(element.data()));
        }
      });
      return itemList;
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }

  Future addPoem(PoemModel poemModel) async {
    try {
      DocumentReference docRef = await userCollection
          .doc(uid)
          .collection('poems')
          .add(poemModel.toMap());
      docRef.update({'poemId': docRef.id});
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }

  Future<void> deletePoem(String poemId) async {
    try {
      await userCollection.doc(uid).collection('poems').doc(poemId).delete();
    } catch (e) {
      // print('Error deleting poem: $e');
      // Handle error gracefully, if needed
    }
  }

  Future<void> deleteAllPoems(List<PoemModel> poems) async {
    try {
      for (PoemModel poem in poems) {
        await deletePoem(poem.poemId);
      }
    } catch (e) {
      // print('Error deleting poems: $e');
      // Handle error gracefully, if needed
    }
  }
}
