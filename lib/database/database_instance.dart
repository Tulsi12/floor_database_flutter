import 'package:floor_database/database/schooldatabase.dart';

class DatabaseInstance {
  static DatabaseInstance? _instance;
  DatabaseInstance._();
  static DatabaseInstance get instance => _instance ??= DatabaseInstance._();

  Future<SchoolDatabase> getDatabaseInstance() {
    return $FloorSchoolDatabase.databaseBuilder('school_db.db').build();
  }
}
