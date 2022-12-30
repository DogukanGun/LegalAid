
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/feature/login/data/user.dart';
import 'package:legalaid/feature/login/domain/RegisterState.dart';
import 'package:legalaid/service/firestore/user_service.dart';

class RegisterUserCubit extends Cubit<RegisterState>{
  RegisterUserCubit():super(RegisterState.FirstStep);

  var repo = UserService();

  Future<void> addUser(User user) async{
    emit(RegisterState.RequestSent);
    await repo.addUser(user,(registerState){
      emit(registerState);
    });
  }

}