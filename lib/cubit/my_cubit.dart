import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:retrofitapi/cubit/my_state.dart';
import 'package:retrofitapi/data/api_handling/network_exceptions.dart';

import '../data/model/user_model.dart';
import '../data/repository/repository.dart';

class MyCubit extends Cubit<ResultState<User>> {
  final MyRepo myRepo;

  MyCubit(this.myRepo) : super(const Idel());

  // void emitGetAllUsers() async {
  //   var data = await myRepo.getAllUser();
  //   data.when(success: (List<User> allUsers) {
  //     emit(ResultState.success(allUsers));
  //   }, failure: (NetworkExceptions networkExceptions) {
  //     emit(ResultState.error(networkExceptions));
  //   });
  //
  //   // myRepo.getAllUser().then((usersList) {
  //   //   emit(GetAllUsers(usersList));
  //   // });
  // }

  // void emitGetUserById(String userId) {
  //   myRepo.getUserById(userId).then((userDetails) {
  //     emit(GetUserDetails(userDetails));
  //   });
  // }
  //
  void emitCreateNewUser(User newUser) async {
    var result = await myRepo.createNewUser(newUser);
    result.when(success: (dynamic userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
    // myRepo.createNewUser(newUser).then((newUser) {
    //   emit(CreateNewUser(newUser));
    // });
  }
//
// void emitDeleteUser(String userId) {
//   myRepo.deleteUser(userId).then((user) {
//     emit(DeleteUser(user));
//   });
// }
}
