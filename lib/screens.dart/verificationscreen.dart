import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/auth_cubit.dart';
import 'package:task/cubit/auth_state.dart';
import 'package:task/screens.dart/profilescreen.dart';
import 'package:task/widgets/button.dart';
import 'package:task/widgets/pinfield.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.mobileNumber});
  final String mobileNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();
  final TextEditingController otp5 = TextEditingController();
  final TextEditingController otp6 = TextEditingController();
  late String otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 35,
          ),
          const Text("Verify Phone",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Code is sent to ' + widget.mobileNumber,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color.fromRGBO(106, 108, 123, 1),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PinTextField(
                  otp: otp1,
                ),
                PinTextField(
                  otp: otp2,
                ),
                PinTextField(
                  otp: otp3,
                ),
                PinTextField(
                  otp: otp4,
                ),
                PinTextField(
                  otp: otp5,
                ),
                PinTextField(
                  otp: otp6,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Didn' 't receive the code?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color.fromRGBO(106, 108, 123, 1),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Request Again",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(6, 29, 40, 1),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedInState) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => const ProfileScreen()));
              } else if (state is AuthErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                  duration: const Duration(milliseconds: 2000),
                ));
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return InkWell(
                child: const MyButton(
                  title: 'VERIFY AND CONTINUE',
                  width: 328,
                  height: 56,
                ),
                onTap: () {
                  otp = otp1.text +
                      otp2.text +
                      otp3.text +
                      otp4.text +
                      otp5.text +
                      otp6.text;
                  BlocProvider.of<AuthCubit>(context).verifyOtp(otp);
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}
