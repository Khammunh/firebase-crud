import 'package:crud/screen/add_new_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Firebase CRUD",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple.shade700,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddNewDataScreen();
              },
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
