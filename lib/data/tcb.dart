import 'package:moor_flutter/moor_flutter.dart';

part 'tcb.g.dart';


class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get msg => text()();
}


@UseMoor(tables: [Messages])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;
  Future<List<Message>> getAllOrder() => select(messages).get();
  Stream<List<Message>> watchAllOrder() => select(messages).watch();
  Future insertNewOrder(Message message) => into(messages).insert(message);
}

//
// class Messages extends Table {
//   IntColumn get id => integer().autoIncrement().call();
//
//   TextColumn get msg => text().call();
// }
//
// @UseMoor(tables: [Messages])
// class AppDatabase extends _$AppDatabase {
//   AppDatabase()
//       : super(FlutterQueryExecutor.inDatabaseFolder(
//       path: 'db.sqlite', logStatements: true));
//   @override
//   int get schemaVersion => 1;
//
//   Future<List<Message>> getAllMessages() => select(Messages).get();
//
//   Stream<List<Message>> watchAllMessages() => select(Messages).get();
//   Future insertTask(Task task) => into(tasks).insert(task);
// }
