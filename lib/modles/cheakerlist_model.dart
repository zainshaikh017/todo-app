import 'package:hive/hive.dart';
part 'cheakerlist_model.g.dart';


@HiveType(typeId: 0)
 class listmodel extends HiveObject{

  @HiveField(0)
   String item;
  @HiveField(1)
  bool? cheak ;


  listmodel({
    required this.item,
    this.cheak,

});







 }