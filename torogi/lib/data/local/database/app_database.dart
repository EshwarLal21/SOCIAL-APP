import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';



part 'app_database.g.dart';

class Conversations extends Table {
  TextColumn get id => text()();                      // conversation id (or use combination keys)
  TextColumn get userId => text()();
  TextColumn get username => text()();
  TextColumn get profilePic => text().nullable()();
  TextColumn get lastMessage => text().nullable()();
  DateTimeColumn get lastMessageTime => dateTime().nullable()();
  IntColumn get unreadCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class Sessions extends Table {
  TextColumn get id => text()();  // User ID from Supabase
  BoolColumn get isLoggedIn => boolean()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
class LocalUsers extends Table {
  TextColumn get id => text()();
  TextColumn get username => text()();
  TextColumn get email => text()();
  TextColumn get bio => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get profilepic => text().nullable()();
  TextColumn get banner => text().withDefault(const Constant('guest'))();
  TextColumn get usertype => text().withDefault(const Constant('guest'))();
  IntColumn get following => integer().withDefault(const Constant(1))();
  IntColumn get followers => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  BoolColumn get notificationsEnabled => boolean().withDefault(const Constant(false))();
  IntColumn get credits => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => ['UNIQUE (username)'];
}

class LocalChanges extends Table {
  TextColumn get id => text()();
  TextColumn get action => text()();
  TextColumn get payload => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalBlogs extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().nullable()();  // Make nullable if needed
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get category => text().nullable()();
  RealColumn get blogRating => real().nullable()();
  TextColumn get location => text().nullable()();

  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get username => text().nullable()();
  TextColumn get userProfilePic => text().nullable()();
  //DateTimeColumn get createdAt => dateTime().nullable()();




  @override
Set<Column> get primaryKey => {id};
}


class LocalUpgradeRequests extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get businessId => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  TextColumn get requestedType => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get reviewedAt => dateTime().nullable()();
  TextColumn get reviewedBy => text().nullable()();
  TextColumn get rejectionReason => text().nullable()();
  TextColumn get fileUrls => text().withDefault(const Constant('[]'))();
  TextColumn get requestedValue => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalNotifications extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get message => text()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalReports extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get contentId => text()();
  TextColumn get contentType => text()();
  TextColumn get reason => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
class HireRequests extends Table {
  TextColumn get id => text()(); // UUID for Supabase compatibility
  TextColumn get serviceId => text()();
  TextColumn get userId => text()();
  TextColumn get message => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('applied'))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get createdAt => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  @override
  List<Set<Column>> get uniqueKeys => [
    {serviceId, userId}
  ];

}

class LocalServiceApplications extends Table {
  TextColumn get id => text()();
  TextColumn get serviceId => text()();
  TextColumn get userId => text()();
  TextColumn get message => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('applied'))();
  TextColumn get createdAt => text().withDefault(const Constant(''))(); // Changed to TextColumn
  @override
  Set<Column> get primaryKey => {id};
}

