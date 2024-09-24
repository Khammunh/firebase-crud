import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/firebase_database/database_methods.dart';
import 'package:crud/screen/add_new_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? userStream;
  getInitiateUser() async {
    userStream = await DatabaseMethods().getUserData();
    setState(() {});
  }

  @override
  void initState() {
    getInitiateUser();
    super.initState();
  }

  Widget allUserDataList() {
    return StreamBuilder(
      stream: userStream,
      builder: (context, AsyncSnapshot snapShot) {
        return snapShot.hasData
            ? ListView.builder(
                itemCount: snapShot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot userData = snapShot.data.docs[index];
                  return SizedBox(
        height: 130.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.purple.shade50,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.purple.shade700,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:   Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name :'+userData['Name'],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Profession :'+userData['Profession'],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Age:'+userData['Age'],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
                })
            : Container();
      },
    );
  }

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
      body: allUserDataList(),
    );
  }
}
