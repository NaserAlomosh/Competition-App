// // ignore_for_file: use_build_context_synchronously

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../feacher/home/homepage.dart';

// class Register extends StatefulWidget {
//   const Register({super.key});

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();

//   String year = '1';
//   bool isLoading = true;
//   String gender = 'male';
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             elevation: 10,
//             leading: IconButton(
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             centerTitle: true,
//             backgroundColor: Colors.white,
//             title: const Text(
//               "Register",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           body: !isLoading
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : SingleChildScrollView(
//                   child: Container(
//                     //width: double.infinity,
//                     //height: double.infinity,
//                     padding: const EdgeInsets.all(10),
//                     margin: const EdgeInsets.all(5),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Flexible(
//                               flex: 1,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "First name *",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   TextField(
//                                     controller: firstNameController,
//                                     decoration: InputDecoration(
//                                         hintText: "John",
//                                         border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10))),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Flexible(
//                               flex: 1,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "Last name *",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   TextField(
//                                     controller: lastNameController,
//                                     decoration: InputDecoration(
//                                         hintText: "Doe",
//                                         border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10))),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         const Text(
//                           "Email *",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         TextField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                               hintText: "Enter your email",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         const Text(
//                           "Password *",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextField(
//                           controller: passwordController,
//                           decoration: InputDecoration(
//                               hintText: "Enter your password",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const Text(
//                           "Phone ",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         TextField(
//                           controller: phoneController,
//                           decoration: InputDecoration(
//                               hintText: "Enter your phone number",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                         ),
//                         Container(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 188,
//                               child: Column(
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         "college",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(2),
//                                         child: DropdownButton<String>(
//                                           items: [
//                                             const DropdownMenuItem(
//                                                 value: "1",
//                                                 child: Text(
//                                                     "information technices")),
//                                             const DropdownMenuItem(
//                                                 value: "2",
//                                                 child: Text("Engineering")),
//                                           ],
//                                           onChanged: (_value) =>
//                                               {print(_value.toString())},
//                                           hint: const Text(
//                                               "information technices"),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Container(
//                               width: 150,
//                               child: Column(
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         "Department",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(2),
//                                         child: DropdownButton<String>(
//                                           items: [
//                                             const DropdownMenuItem(
//                                                 value: "1",
//                                                 child: Text("Chimistry")),
//                                             const DropdownMenuItem(
//                                                 value: "2",
//                                                 child: Text("Mathmematisc")),
//                                             const DropdownMenuItem(
//                                                 value: "3",
//                                                 child: Text("Physics")),
//                                             const DropdownMenuItem(
//                                                 value: "4",
//                                                 child:
//                                                     Text("Medical analysis")),
//                                             const DropdownMenuItem(
//                                                 value: "5",
//                                                 child: Text("Life sincse")),
//                                           ],
//                                           onChanged: (_value) =>
//                                               {print(_value.toString())},
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 188,
//                               child: Column(
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         "Univarsity acadimy years",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(2),
//                                         child: DropdownButton<String>(
//                                             items: [
//                                               const DropdownMenuItem(
//                                                   value: "1", child: Text("1")),
//                                               const DropdownMenuItem(
//                                                   value: "2", child: Text("2")),
//                                               const DropdownMenuItem(
//                                                   value: "3", child: Text("3")),
//                                               const DropdownMenuItem(
//                                                   value: "4", child: Text("4")),
//                                             ],
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 year = value!;
//                                               });
//                                             }),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Container(
//                               width: 150,
//                               child: Column(
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         "Gender",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       DropdownButton<String>(
//                                         onChanged: (String? newValue) {
//                                           setState(() {
//                                             gender = newValue!;
//                                           });
//                                         },
//                                         items: <String>['Male', 'Female']
//                                             .map<DropdownMenuItem<String>>(
//                                                 (String value) {
//                                           return DropdownMenuItem<String>(
//                                             value: value,
//                                             child: Text(value),
//                                           );
//                                         }).toList(),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 350,
//                               child: ElevatedButton(
//                                 onPressed: () async {
//                                   setState(() {
//                                     isLoading = !isLoading;
//                                   });
//                                   await signUp(
//                                       email: emailController.text,
//                                       password: passwordController.text,
//                                       name:
//                                           '${firstNameController.text} ${lastNameController.text}',
//                                       phone: phoneController.text,
//                                       year: year,
//                                       gender: gender);
//                                 },
//                                 child: const Text(
//                                   "Create Account",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 style: ButtonStyle(
//                                     shape: MaterialStateProperty.all(
//                                         RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(30))),
//                                     backgroundColor: MaterialStateProperty.all(
//                                         Colors.orange),
//                                     padding: MaterialStateProperty.all(
//                                         const EdgeInsets.all(10))),
//                               ),
//                             ),
//                           ],
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.of(context).pushNamed("privicy");
//                           },
//                           child: const Center(
//                             child: Text.rich(TextSpan(children: [
//                               TextSpan(
//                                   text: "By continuing , you agree to our"),
//                               TextSpan(
//                                   text: " Terms of Service and  Privacy Policy",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue)),
//                             ])),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )),
//     );
//   }
// }

// class UserModel {
//   String? id;
//   String? username;
//   String? email;
//   String? gender;
//   String? year;
//   String? phone;
//   UserModel(
//     this.id,
//     this.username,
//     this.email,
//     this.gender,
//     this.year,
//     this.phone,
//   );
//   UserModel.fromJson(Map<String, dynamic>? json) {
//     username = json!["name"];
//     id = json["id"];
//     email = json["email"];
//     gender = json["gender"];
//     year = json["year"];
//     phone = json["phone"];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': username,
//       'email': email,
//       'gender': gender,
//       'year': year,
//       'phone': phone,
//     };
//   }
// }
