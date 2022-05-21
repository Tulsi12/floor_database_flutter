// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schooldatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorSchoolDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SchoolDatabaseBuilder databaseBuilder(String name) =>
      _$SchoolDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SchoolDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$SchoolDatabaseBuilder(null);
}

class _$SchoolDatabaseBuilder {
  _$SchoolDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$SchoolDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SchoolDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SchoolDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SchoolDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SchoolDatabase extends SchoolDatabase {
  _$SchoolDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDao? _studentDaoInstance;

  SubjectDao? _subjectDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Student` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `fName` TEXT NOT NULL, `lName` TEXT NOT NULL, `username` TEXT NOT NULL, `password` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Subject` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `subName` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }

  @override
  SubjectDao get subjectDao {
    return _subjectDaoInstance ??= _$SubjectDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'Student',
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'fName': item.fName,
                  'lName': item.lName,
                  'username': item.username,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  @override
  Future<List<Student>> getAllStudents() async {
    return _queryAdapter.queryList('SELECT * FROM student',
        mapper: (Map<String, Object?> row) => Student(
            row['fName'] as String,
            row['lName'] as String,
            row['username'] as String,
            row['password'] as String));
  }

  @override
  Future<Student?> login(String username, String password) async {
    return _queryAdapter.query(
        'SELECT * FROM student WHERE username = ?1 and password = ?2',
        mapper: (Map<String, Object?> row) => Student(
            row['fName'] as String,
            row['lName'] as String,
            row['username'] as String,
            row['password'] as String),
        arguments: [username, password]);
  }

  @override
  Future<void> insertData(Student student) async {
    await _studentInsertionAdapter.insert(student, OnConflictStrategy.abort);
  }
}

class _$SubjectDao extends SubjectDao {
  _$SubjectDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _subjectInsertionAdapter = InsertionAdapter(
            database,
            'Subject',
            (Subject item) =>
                <String, Object?>{'id': item.id, 'subName': item.subName});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Subject> _subjectInsertionAdapter;

  @override
  Future<List<Subject>> getAllSubjects() async {
    return _queryAdapter.queryList('SELECT * FROM subject',
        mapper: (Map<String, Object?> row) =>
            Subject(row['subName'] as String));
  }

  @override
  Future<Subject?> getSubject(String subName) async {
    return _queryAdapter.query('SELECT * FROM subject WHERE subName = ?1',
        mapper: (Map<String, Object?> row) => Subject(row['subName'] as String),
        arguments: [subName]);
  }

  @override
  Future<void> insertData(Subject subject) async {
    await _subjectInsertionAdapter.insert(subject, OnConflictStrategy.abort);
  }
}