class LocalServiceRatings extends Table {
  TextColumn get id => text()();
  TextColumn get serviceId => text()();
  TextColumn get userId => text()();
  IntColumn get rating => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalServices extends Table {
  TextColumn get id => text()();
  TextColumn get company => text()();
  TextColumn get servicedesc => text()();

  TextColumn get companylocation => text()();
  RealColumn get salary => real()();
  TextColumn get servicetype => text()();
  TextColumn get userid => text()();
  DateTimeColumn get createdat => dateTime()();
  TextColumn get serviceimage => text().nullable()();
  RealColumn get servicerating => real().withDefault(const Constant(0.0))();
  TextColumn get contact => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalFavorites extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get postId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();


  @override
  Set<Column> get primaryKey => {id};
}

class LocalFollows extends Table {
  TextColumn get followerId => text()();
  TextColumn get followedId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {followerId, followedId};
}

class LocalJobApplications extends Table {
  TextColumn get id => text()();
  TextColumn get jobId => text()();
  TextColumn get userId => text()();
  TextColumn get message => text().nullable()();
  TextColumn get cvUrl => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('applied'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalJobs extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get jobTitle => text()();
  TextColumn get jobDesc => text()();
  TextColumn get jobLocation => text()();
  TextColumn get contact => text()();
  IntColumn get slots => integer()();
  RealColumn get salary => real()();
  DateTimeColumn get postDuration => dateTime()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}



class LocalMessages extends Table {
  TextColumn get id => text()();
  TextColumn get senderId => text()();
  TextColumn get receiverId => text()();
  TextColumn get content => text()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}


class LocalBlogBookmarks extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get blogId => text().nullable()();
  TextColumn get userId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalBlogLikes extends Table {
  TextColumn get id => text()();
  TextColumn get blogId => text().nullable()();
  TextColumn get userId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalBlogReports extends Table {
  TextColumn get id => text()();
  TextColumn get blogId => text()();
  TextColumn get userId => text()();
  TextColumn get reason => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalBlogRatings extends Table {
  TextColumn get blogId => text()();
  TextColumn get userId => text()();
  IntColumn get rating => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {blogId, userId};
}

 class Services extends Table {
IntColumn get id => integer().autoIncrement()();
TextColumn get serviceId => text().withLength(min: 1, max: 36)(); // Supabase service ID
TextColumn get company => text().nullable()();
TextColumn get servicedesc => text().nullable()();
TextColumn get companylocation => text().nullable()();
RealColumn get salary => real().nullable()();
TextColumn get servicetype => text().nullable()();
TextColumn get userid => text().nullable()();
DateTimeColumn get lastUpdated => dateTime().nullable()();
}

// Define the ServiceRatings table
class ServiceRatings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serviceId => text().withLength(min: 1, max: 36)(); // Supabase service ID
  TextColumn get userId => text().withLength(min: 1, max: 36)();
  IntColumn get rating => integer()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

}
class LocalComments extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get blogId => text()();
  TextColumn get comment => text()();
  TextColumn get parentId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}


@DriftDatabase(tables: [
  LocalUsers,
  LocalChanges,
  LocalUpgradeRequests,
  LocalNotifications,
  LocalReports,
  LocalServiceApplications,
  LocalServiceRatings,
  LocalServices,
  ServiceRatings,
  HireRequests,
  LocalFavorites,
  LocalComments,
  LocalMessages,
  Services,
  LocalBlogs,
  HireRequests,
  LocalBlogRatings,
  LocalBlogLikes,
  LocalJobs,
  LocalFollows,
  Sessions,
  Conversations,
  LocalBlogBookmarks,
  LocalJobApplications,

  LocalBlogReports
],
   )
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;


  Future<void> deleteAllLocalServices() async {
    await delete(localServices).go();
  }

  Future<void> insertServiceRating(ServiceRatingsCompanion rating) =>
      into(serviceRatings).insert(rating, mode: InsertMode.insertOrReplace);

  Future<void> updateServiceRating(ServiceRatingsCompanion rating) =>
      (update(serviceRatings)
        ..where((tbl) =>
        tbl.serviceId.equals(rating.serviceId.value) &
        tbl.userId.equals(rating.userId.value)))
          .write(rating);

  Future<ServiceRating?> getServiceRating(String serviceId, String userId) =>
      (select(serviceRatings)
        ..where((tbl) =>
        tbl.serviceId.equals(serviceId) & tbl.userId.equals(userId)))
          .getSingleOrNull();

  Future<List<ServiceRating>> getServiceRatings(String serviceId) =>
      (select(serviceRatings)..where((tbl) => tbl.serviceId.equals(serviceId)))
          .get();

  Future<List<ServiceRating>> getUserRatings(String userId) =>
      (select(serviceRatings)..where((tbl) => tbl.userId.equals(userId))).get();

  Future<void> deleteServiceRating(String serviceId, String userId) =>
      (delete(serviceRatings)
        ..where((tbl) =>
        tbl.serviceId.equals(serviceId) & tbl.userId.equals(userId)))
          .go();

