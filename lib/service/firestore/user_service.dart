import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:legalaid/feature/login/domain/RegisterState.dart';

import '../../feature/login/data/user.dart';
import '../../firebase_options.dart';


typedef RegisterCallback = void Function(RegisterState);
class UserService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addUser(User user,RegisterCallback registerCallback) async{
    final userForFirebase = user.getUserForFirebase();
    try{
      db.collection("users").add(userForFirebase)
          .whenComplete(() => registerCallback.call(RegisterState.Success));
    } on Exception catch (e) {
      registerCallback.call(RegisterState.Error);
    }
  }
}
