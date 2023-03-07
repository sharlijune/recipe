import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Recipes');
class FirebaseCrud {

static Future<Response> addRecipe({
    required String title,
    required String description,
   
  }) async {


    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();



    Map<String, dynamic> data = <String, dynamic>{
      "titleName": title,
      "description": description,
      "isComplete":false

    };



    var result = await documentReferencer

        .set(data)
        .whenComplete(() {
          response.code = 200;
          response.message = "Sucessfully added to the database";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }
static Stream<QuerySnapshot> readToDo() {


    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }





static Future<Response> updateTitle({
    required String title,
    required String description,
     required String docId,
  
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "titleName": title,
      "description": description,
   
    };




    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Sucessfully updated recipe";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }


  static Future<Response> complete({
    
     required String docId,
     required bool iscomplete,

  
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "iscomplete": iscomplete,
    

   
    };




    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "completed";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }






  static Future<Response> deletetodo({
    required String docId,
  }) async {
     Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);
    await documentReferencer
        .delete()
        .whenComplete((){
          response.code = 200;
          response.message = "Sucessfully Deleted recipe";
        })
        .catchError((e) {
           response.code = 500;
            response.message = e;
        });
   return response;
  }

}