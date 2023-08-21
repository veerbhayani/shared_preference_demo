import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preference_demo/simple_crud_shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleCrudSharedPrefDemo extends StatefulWidget {
  const SimpleCrudSharedPrefDemo({super.key});

  @override
  State<SimpleCrudSharedPrefDemo> createState() =>
      _SimpleCrudSharedPrefDemoState();
}

class _SimpleCrudSharedPrefDemoState extends State<SimpleCrudSharedPrefDemo> {
  SimpleCrudSharedPref obj = SimpleCrudSharedPref();
  @override
  void initState() {
    getValue();
    super.initState();
  }

  String title = 'Shared Preference Demo';

  var isSubmited = false;
  var nameEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                12,
              ),
              child: TextField(
                controller: SimpleCrudSharedPref.firstNameController,
                decoration: InputDecoration(
                  label: const Text('Enter First Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                12,
              ),
              child: TextField(
                controller: SimpleCrudSharedPref.middleNameController,
                decoration: InputDecoration(
                  label: const Text('Enter Middle Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                12,
              ),
              child: TextField(
                controller: SimpleCrudSharedPref.lastNameController,
                decoration: InputDecoration(
                  label: const Text('Enter Last Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                SimpleCrudSharedPref.setValue();
                isSubmited = !isSubmited;
                log('${SimpleCrudSharedPref.userDetails}');
                setState(() {});
              },
              color: Colors.blue,
              child: const Text(
                'submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isSubmited
                ? Expanded(
                    child: ListView.builder(
                      itemCount: SimpleCrudSharedPref.userDetails.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Center(
                            child: ListTile(
                              leading: Text(
                                SimpleCrudSharedPref.userDetails[index]
                                    .toString(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Text('no text'),
          ],
        ),
      ),
    );
  }

  Future<void> getValue() async {
    var pref = await SharedPreferences.getInstance();
    SimpleCrudSharedPref.userDetails.add(pref.getString('name'));
    SimpleCrudSharedPref.userDetails.add(pref.getString('middleName'));
    SimpleCrudSharedPref.userDetails.add(pref.getString('lastName'));
  }
}
