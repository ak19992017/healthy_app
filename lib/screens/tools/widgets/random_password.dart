// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RandomPassword extends StatefulWidget {
  const RandomPassword({Key? key}) : super(key: key);

  @override
  State<RandomPassword> createState() => _RandomPasswordState();
}

class _RandomPasswordState extends State<RandomPassword> {
  final controller = TextEditingController();

  double _slide = 20.0;
  bool _hasLetters = true;
  bool _hasNumbers = true;
  bool _hasSpecial = true;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff90F2EC), Color(0xffEAF98E)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Random Password Generator",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              readOnly: true,
              enableInteractiveSelection: false,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(EvaIcons.copyOutline),
                  onPressed: () {
                    final data = ClipboardData(text: controller.text);
                    Clipboard.setData(data);

                    final snackBar = SnackBar(
                      content: Text(
                        "Password Copied",
                      ),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(right: 20, bottom: 20, left: 280),
                    );

                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: Text("has Letters"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _hasLetters,
              onChanged: (value) => setState(() => _hasLetters = value!),
            ),
            CheckboxListTile(
              title: Text("has Numbers"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _hasNumbers,
              onChanged: (value) => setState(() => _hasNumbers = value!),
            ),
            CheckboxListTile(
              title: Text("has Special"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _hasSpecial,
              onChanged: (value) => setState(() => _hasSpecial = value!),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorColor: Colors.red,
              ),
              child: Slider(
                inactiveColor: Colors.white,
                value: _slide,
                onChanged: (value) => setState(() {
                  _slide = value;
                  // print(_slide);
                }),
                min: 8,
                max: 30,
                divisions: 22,
                label: _slide.toString(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: Text("Generate Password"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.pressed)
                          ? Colors.red
                          : Colors.black)),
              onPressed: () {
                final password = generatePassword(
                  length: _slide.toInt(),
                  hasLetters: _hasLetters,
                  hasNumbers: _hasNumbers,
                  hasSpecial: _hasSpecial,
                );
                controller.text = password;
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  String generatePassword({
    required int length,
    required bool hasLetters,
    required bool hasNumbers,
    required bool hasSpecial,
  }) {
    const lettersUppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const lettersLowercase = "abcdefghijklmnopqrstuvwxyz";
    const numbers = "0123456789";
    const special = "!@#/\$%^&*";

    String chars = "";
    if (hasLetters) chars += '$lettersUppercase$lettersLowercase';
    if (hasNumbers) chars += '$numbers';
    if (hasSpecial) chars += '$special';

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join();
  }
}
