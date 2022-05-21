import 'package:floor/floor.dart';

import '../entities/subject.dart';

@dao
abstract class SubjectDao {
  @insert
  Future<void> insertData(Subject subject);

  @Query('SELECT * FROM subject')
  Future<List<Subject>> getAllSubjects();

  @Query('SELECT * FROM subject WHERE subName = :subName')
  Future<Subject?> getSubject(String subName);
}
