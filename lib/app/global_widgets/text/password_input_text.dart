import 'package:flutter/material.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/app/global_widgets/text/input_text.dart';
import 'package:reservations/style/color.dart';

class PasswordInputText extends StatefulWidget {
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validatorError;
  final String textName;
  final bool withBolder;

  const PasswordInputText(
      {Key? key,
      required this.textEditingController,
      this.validatorError,
      this.textName = TranslateText.password,this.withBolder=false})
      : super(key: key);

  @override
  _PasswordInputTextState createState() => _PasswordInputTextState();
}

class _PasswordInputTextState extends State<PasswordInputText> {
  late bool showPassword;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    showPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextInput(paddingHorizontal: 0,
      paddingVertical: 0,
      textEditingController: widget.textEditingController,
      icon1: Icons.lock,
      labelText: widget.textName,
      withBolder: widget.withBolder,
      isRequired: true,
      obscureTxt: showPassword,
      validatorError: widget.validatorError,
      icon2: IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon: Icon(
          showPassword
              ? Icons.visibility_off_outlined
              : Icons.remove_red_eye_outlined,
          color: foreignColor.withOpacity(.4) ,
        ),
      ),
    );
  }
}
