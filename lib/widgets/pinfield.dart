import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinTextField extends StatelessWidget {
  PinTextField({super.key, required this.otp});
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: Color.fromRGBO(46, 59, 98, 1),
          fontSize: 25,
        ),
        decoration: const InputDecoration(
            fillColor: Color.fromRGBO(147, 210, 243, 1), filled: true),
        controller: otp,
      ),
    );
  }
}
