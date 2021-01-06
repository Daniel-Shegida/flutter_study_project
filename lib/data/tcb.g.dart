// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcb.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Message extends DataClass implements Insertable<Message> {
  final int id;
  final String msg;
  Message({@required this.id, @required this.msg});
  factory Message.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Message(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      msg: stringType.mapFromDatabaseResponse(data['${effectivePrefix}msg']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || msg != null) {
      map['msg'] = Variable<String>(msg);
    }
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      msg: msg == null && nullToAbsent ? const Value.absent() : Value(msg),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<int>(json['id']),
      msg: serializer.fromJson<String>(json['msg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'msg': serializer.toJson<String>(msg),
    };
  }

  Message copyWith({int id, String msg}) => Message(
        id: id ?? this.id,
        msg: msg ?? this.msg,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('msg: $msg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, msg.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Message && other.id == this.id && other.msg == this.msg);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> id;
  final Value<String> msg;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.msg = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    @required String msg,
  }) : msg = Value(msg);
  static Insertable<Message> custom({
    Expression<int> id,
    Expression<String> msg,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (msg != null) 'msg': msg,
    });
  }

  MessagesCompanion copyWith({Value<int> id, Value<String> msg}) {
    return MessagesCompanion(
      id: id ?? this.id,
      msg: msg ?? this.msg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (msg.present) {
      map['msg'] = Variable<String>(msg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('msg: $msg')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  final GeneratedDatabase _db;
  final String _alias;
  $MessagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _msgMeta = const VerificationMeta('msg');
  GeneratedTextColumn _msg;
  @override
  GeneratedTextColumn get msg => _msg ??= _constructMsg();
  GeneratedTextColumn _constructMsg() {
    return GeneratedTextColumn(
      'msg',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, msg];
  @override
  $MessagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'messages';
  @override
  final String actualTableName = 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('msg')) {
      context.handle(
          _msgMeta, msg.isAcceptableOrUnknown(data['msg'], _msgMeta));
    } else if (isInserting) {
      context.missing(_msgMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Message.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MessagesTable _messages;
  $MessagesTable get messages => _messages ??= $MessagesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [messages];
}
