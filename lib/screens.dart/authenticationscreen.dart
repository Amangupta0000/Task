import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task/cubit/auth_cubit.dart';
import 'package:task/cubit/auth_state.dart';
import 'package:task/screens.dart/verificationscreen.dart';
import 'package:task/widgets/button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _mobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 35,
          ),
          const Text("Please enter your mobile number",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '''You'll recieve a 6 digit code 
           to verify next.''',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color.fromRGBO(106, 108, 123, 1),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: 327,
            child: IntlPhoneField(
              controller: _mobileNumber,
              initialCountryCode: 'IN',
              decoration: InputDecoration(
                labelText: "-  Mobile Number",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              onChanged: (phone) {
                print(phone);
              },
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
              listener: (BuildContext context, Object? state) {
            if (state is AuthCodeSentState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => VerificationScreen(
                        mobileNumber: _mobileNumber.text,
                      )));
            }
          }, builder: (BuildContext context, state) {
            if (state is AuthLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return InkWell(
              child: const MyButton(
                title: 'CONTINUE',
                width: 328,
                height: 56,
              ),
              onTap: () {
                String phoneNumber = '+91' + _mobileNumber.text;

                BlocProvider.of<AuthCubit>(context).sendOtp(phoneNumber);
              },
            );
          }),
          const SizedBox(
            height: 288,
          ),
          SizedBox(
            height: 180,
            child: Image.asset(
              'assets/design2.png',
              fit: BoxFit.fill,
            ),
          ),
        ]),
      ),
    );
  }
}
