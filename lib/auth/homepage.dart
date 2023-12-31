// import 'package:final_project/core/navigation/app_navigation.dart';
// import 'package:final_project/feacher/comptition/comptition.dart';
// import 'package:final_project/feacher/sign_in/firebase/get_user_data.dart';
// import 'package:flutter/material.dart';

// import '../feacher/ranks/ranks_view.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 10,
//           title: Text(
//             "Welcome ${userModel!.username}",
//             style: const TextStyle(
//                 fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.message_outlined)),
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed("setting");
//               },
//               icon: const Icon(Icons.person),
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed("settinggg");
//               },
//               icon: const Icon(Icons.settings_applications_sharp),
//             ),
//           ],
//         ),
//         body: Container(
//           padding: const EdgeInsets.all(30),
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 1000,
//                 height: 100,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     AppNavigation().push(context, const ComptitionView());
//                   },
//                   style: ButtonStyle(
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25))),
//                       backgroundColor: MaterialStateProperty.all(
//                           const Color.fromARGB(255, 11, 243, 243))),
//                   child: Row(
//                     children: [
//                       Image.asset("imges/noun-versus-player-2977044[84].png"),
//                       const Text(
//                         "Start comptition",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 100,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25))),
//                     backgroundColor: MaterialStateProperty.all(
//                         const Color.fromARGB(255, 12, 243, 243)),
//                   ),
//                   child: Row(
//                     children: [
//                       Image.asset("imges/noun-training-2417115[83].png"),
//                       const Text(
//                         "Start traning",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 30,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 100,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25))),
//                       backgroundColor: MaterialStateProperty.all(
//                           const Color.fromARGB(255, 11, 243, 243))),
//                   child: Row(
//                     children: [
//                       Image.asset("imges/noun-competitor-4058571[82].png"),
//                       const Text(
//                         "Existing Competitions ",
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 100,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     AppNavigation().push(context, const RanksView());
//                   },
//                   style: ButtonStyle(
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25))),
//                       backgroundColor: MaterialStateProperty.all(
//                           const Color.fromARGB(255, 11, 243, 243))),
//                   child: Row(
//                     children: [
//                       Image.asset("imges/noun-competition-4519893[81].png"),
//                       const Text(
//                         "Ranks broud",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
