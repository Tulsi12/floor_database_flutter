import 'package:floor/floor.dart';

import '../entities/student.dart';

@dao
abstract class StudentDao {
  @insert
  Future<void> insertData(Student student);

  @Query('SELECT * FROM student')
  Future<List<Student>> getAllStudents();

  @Query(
      'SELECT * FROM student WHERE username = :username and password = :password')
  Future<Student?> login(String username, String password);
}
