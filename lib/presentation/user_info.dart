import 'package:flutter/material.dart';
import 'package:vesti_test/core/constants.dart';
import 'package:vesti_test/core/reuseables/build_button.dart';
import 'package:vesti_test/core/reuseables/build_button_with_generic_child.dart';
import 'package:vesti_test/core/reuseables/general_text.dart';
import 'package:vesti_test/core/reuseables/utils.dart';
import 'package:vesti_test/core/size_config.dart';
import '../core/reuseables/user_form.dart';
import '../data/users.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _regKey = GlobalKey<FormState>();
  List<User> _users = [];
  // User newUser = User(name: '', email: '', address: '', skills: []);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _users.add(User.empty());
  }

  void _addUser(User user) {
    setState(() {
      _users.add(user);
    });
  }

  void _updateUser(int index, User user) {
    setState(() {
      _users[index] = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Form(
        key: _regKey,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    if (index == _users.length - 1) {
                      return _users.length > 1
                          ? Column(
                              children: [
                                UserForm(
                                    user: _users[index],
                                    length: _users.length,
                                    formNumber: index + 1,
                                    // emailValidator: _emailValidator,
                                    onChanged: (user) {
                                      _updateUser(index, user);
                                    }),
                                SizedBox(
                                  height: getProportionateScreenHeight(35),
                                ),
                                buildRowOfButtons(newOnpressed: () {
                                  String email = _users[index].email;
                                  final isvalid =
                                      _regKey.currentState!.validate();
                                  if (!isvalid) return;
                                  final tempList = List<User>.from(_users)
                                    ..removeAt(index);

                                  List<String> emailList = tempList
                                      .map((object) => object.email)
                                      .toList();

                                  bool _contain = emailList.contains(email);
                                  if (_contain) {
                                    warningSnackBar(
                                        context: context,
                                        message: 'Email already exists');
                                    print(_contain);
                                    print('okokokok');
                                  } else {
                                    setState(() {
                                      _users.add(User.empty());
                                    });
                                    print('object is free');
                                  }
                                  // print('calm down');

                                  // print(_users[0].email);
                                  // print(_users[1].email);
                                  // print(_users[2].email);
                                  // for (int i = 0; i < _users.length - 1; i++) {
                                  //   String email = _users[index].email;
                                  //   if (email == _users[i].email) {
                                  //     print('this is working');
                                  //   } else {
                                  //     print('not working');

                                  //   }
                                  // }

                                  // setState(() {
                                  //   _users.add(User.empty());
                                  // });
                                  // if (_users.contains(_users[2].email)) {
                                  //   print('this is here');
                                  // }

                                  // String email = _users[index].email;
                                  // if (!_users.contains(email)) {

                                  //   print('this is true');
                                  // } else {
                                  //   print('error');
                                  // }

                                  // String email = _users[index].email;
                                  // print(email);

                                  // for (int i = 0; i < _users.length - 1; i++) {
                                  //   if (email == _users[i].email) {
                                  //     print(_users[i].email);
                                  //     warningSnackBar(
                                  //         context: context,
                                  //         message: 'Email already exist');
                                  //   } else {

                                  // }
                                  // }
                                }),
                              ],
                            )
                          : Column(
                              children: [
                                UserForm(
                                    // emailValidator: _emailValidator,
                                    user: _users[index],
                                    length: _users.length,
                                    formNumber: index + 1,
                                    onChanged: (user) {
                                      _updateUser(index, user);
                                    }),
                                SizedBox(
                                  height: getProportionateScreenHeight(47),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(40)),
                                  child: BuildButton(
                                      onPressed: () async {
                                        print(_users[0].email);
                                        final isValid =
                                            _regKey.currentState!.validate();
                                        if (!isValid) return;
                                        setState(() {
                                          _users.add(User.empty());
                                        });
                                      },
                                      buttonText: 'Add Another User',
                                      containerHeight: 60,
                                      containerWidth: double.infinity,
                                      borderRadiusSize: 10,
                                      buttonTextSize: 18,
                                      buttonTextColor: Color(0xffffffff),
                                      buttonColor: Palette.labelTextColor,
                                      borderColor: Palette.labelTextColor,
                                      buttonTextFamily: FontFamily.sohne),
                                ),
                              ],
                            );
                    }
                    return Column(
                      children: [
                        UserForm(
                            // emailValidator: null,
                            user: _users[index],
                            length: _users.length,
                            formNumber: index + 1,
                            onChanged: (user) {
                              if (_users.contains(user.email)) {
                                warningSnackBar(
                                    context: context,
                                    message: 'Email already Exist');
                              } else {
                                _updateUser(index, user);
                              }
                            }),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildRowOfButtons({required void Function()? newOnpressed}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildButton(
              onPressed: () {
                setState(() {
                  _users.removeLast();
                });
              },
              buttonText: 'Remove User',
              containerHeight: 60.0,
              containerWidth: 220.0,
              borderRadiusSize: 10.0,
              buttonTextSize: 20.0,
              buttonTextColor: Palette.labelTextColor,
              buttonColor: Color(0xffffffff),
              borderColor: Palette.labelTextColor,
              buttonTextFamily: FontFamily.sohne),
          BuildButton(
              onPressed: newOnpressed,
              buttonText: 'Add Another User',
              containerHeight: 60.0,
              containerWidth: 220.0,
              borderRadiusSize: 10.0,
              buttonTextSize: 18.0,
              buttonTextColor: Color(0xffffffff),
              buttonColor: Palette.labelTextColor,
              borderColor: Palette.labelTextColor,
              buttonTextFamily: FontFamily.sohne),
        ],
      ),
    );
  }

  // bool _emailValidator(
  //   String email,
  // ) {
  //   bool emailInUse = false;

  //   for (int i = 0; i < _users.length - 1; i++) {
  //     // if (_users[index] == _users[i]) continue;
  //     if (email == _users[1].email) {
  //       print('in use');
  //       emailInUse = true;
  //       break;
  //     }
  //   }

  //   return emailInUse;
  // }
}