  Future<void> insertHireRequest(HireRequestsCompanion request) async {
    await into(hireRequests).insertOnConflictUpdate(request);
  }
  Future<List<LocalService>> getAllLocalServices() =>
      select(localServices).get();

  Future<void> insertLocalServices(List<LocalServicesCompanion> services) async {
    await batch((batch) {
      batch.insertAll(localServices, services, mode: InsertMode.insertOrReplace);
    });
  }

  // Application DAO methods
  Future<List<LocalServiceApplication>> getServiceApplications(String serviceId) =>
      (select(localServiceApplications)..where((tbl) => tbl.serviceId.equals(serviceId)))
          .get();

  Future<void> insertLocalServiceApplication(LocalServiceApplicationsCompanion app) =>
      into(localServiceApplications).insert(app, mode: InsertMode.insertOrReplace);

  Future<void> insertLocalServiceApplications(List<LocalServiceApplicationsCompanion> apps) async {
    await batch((batch) {
      batch.insertAll(localServiceApplications, apps, mode: InsertMode.insertOrReplace);
    });
  }

  Future<bool> hasUserAppliedForService(String serviceId, String userId) async {
    final count = await (select(localServiceApplications)
      ..where((tbl) => tbl.serviceId.equals(serviceId) & tbl.userId.equals(userId)))
        .get()
        .then((rows) => rows.length);
    return count > 0;
  }



  Future<void> insertOrReplaceService(LocalService service) async {
    await into(localServices).insertOnConflictUpdate(service);
  }


  Future<List<HireRequest>> getUnsyncedRequests() async {
    return await (select(hireRequests)..where((t) => t.isSynced.equals(false))).get();
  }

  Future<void> deleteLocalService(String id) =>
      (delete(localServices)..where((tbl) => tbl.id.equals(id))).go();


  Future<List<LocalServiceApplication>> getUserApplications(String userId) {
    return (select(localServiceApplications)
      ..where((tbl) => tbl.userId.equals(userId)))
        .get();
  }


  Future<void> updateLocalApplicationStatus(String applicationId, String status) =>
      (update(localServiceApplications)..where((tbl) => tbl.id.equals(applicationId)))
          .write(LocalServiceApplicationsCompanion(status: Value(status)));

  Future<void> deleteLocalApplication(String applicationId) =>
      (delete(localServiceApplications)..where((tbl) => tbl.id.equals(applicationId)))
          .go();

  Future<List<LocalServiceApplication>> getLocalApplicationsForService(String serviceId) {
    return (select(localServiceApplications)
      ..where((tbl) => tbl.serviceId.equals(serviceId)))
        .get();
  }







