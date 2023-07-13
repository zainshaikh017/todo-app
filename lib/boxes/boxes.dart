import 'package:hive/hive.dart';
import 'package:todo_app/modles/cheakerlist_model.dart';

class boxes{
  static Box<listmodel> getData()=>Hive.box<listmodel>('notes');
}