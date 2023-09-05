import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/auth_cubit.dart';
import 'package:task/cubit/auth_state.dart';
import 'package:task/screens.dart/homescreen.dart';
import 'package:task/widgets/button.dart';

enum Profile { shipper, transporter }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile? _type;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          const Text("Please select your profile",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              )),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            height: 89,
            width: 328,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              children: [
                Radio(
                    value: Profile.shipper,
                    groupValue: _type,
                    onChanged: (type) {
                      setState(() {
                        _type = type;
                      });
                    }),
                Image.asset(
                  'assets/shipper.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Shipper",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(47, 48, 55, 1),
                      ),
                    ),
                    Text(
                      '''Lorem ipsum dolor sit amet,
consectetur adipiscing''',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color.fromRGBO(106, 108, 123, 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            height: 89,
            width: 328,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              children: [
                Radio(
                    value: Profile.transporter,
                    groupValue: _type,
                    onChanged: (type) {
                      setState(() {
                        _type = type;
                      });
                    }),
                Image.asset(
                  'assets/transport.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Transporter",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromRGBO(47, 48, 55, 1),
                      ),
                    ),
                    Text(
                      '''Lorem ipsum dolor sit amet,
consectetur adipiscing''',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color.fromRGBO(106, 108, 123, 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const MyButton(
            title: 'CONTINUE',
            width: 328,
            height: 56,
          ),
          BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
            if (state is AuthLoggedOutState) {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const HomeScreen()));
            }
          }, builder: (context, state) {
            return TextButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logOut();
                },
                child: const Text("Logout"));
          }),
        ],
      )),
    );
  }
}
