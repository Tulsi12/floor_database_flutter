import 'package:floor_database/database/database_instance.dart';
import 'package:floor_database/entities/student.dart';
import 'package:flutter/material.dart';

class ViewStudentScreen extends StatefulWidget {
  const ViewStudentScreen({Key? key}) : super(key: key);

  @override
  State<ViewStudentScreen> createState() => _ViewStudentScreenState();
}

class _ViewStudentScreenState extends State<ViewStudentScreen> {
  List<String> lstImages = [
    "https://www.pinclipart.com/picdir/middle/41-416584_head-clipart-student-cartoon-kids-face-png-download.png",
  ];

  List<Student> lstStudents= [];

  @override
  void initState() {
    super.initState();
    _getStudents();
  }

  _getStudents() async {
    final database = await DatabaseInstance.instance.getDatabaseInstance();
      lstStudents = await database.studentDao.getAllStudents();
    // setState(() {
    //   lstImages = students.map((student) => student.image).toList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('View Student'),
      ),
    );
  }

  // Widget studentCard(Student student) {
  //   return Card(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8),
  //       child: ListTile(
  //         leading: CircleAvatar(
  //           backgroundColor: Colors.blue,
  //           child: Image.network(lstImages[0]),
  //         ),
  //         title: Text(student.fName),
  //         subtitle: Text(student.lName),
  //         trailing: Wrap(
  //           children: [
  //             IconButton(
  //               onPressed: () {},
  //               icon: const Icon(Icons.edit),
  //             ),
  //             IconButton(
  //               onPressed: () {
  //                 _deleteStudent(student);
  //               },
  //               icon: const Icon(Icons.delete),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
