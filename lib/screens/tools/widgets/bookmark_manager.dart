// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/widgets/tag.dart';

class BookmarkManager extends StatefulWidget {
  const BookmarkManager({Key? key}) : super(key: key);

  @override
  State<BookmarkManager> createState() => _BookmarkManagerState();
}

class _BookmarkManagerState extends State<BookmarkManager> {
  final nameController = TextEditingController();
  final urlController = TextEditingController();
  final tagController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    urlController.dispose();
    tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.red.withOpacity(0.7), Colors.orange.withOpacity(0.8)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Bookmark Manager",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Website Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Field cannot be empty';
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: urlController,
                decoration: InputDecoration(
                  hintText: "Website URL",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: tagController,
                decoration: InputDecoration(
                  hintText: "Separate tag with commas",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                // clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  alignment: WrapAlignment.start,
                  children: [
                    Tag(title: "JavaScript"),
                    Tag(title: 'Java'),
                    Tag(title: 'Java'),
                    Tag(title: "C"),
                    Tag(title: "Python"),
                    Tag(title: "C++"),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: Text("Add Bookmark"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.pressed)
                            ? Colors.red
                            : Colors.black)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
