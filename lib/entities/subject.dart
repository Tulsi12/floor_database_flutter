
import 'package:floor/floor.dart';

@entity
class Subject{
  @PrimaryKey(autoGenerate: true)
  int? id;

  String subName;
 
  Subject(this.subName);

}