  Future<void> insertLocalBlogs(List<LocalBlogsCompanion> blogs) async {
    await batch((batch) {
      batch.insertAll(localBlogs, blogs, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> insertLocalBlogBookmark(LocalBlogBookmarksCompanion bookmark) async {
    await into(localBlogBookmarks).insert(bookmark, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteLocalBlogBookmark(String id) async {
    await (delete(localBlogBookmarks)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> insertLocalBlogLike(LocalBlogLikesCompanion like) async {
    await into(localBlogLikes).insert(like, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteLocalBlogLike(String blogId, String userId) async {
    await (delete(localBlogLikes)
      ..where((tbl) => tbl.blogId.equals(blogId) & tbl.userId.equals(userId)))
        .go();
  }

  Future<void> insertLocalBlogRating(LocalBlogRatingsCompanion rating) async {
    await into(localBlogRatings).insert(rating, mode: InsertMode.insertOrReplace);
  }

  Future<void> updateLocalBlog(LocalBlogsCompanion blog) async {
    await (update(localBlogs)..where((tbl) => tbl.id.equals(blog.id.value))).write(blog);
  }

  Future<void> insertLocalFollow(LocalFollowsCompanion follow) async {
    await into(localFollows).insert(follow, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteLocalFollow(String followerId, String followedId) async {
    await (delete(localFollows)
      ..where((tbl) => tbl.followerId.equals(followerId) & tbl.followedId.equals(followedId)))
        .go();
  }

  Future<bool> isFollowingLocally(String followerId, String followedId) async {
    final result = await (select(localFollows)
      ..where((tbl) => tbl.followerId.equals(followerId) & tbl.followedId.equals(followedId)))
        .getSingleOrNull();
    return result != null;
  }

  Future<void> insertLocalChange(LocalChangesCompanion change) async {
    await into(localChanges).insert(change);
  }

  Future<void> deleteLocalChange(String id) async {
    await (delete(localChanges)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<LocalChange>> getLocalChanges() async {
    return select(localChanges).get();
  }






  @override

  //Future<void> insertOrUpdateService(LocalServicesCompanion service);
  // --- LocalBlogBookmarks Operations ---



  // --- LocalBlogs Operations ---
  Future<void> insertOrUpdateService(LocalServicesCompanion service) async {
    await into(localServices).insertOnConflictUpdate(service);
  }
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.addColumn(localBlogs, localBlogs.username);
        await m.addColumn(localBlogs, localBlogs.userProfilePic);

        await m.addColumn(localServices, localServices.servicedesc);
      }
    },
  );


  Future<void> clearServices() async {
    await delete(localServices).go();
  }

  Future<void> insertLocalBlog(LocalBlogsCompanion blog) =>
      into(localBlogs).insert(blog, mode: InsertMode.insertOrReplace);
  Future<void> deleteLocalBlog(String blogId) =>
      (delete(localBlogs)..where((b) => b.id.equals(blogId))).go();
  Future<LocalBlog?> getLocalBlogById(String blogId) =>
      (select(localBlogs)..where((tbl) => tbl.id.equals(blogId))).getSingleOrNull();

  // --- LocalJobs Operations ---
  Future<List<LocalJob>> getAllJobs() => select(localJobs).get();
  Future<void> insertJobs(List<LocalJobsCompanion> jobs) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(localJobs, jobs);
    });
  }
  Future<void> clearJobs() => delete(localJobs).go();
  Future<LocalJob?> getLocalJobById(String jobId) =>
      (select(localJobs)..where((tbl) => tbl.id.equals(jobId))).getSingleOrNull();

  // --- LocalUsers Operations ---
  Future<void> insertLocalUser(LocalUsersCompanion user) =>
      into(localUsers).insert(user, mode: InsertMode.insertOrReplace);
  Future<LocalUser?> getLocalUserById(String userId) =>
      (select(localUsers)..where((tbl) => tbl.id.equals(userId))).getSingleOrNull();

  // --- LocalBlogLikes Operations ---


  // --- LocalBlogBookmarks Operations ---


  // --- LocalFollows Operations ---

  Future<List<LocalFollow>> getFollowing(String followerId) =>
      (select(localFollows)..where((f) => f.followerId.equals(followerId))).get();

  // --- LocalServices Operations ---


  Future<void> insertLocalService(LocalServicesCompanion service) =>
      into(localServices).insert(service, mode: InsertMode.insertOrReplace);
  Future<void> updateLocalService(LocalServicesCompanion service) =>
      update(localServices).replace(service);

  // --- LocalServiceRatings Operations ---
  Future<void> insertLocalServiceRating(LocalServiceRatingsCompanion rating) =>
      into(localServiceRatings).insert(rating, mode: InsertMode.insertOrReplace);
  Future<void> updateLocalServiceRating(LocalServiceRatingsCompanion rating) =>
      update(localServiceRatings).replace(rating);
  Future<LocalServiceRating?> getLocalServiceRating(String serviceId, String userId) =>
      (select(localServiceRatings)..where((tbl) => tbl.serviceId.equals(serviceId) & tbl.userId.equals(userId))).getSingleOrNull();
  Future<double> getAverageRatingForService(String serviceId) async {
    final ratings = await (select(localServiceRatings)..where((tbl) => tbl.serviceId.equals(serviceId))).get();
    if (ratings.isEmpty) return 0.0;
    return ratings.map((r) => r.rating).reduce((a, b) => a + b) / ratings.length;
  }

  // --- LocalServiceApplications Operations ---
  // Future<void> insertLocalServiceApplication(LocalServiceApplicationsCompanion application) =>
  //     into(localServiceApplications).insert(application, mode: InsertMode.insertOrReplace);


  // --- LocalChanges Operations ---


  // --- LocalNotifications Operations ---
  Future<void> insertLocalNotification(LocalNotificationsCompanion notification) =>
      into(localNotifications).insert(notification, mode: InsertMode.insertOrReplace);
  Future<List<LocalNotification>> getLocalNotifications(String userId) =>
      (select(localNotifications)..where((tbl) => tbl.userId.equals(userId))).get();
  Future<void> deleteLocalNotification(String id) =>
      (delete(localNotifications)..where((tbl) => tbl.id.equals(id))).go();

  // --- LocalReports Operations ---
  Future<void> insertLocalReport(LocalReportsCompanion report) =>
      into(localReports).insert(report, mode: InsertMode.insertOrReplace);
  Future<List<LocalReport>> getLocalReports(String userId) =>
      (select(localReports)..where((tbl) => tbl.userId.equals(userId))).get();
  Future<void> deleteLocalReport(String id) =>
      (delete(localReports)..where((tbl) => tbl.id.equals(id))).go();

  // --- LocalFavorites Operations ---
  Future<void> insertLocalFavorite(LocalFavoritesCompanion favorite) =>
      into(localFavorites).insert(favorite, mode: InsertMode.insertOrReplace);
  Future<List<LocalFavorite>> getLocalFavorites(String userId) =>
      (select(localFavorites)..where((tbl) => tbl.userId.equals(userId))).get();
  Future<void> deleteLocalFavorite(String id) =>
      (delete(localFavorites)..where((tbl) => tbl.id.equals(id))).go();

  // --- LocalComments Operations ---
  Future<void> insertLocalComment(LocalCommentsCompanion comment) =>
      into(localComments).insert(comment, mode: InsertMode.insertOrReplace);
  Future<List<LocalComment>> getLocalComments(String blogId) =>
      (select(localComments)..where((tbl) => tbl.blogId.equals(blogId))).get();
  Future<void> deleteLocalComment(String id) =>
      (delete(localComments)..where((tbl) => tbl.id.equals(id))).go();

  // --- LocalMessages Operations ---
  Future<void> insertLocalMessage(LocalMessagesCompanion message) =>
      into(localMessages).insert(message, mode: InsertMode.insertOrReplace);
  Future<List<LocalMessage>> getLocalMessages(String userId) =>
      (select(localMessages)..where((tbl) => tbl.senderId.equals(userId) | tbl.receiverId.equals(userId))).get();
  Future<void> deleteLocalMessage(String id) =>
      (delete(localMessages)..where((tbl) => tbl.id.equals(id))).go();

  // --- LocalBlogReports Operations ---
  Future<void> insertLocalBlogReport(LocalBlogReportsCompanion report) =>
      into(localBlogReports).insert(report, mode: InsertMode.insertOrReplace);
  Future<List<LocalBlogReport>> getLocalBlogReports(String userId) =>
      (select(localBlogReports)..where((tbl) => tbl.userId.equals(userId))).get();
  Future<void> deleteLocalBlogReport(String id) =>
      (delete(localBlogReports)..where((tbl) => tbl.id.equals(id))).go();

  // --- LocalJobApplications Operations ---
  Future<void> insertLocalJobApplication(LocalJobApplicationsCompanion application) =>
      into(localJobApplications).insert(application, mode: InsertMode.insertOrReplace);
  Future<List<LocalJobApplication>> getLocalJobApplications(String jobId) =>
      (select(localJobApplications)..where((tbl) => tbl.jobId.equals(jobId))).get();
  Future<void> deleteLocalJobApplication(String id) =>
      (delete(localJobApplications)..where((tbl) => tbl.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'localdb.sqlite');
    return NativeDatabase(File(path));
  });
}