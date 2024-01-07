import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_provider/controller/providerdb.dart';
import 'package:firebase_provider/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'add_user.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 181, 187, 182),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUser()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())));
              },
              icon: Icon(Icons.logout)),
        ],
        backgroundColor: Color.fromARGB(255, 127, 129, 127),
        title: const Text(
          "Student Data",
          style: TextStyle(color: Color.fromARGB(255, 158, 155, 155), fontSize: 35),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromARGB(255, 134, 141, 136),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Consumer<StudentId>(
              builder: (BuildContext context, studentData, child) {
                final data = studentData.getData();
                return StreamBuilder(
                  stream: data,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Text('Error occurred');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No Data Found'));
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final studentData = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            left: 10.0,
                            top: 5.0,
                          ),
                          child: Card(
                            color: Color.fromARGB(255, 166, 172, 168),
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/update',
                                  arguments: {
                                    'Name': studentData['Name'],
                                    'Age': studentData['Age'],
                                    'Email': studentData['Email'],
                                    'Phone': studentData['Phone'],
                                    'course': studentData['course'],
                                    'id': studentData.id,
                                  },
                                );
                              },
                              trailing: IconButton(
                                onPressed: () {  
                                  Provider.of<StudentId>(context,
                                          listen: false)
                                      .delete(studentData.id);
                                },
                                icon: Icon(Icons.delete),
                              ),
                              title: Text(
                                studentData['Name'],
                              ),
                              subtitle: Text(studentData['Email']),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}