import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor_database/dao/subject_dao.dart';

import '../dao/student_dao.dart';
import '../entities/student.dart';
import '../entities/subject.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'schooldatabase.g.dart';

@Database(
  version: 1,
  entities: [Student, Subject],
)
abstract class SchoolDatabase extends FloorDatabase {
  StudentDao get studentDao;
  SubjectDao get subjectDao;
}
