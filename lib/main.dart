import 'package:flutter/material.dart';
import 'package:vesti_test/presentation/user_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home:  UserInfoScreen(),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'core/reuseables/user_form2.dart';
// import 'data/users.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<User> _users = [];

  

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _users.add(User.empty());
//   }

//   void _addUser(User user) {
//     setState(() {
//       _users.add(user);
//     });
//   }

//   void _updateUser(int index, User user) {
//     setState(() {
//       _users[index] = user;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: ListView.builder(
//         itemCount: _users.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               UserForm(
//                 user: _users[index],
//                 onChanged: (user) {
//                   _updateUser(index, user);
//                 },
//               ),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _users.add(User.empty());
//                       });
//                     },
//                     child: Text('Add Another User'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _users.removeLast();
//                       });
//                     },
//                     child: Text('Remove User'),
//                   ),
//                 ],
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
