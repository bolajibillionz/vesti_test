import 'package:flutter/material.dart';
import 'package:vesti_test/core/constants.dart';
import 'package:vesti_test/core/widgets/build_button.dart';
import 'package:vesti_test/core/widgets/build_button_with_generic_child.dart';
import 'package:vesti_test/core/widgets/create_general_text.dart';
import 'package:vesti_test/core/widgets/utils.dart';
import 'package:vesti_test/core/size_config.dart';
import '../core/widgets/user_form.dart';
import '../data/users_model.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _regKey = GlobalKey<FormState>();
  List<UserModel> _users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _users.add(UserModel.empty());
  }

  void _addUser(UserModel user) {
    setState(() {
      _users.add(user);
    });
  }

  void _updateUser(int index, UserModel user) {
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
                                    onChanged: (user) {
                                      _updateUser(index, user);
                                    }),
                                SizedBox(
                                  height: getProportionateScreenHeight(35),
                                ),
                                buildRowOfButtons(onRemovePressed: () {
                                  setState(() {
                                    _users.removeLast();
                                  });
                                }, onAddPressed: () {
                                  String email = _users[index].email;
                                  //form validation
                                  final isvalid =
                                      _regKey.currentState!.validate();
                                  if (!isvalid) return;
                                  //create temporary list without the last user object at current index
                                  final tempList = List<UserModel>.from(_users)
                                    ..removeAt(index);
                                  //extract a list of only emails from the user object
                                  List<String> emailList = tempList
                                      .map((object) => object.email)
                                      .toList();
                                  //search the email list to determine if the email already exist in memory
                                  bool _contain = emailList.contains(email);
                                  if (_contain) {
                                    createWarningSnackBar(
                                        context: context,
                                        message: 'Email already exists');
                                  } else {
                                    setState(() {
                                      _users.add(UserModel.empty());
                                    });
                                  }
                                }),
                              ],
                            )
                          : Column(
                              children: [
                                UserForm(
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
                                  child: GeneralButton(
                                      onPressed: () async {
                                        final isValid =
                                            _regKey.currentState!.validate();
                                        if (!isValid) return;
                                        setState(() {
                                          _users.add(UserModel.empty());
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
                            user: _users[index],
                            length: _users.length,
                            formNumber: index + 1,
                            onChanged: (user) {
                              _updateUser(index, user);
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

  Padding buildRowOfButtons({
    required void Function()? onAddPressed,
    required void Function()? onRemovePressed,
  }) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralButton(
              onPressed: onRemovePressed,
              buttonText: 'Remove User',
              containerHeight: 60.0,
              containerWidth: 220.0,
              borderRadiusSize: 10.0,
              buttonTextSize: 20.0,
              buttonTextColor: Palette.labelTextColor,
              buttonColor: Color(0xffffffff),
              borderColor: Palette.labelTextColor,
              buttonTextFamily: FontFamily.sohne),
          GeneralButton(
              onPressed: onAddPressed,
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
}
