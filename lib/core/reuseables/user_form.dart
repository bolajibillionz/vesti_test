import 'package:flutter/material.dart';

import '../../data/users.dart';
import '../constants.dart';
import '../size_config.dart';
import 'build_button.dart';
import 'build_button_with_generic_child.dart';
import 'general_text.dart';

class UserForm extends StatefulWidget {
  final User? user;
  final int length;
  final int formNumber;
  final void Function(User user) onChanged;
  final bool Function(String email)? emailValidator;

  UserForm(
      {required this.user,
      required this.length,
      required this.formNumber,
       this.emailValidator,
      required this.onChanged});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _skillFormKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _mainSkillController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  late List<String> _skills;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.user?.name)
      ..addListener(_onChange);
    _emailController = TextEditingController(text: widget.user?.email)
      ..addListener(_onChange);
    _addressController = TextEditingController(text: widget.user?.address)
      ..addListener(_onChange);
    _skills = List<String>.from(widget.user?.skills ?? []);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _onChange() {
    var user = User(
      name: _nameController.text,
      email: _emailController.text,
      address: _addressController.text,
      skills: _skills,
    );
    widget.onChanged(user);
  }

  void _removeSkill() {
    if (_skills.isNotEmpty) {
      setState(() {
        _skills.removeLast();
        _onChange();
      });
    }
  }

  void _addSkill() {
    if (_skillFormKey.currentState?.validate() ?? false) {
      setState(() {
        _skills.add(_skillController.text);
        _onChange();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.length >= 2
              ? SizedBox()
              : SizedBox(
                  height: getProportionateScreenHeight(40.0),
                ),
          widget.length >= 2
              ? SizedBox()
              : createGeneralText(
                  inputText: 'Staff List',
                  fontSize: 28,
                  family: FontFamily.sohne,
                  colorName: Palette.blackColor),
          SizedBox(
            height: getProportionateScreenHeight(38.0),
          ),
          createGeneralText(
              inputText: 'User ${widget.formNumber.toString()}',
              fontSize: 28,
              family: FontFamily.sohne,
              colorName: Palette.blackColor),
          SizedBox(
            height: getProportionateScreenHeight(28),
          ),
          buildInputfield(
            inputController: _nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            fieldWidth: double.infinity,
            hintText: 'Full Name',
            labelText: ' FULL NAME ',
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          buildInputfield(
            inputController: _emailController,
            fieldWidth: double.infinity,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              } else if ( value.isEmpty
                // widget.emailValidator(value)
                ) {
                return 'Email already exists';
              }
              return null;
            },
            hintText: 'johndoe@gmail.com',
            labelText: ' EMAIL ADDRESS ',
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          buildInputfield(
            inputController: _addressController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            fieldWidth: double.infinity,
            hintText: '30, Furo Ezimora',
            labelText: ' ADDRESS ',
          ),
          SizedBox(
            height: getProportionateScreenHeight(45),
          ),
          buildInputfield(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your skill';
              }
              return null;
            },
            inputController: _mainSkillController,
            fieldWidth: double.infinity,
            labelText: ' SKILL ONE ',
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          Form(
            key: _skillFormKey,
            child: Row(
              children: [
                buildInputfield(
                  inputController: _skillController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a skill';
                    }
                    return null;
                  },
                  fieldWidth: 178.0,
                  labelText: ' SKILL TWO ',
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                BuildButtonWithChild(
                    onPressed: () {
                      _addSkill();
                    },
                    child: Center(
                      child: createGeneralText(
                          inputText: '+ Add skill',
                          fontSize: 14.0,
                          family: FontFamily.sohne,
                          colorName: Palette.smallButtonBorderColor1),
                    ),
                    containerHeight: 56.0,
                    containerWidth: 120.0,
                    borderRadiusSize: 10.0,
                    buttonColor: Palette.textFieldColor,
                    borderColor: Palette.smallButtonBorderColor1),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                BuildButtonWithChild(
                    onPressed: () {
                      _removeSkill();
                    },
                    child: Center(
                      child: createGeneralText(
                          inputText: '- Remove skill',
                          fontSize: 12.0,
                          family: FontFamily.sohne,
                          colorName: Color(0xff2E0507)),
                    ),
                    containerHeight: 56.0,
                    containerWidth: 141.0,
                    borderRadiusSize: 10.0,
                    buttonColor: Palette.smallButtonBodyColor1,
                    borderColor: Palette.smallButtonBorderColor2)
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildInputfield(
      {required double fieldWidth,
      String? hintText,
      required String labelText,
      required TextEditingController inputController,
      required String? Function(String?)? validator}) {
    return SizedBox(
      // height: getProportionateScreenHeight(60),
      width: getProportionateScreenWidth(fieldWidth),
      child:

          //  InputDecorator(
          //   decoration: InputDecoration(
          //     enabled: true,
          //     labelText: labelText,
          //     labelStyle: labelTextStyle,
          //     filled: true,
          //     fillColor: Palette.textFieldColor,
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5.0),
          //       borderSide: BorderSide(
          //         style: BorderStyle.solid,
          //         width: 0.5,
          //         color: Palette.labelTextColor,
          //       ),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       gapPadding: 0,
          //       borderRadius: BorderRadius.circular(5.0),
          //       borderSide: BorderSide(
          //         style: BorderStyle.solid,
          //         width: 0.5,
          //         color: Palette.labelTextColor,
          //       ),
          //     ),
          //     border: OutlineInputBorder(
          //       gapPadding: 0,
          //       borderRadius: BorderRadius.circular(5.0),
          //       borderSide: BorderSide(
          //         style: BorderStyle.solid,
          //         width: 0.5,
          //         color: Palette.labelTextColor,
          //       ),
          //     ),
          //   ),
          //   child:

          TextFormField(
        controller: inputController,
        validator: validator,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabled: true,
          labelText: labelText,
          labelStyle: labelTextStyle,
          filled: true,
          fillColor: Palette.textFieldColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 0.5,
              color: Palette.labelTextColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 0.5,
              color: Palette.labelTextColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 0.5,
              color: Palette.labelTextColor,
            ),
          ),
          hintText: hintText,
          hintStyle: hintTextStyle,
          alignLabelWithHint: true,
          isDense: false,
          contentPadding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
              horizontal: getProportionateScreenWidth(25)),
        ),
      ),
      // ),
    );
  }
}
