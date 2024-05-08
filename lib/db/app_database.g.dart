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

  FavoriteDao? _favoriteDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Movie` (`id` TEXT NOT NULL, `image` TEXT NOT NULL, `name` TEXT NOT NULL, `content` TEXT, `homePage` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `History` (`id` TEXT NOT NULL, `movie` TEXT NOT NULL, `serverIndex` INTEGER NOT NULL, `episodeIndex` INTEGER NOT NULL, `position` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteDao get favoriteDao {
    return _favoriteDaoInstance ??= _$FavoriteDao(database, changeListener);
  }

  @override
  HistoryDao get historyDao {
    return _historyDaoInstance ??= _$HistoryDao(database, changeListener);
  }
}

class _$FavoriteDao extends FavoriteDao {
  _$FavoriteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'id': item.id,
                  'image': item.image,
                  'name': item.name,
                  'content': item.content,
                  'homePage': _homePageConverter.encode(item.homePage)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  @override
  Stream<List<Movie>> findAll() {
    return _queryAdapter.queryListStream('SELECT * FROM Movie',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as String,
            image: row['image'] as String,
            name: row['name'] as String,
            content: row['content'] as String?,
            homePage: _homePageConverter.decode(row['homePage'] as int)),
        queryableName: 'Movie',
        isView: false);
  }

  @override
  Future<Movie?> findById(String id) async {
    return _queryAdapter.query('SELECT * FROM Movie WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as String,
            image: row['image'] as String,
            name: row['name'] as String,
            content: row['content'] as String?,
            homePage: _homePageConverter.decode(row['homePage'] as int)),
        arguments: [id]);
  }

  @override
  Future<void> deleteFavorite(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Movie WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertFavorite(Movie favorite) async {
    await _movieInsertionAdapter.insert(favorite, OnConflictStrategy.abort);
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
                  'movie': _movieConverter.encode(item.movie),
                  'serverIndex': item.serverIndex,
                  'episodeIndex': item.episodeIndex,
                  'position': item.position
                },
            changeListener),
        _historyDeletionAdapter = DeletionAdapter(
            database,
            'History',
            ['id'],
            (History item) => <String, Object?>{
                  'id': item.id,
                  'movie': _movieConverter.encode(item.movie),
                  'serverIndex': item.serverIndex,
                  'episodeIndex': item.episodeIndex,
                  'position': item.position
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<History> _historyInsertionAdapter;

  final DeletionAdapter<History> _historyDeletionAdapter;

  @override
  Stream<List<History>> findAll() {
    return _queryAdapter.queryListStream('SELECT * FROM History',
        mapper: (Map<String, Object?> row) => History(
            row['id'] as String,
            _movieConverter.decode(row['movie'] as String),
            row['serverIndex'] as int,
            row['episodeIndex'] as int,
            row['position'] as int),
        queryableName: 'History',
        isView: false);
  }

  @override
  Future<History?> findById(String id) async {
    return _queryAdapter.query('SELECT * FROM History WHERE id = ?1',
        mapper: (Map<String, Object?> row) => History(
            row['id'] as String,
            _movieConverter.decode(row['movie'] as String),
            row['serverIndex'] as int,
            row['episodeIndex'] as int,
            row['position'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertHistory(History history) async {
    await _historyInsertionAdapter.insert(history, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteHistory(History history) async {
    await _historyDeletionAdapter.delete(history);
  }
}

// ignore_for_file: unused_element
final _homePageConverter = HomePageConverter();
final _movieConverter = MovieConverter();
