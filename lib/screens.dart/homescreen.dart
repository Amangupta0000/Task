import 'package:flutter/material.dart';
import 'package:task/screens.dart/authenticationscreen.dart';
import 'package:task/widgets/button.dart';

const List<String> languages = ['English', 'Hindi', 'Tamil'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 128),
            Image.asset(
              'assets/image.png',
              width: 56,
              height: 56,
            ),
            const SizedBox(
              height: 32,
            ),
            const Text("Please select your Language",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 8,
            ),
            const Text(
              '''You can change the language 
             at any time''',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromRGBO(106, 108, 123, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownMenu(
                width: 216,
                initialSelection: languages.first,
                dropdownMenuEntries:
                    languages.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList()),
            const SizedBox(
              height: 24,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const AuthenticationScreen()));
                },
                child: const MyButton(
                  title: 'NEXT',
                  width: 216,
                  height: 48,
                )),
            const SizedBox(
              height: 241,
            ),
            SizedBox(
              height: 180,
              child: Image.asset(
                'assets/design.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
