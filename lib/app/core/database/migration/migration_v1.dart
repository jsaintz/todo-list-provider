import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/app/core/database/migration/migration.dart';

class MigrationV1 extends Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table todo(
        id Integer primary key autoincrement,
        descryption varchar(500) not null,
        date_time datetime,
        done integer
      )
    ''');
  }

  @override
  void update(Batch batch) {
    // TODO: implement update
  }
}
