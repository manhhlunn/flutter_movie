// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  HistoryDao? _historyDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `History` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `image` TEXT NOT NULL, `serverIndex` INTEGER NOT NULL, `episodeIndex` INTEGER NOT NULL, `position` INTEGER NOT NULL, `updateTime` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  HistoryDao get historyDao {
    return _historyDaoInstance ??= _$HistoryDao(database, changeListener);
  }
}

class _$HistoryDao extends HistoryDao {
  _$HistoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _historyInsertionAdapter = InsertionAdapter(
            database,
            'History',
            (History item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'serverIndex': item.serverIndex,
                  'episodeIndex': item.episodeIndex,
                  'position': item.position,
                  'updateTime': item.updateTime
                },
            changeListener),
        _historyUpdateAdapter = UpdateAdapter(
            database,
            'History',
            ['id'],
            (History item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'serverIndex': item.serverIndex,
                  'episodeIndex': item.episodeIndex,
                  'position': item.position,
                  'updateTime': item.updateTime
                },
            changeListener),
        _historyDeletionAdapter = DeletionAdapter(
            database,
            'History',
            ['id'],
            (History item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'serverIndex': item.serverIndex,
                  'episodeIndex': item.episodeIndex,
                  'position': item.position,
                  'updateTime': item.updateTime
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<History> _historyInsertionAdapter;

  final UpdateAdapter<History> _historyUpdateAdapter;

  final DeletionAdapter<History> _historyDeletionAdapter;

  @override
  Stream<List<History>> findAll() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM History ORDER BY updateTime DESC',
        mapper: (Map<String, Object?> row) => History(
            row['id'] as String,
            row['name'] as String,
            row['image'] as String,
            row['serverIndex'] as int,
            row['episodeIndex'] as int,
            row['position'] as int,
            row['updateTime'] as int),
        queryableName: 'History',
        isView: false);
  }

  @override
  Future<History?> findById(String id) async {
    return _queryAdapter.query('SELECT * FROM History WHERE id = ?1',
        mapper: (Map<String, Object?> row) => History(
            row['id'] as String,
            row['name'] as String,
            row['image'] as String,
            row['serverIndex'] as int,
            row['episodeIndex'] as int,
            row['position'] as int,
            row['updateTime'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertHistory(History history) async {
    await _historyInsertionAdapter.insert(history, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateHistory(History history) async {
    await _historyUpdateAdapter.update(history, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteHistory(History history) async {
    await _historyDeletionAdapter.delete(history);
  }
}
