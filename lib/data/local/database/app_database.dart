import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class LocalUsers extends Table {
  TextColumn get id => text()(); // Supabase user ID
  TextColumn get email => text()();
  TextColumn get username => text()();
  TextColumn get fullName => text().nullable()();
  TextColumn get bio => text().nullable()();
  TextColumn get profilePic => text().nullable()();
  TextColumn get coverPhoto => text().nullable()();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalBlogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get blogId => text()(); // Supabase blog ID
  TextColumn get userId => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get image => text().nullable()();
  TextColumn get category => text()();
  IntColumn get likesCount => integer().withDefault(const Constant(0))();
  IntColumn get commentsCount => integer().withDefault(const Constant(0))();
  BoolColumn get isLiked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  // User info
  TextColumn get username => text()();
  TextColumn get userProfilePic => text().nullable()();
  // Metadata
  BoolColumn get isFromFollowing => boolean().withDefault(const Constant(true))();
}

class LocalFollowing extends Table {
  TextColumn get followerId => text()();
  TextColumn get followedId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {followerId, followedId};
}

@DriftDatabase(tables: [LocalUsers, LocalBlogs, LocalFollowing])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // User operations
  Future<LocalUser?> getUser(String userId) =>
      (select(localUsers)..where((u) => u.id.equals(userId))).getSingleOrNull();

  Future<void> insertUser(LocalUsersCompanion user) =>
      into(localUsers).insert(user, mode: InsertMode.replace);

  Future<void> updateUser(LocalUsersCompanion user) =>
      update(localUsers).replace(user);

  Future<void> deleteUser(String userId) =>
      (delete(localUsers)..where((u) => u.id.equals(userId))).go();

  // CRUD operations for blogs
  Future<List<LocalBlog>> getAllBlogs() => select(localBlogs).get();
  
  Future<List<LocalBlog>> getBlogsFromFollowing() =>
      (select(localBlogs)..where((b) => b.isFromFollowing.equals(true)))
      .get();

  Future<List<LocalBlog>> getRandomBlogs() =>
      (select(localBlogs)..where((b) => b.isFromFollowing.equals(false)))
      .get();

  Future<void> insertBlog(LocalBlogsCompanion blog) =>
      into(localBlogs).insert(blog);

  Future<void> insertBlogs(List<LocalBlogsCompanion> blogs) async {
    await batch((batch) {
      batch.insertAll(localBlogs, blogs);
    });
  }

  Future<void> clearBlogs() => delete(localBlogs).go();

  // Following operations
  Future<List<LocalFollowingData>> getFollowers(String userId) {
    return (select(localFollowing)..where((tbl) => tbl.followedId.equals(userId))).get();
  }

  Future<List<LocalFollowingData>> getFollowing(String userId) {
    return (select(localFollowing)..where((tbl) => tbl.followerId.equals(userId))).get();
  }

  Future<void> insertFollowing(LocalFollowingCompanion following) {
    return into(localFollowing).insert(following, mode: InsertMode.insertOrReplace);
  }

  Future<int> deleteFollowing(String followerId, String followedId) {
    return (delete(localFollowing)..where((tbl) => 
      tbl.followerId.equals(followerId) & 
      tbl.followedId.equals(followedId)
    )).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'torogi.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
} 