import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofitapi/cubit/my_cubit.dart';
import 'package:retrofitapi/cubit/my_state.dart';
import 'package:retrofitapi/data/api_handling/network_exceptions.dart';
import 'package:retrofitapi/data/model/user_model.dart';
import 'package:retrofitapi/injection.dart';
import 'package:retrofitapi/view/screens/user_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User user = User();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    BlocProvider.of<MyCubit>(context).emitCreateNewUser(User(
      name: 'Maryam',
      email: 'maryam62@gmail.com',
      gender: 'Male',
      status: 'Active'
    ));
    // BlocProvider.of<MyCubit>(context).emitDeleteUser('1359566');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is GetAllUsers) {
          //       usersList = (state).allUsersList;
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         padding: const EdgeInsets.all(8),
          //         itemCount: usersList.length,
          //         itemBuilder: (BuildContext ctx, int index) {
          //           return Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: InkWell(
          //               onTap: () {
          //                 Navigator.push(context, MaterialPageRoute(
          //                   builder: (context) {
          //                     return BlocProvider(
          //                       create: (context) => getIt<MyCubit>(),
          //                       child: UserDetails(user: usersList[index]),
          //                     );
          //                   },
          //                 ));
          //               },
          //               child: Container(
          //                 height: 50,
          //                 decoration: BoxDecoration(
          //                   color: Colors.amber,
          //                   borderRadius: BorderRadius.circular(20),
          //                 ),
          //                 child: Center(
          //                     child: Text(
          //                   usersList[index].name.toString(),
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 20,
          //                   ),
          //                 )),
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),

          BlocBuilder<MyCubit, ResultState<User>>(
            builder: (context, ResultState<User> state) {
              return state.when(
                idel: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                success: (User userData) {
                  return Container(
                    height: 50,
                    color: Colors.amber,
                    child: Center(child: Text(userData.email.toString())),
                  );
                },
                error: (NetworkExceptions networkExceptions) {
                  return Center(
                    child: Text(
                        NetworkExceptions.getErrorMessage(networkExceptions)),
                  );
                },
              );
              //   if (state is ) {
              //    // user = (state).newUser;
              //     return Container(
              //       height: 50,
              //       color: Colors.amber,
              //       child: Center(child: Text((state).user.toString())),
              //     );
              //   } else {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   }
            },
          )
        ],
      ),
    );
  }
}
