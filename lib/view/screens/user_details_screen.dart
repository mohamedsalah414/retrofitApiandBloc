// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:retrofitapi/cubit/my_cubit.dart';
// import 'package:retrofitapi/data/model/user_model.dart';
// import 'package:retrofitapi/injection.dart';
// import 'package:retrofitapi/view/screens/home_screen.dart';
//
// class UserDetails extends StatelessWidget {
//   final User user;
//
//   const UserDetails({Key? key, required this.user}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<MyCubit>(context).emitGetUserById(user.id.toString());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         leading: BackButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(
//               builder: (context) {
//                 return BlocProvider(
//                     create: (context) => getIt<MyCubit>(),
//                     child: const HomeScreen());
//               },
//             ));
//           },
//         ),
//       ),
//       body: Center(
//         child: BlocBuilder<MyCubit, MyState>(
//           builder: (context, state) {
//             if (state is GetUserDetails) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     user.name.toString(),
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 25),
//                   ),
//                   Text(user.email.toString(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 17)),
//                   Text(user.gender.toString(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 20)),
//                   Text(user.status.toString(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 20)),
//                 ],
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//     ;
//   }
// }
