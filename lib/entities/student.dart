import 'package:floor/floor.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String fName;
  String lName;
  String username;
  String password;

  Student(
    this.fName,
    this.lName,
    this.username,
    this.password,
  );
}
