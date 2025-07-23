// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalUsersTable extends LocalUsers
    with TableInfo<$LocalUsersTable, LocalUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profilePicMeta =
      const VerificationMeta('profilePic');
  @override
  late final GeneratedColumn<String> profilePic = GeneratedColumn<String>(
      'profile_pic', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverPhotoMeta =
      const VerificationMeta('coverPhoto');
  @override
  late final GeneratedColumn<String> coverPhoto = GeneratedColumn<String>(
      'cover_photo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, email, username, fullName, bio, profilePic, coverPhoto, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_users';
  @override
  VerificationContext validateIntegrity(Insertable<LocalUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    }
    if (data.containsKey('profile_pic')) {
      context.handle(
          _profilePicMeta,
          profilePic.isAcceptableOrUnknown(
              data['profile_pic']!, _profilePicMeta));
    }
    if (data.containsKey('cover_photo')) {
      context.handle(
          _coverPhotoMeta,
          coverPhoto.isAcceptableOrUnknown(
              data['cover_photo']!, _coverPhotoMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalUser(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name']),
      bio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bio']),
      profilePic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_pic']),
      coverPhoto: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_photo']),
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $LocalUsersTable createAlias(String alias) {
    return $LocalUsersTable(attachedDatabase, alias);
  }
}

class LocalUser extends DataClass implements Insertable<LocalUser> {
  final String id;
  final String email;
  final String username;
  final String? fullName;
  final String? bio;
  final String? profilePic;
  final String? coverPhoto;
  final DateTime lastUpdated;
  const LocalUser(
      {required this.id,
      required this.email,
      required this.username,
      this.fullName,
      this.bio,
      this.profilePic,
      this.coverPhoto,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    if (!nullToAbsent || profilePic != null) {
      map['profile_pic'] = Variable<String>(profilePic);
    }
    if (!nullToAbsent || coverPhoto != null) {
      map['cover_photo'] = Variable<String>(coverPhoto);
    }
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  LocalUsersCompanion toCompanion(bool nullToAbsent) {
    return LocalUsersCompanion(
      id: Value(id),
      email: Value(email),
      username: Value(username),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      profilePic: profilePic == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePic),
      coverPhoto: coverPhoto == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPhoto),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory LocalUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalUser(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      username: serializer.fromJson<String>(json['username']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      bio: serializer.fromJson<String?>(json['bio']),
      profilePic: serializer.fromJson<String?>(json['profilePic']),
      coverPhoto: serializer.fromJson<String?>(json['coverPhoto']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'username': serializer.toJson<String>(username),
      'fullName': serializer.toJson<String?>(fullName),
      'bio': serializer.toJson<String?>(bio),
      'profilePic': serializer.toJson<String?>(profilePic),
      'coverPhoto': serializer.toJson<String?>(coverPhoto),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  LocalUser copyWith(
          {String? id,
          String? email,
          String? username,
          Value<String?> fullName = const Value.absent(),
          Value<String?> bio = const Value.absent(),
          Value<String?> profilePic = const Value.absent(),
          Value<String?> coverPhoto = const Value.absent(),
          DateTime? lastUpdated}) =>
      LocalUser(
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
        fullName: fullName.present ? fullName.value : this.fullName,
        bio: bio.present ? bio.value : this.bio,
        profilePic: profilePic.present ? profilePic.value : this.profilePic,
        coverPhoto: coverPhoto.present ? coverPhoto.value : this.coverPhoto,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  LocalUser copyWithCompanion(LocalUsersCompanion data) {
    return LocalUser(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      username: data.username.present ? data.username.value : this.username,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      bio: data.bio.present ? data.bio.value : this.bio,
      profilePic:
          data.profilePic.present ? data.profilePic.value : this.profilePic,
      coverPhoto:
          data.coverPhoto.present ? data.coverPhoto.value : this.coverPhoto,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalUser(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('username: $username, ')
          ..write('fullName: $fullName, ')
          ..write('bio: $bio, ')
          ..write('profilePic: $profilePic, ')
          ..write('coverPhoto: $coverPhoto, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, email, username, fullName, bio, profilePic, coverPhoto, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalUser &&
          other.id == this.id &&
          other.email == this.email &&
          other.username == this.username &&
          other.fullName == this.fullName &&
          other.bio == this.bio &&
          other.profilePic == this.profilePic &&
          other.coverPhoto == this.coverPhoto &&
          other.lastUpdated == this.lastUpdated);
}

class LocalUsersCompanion extends UpdateCompanion<LocalUser> {
  final Value<String> id;
  final Value<String> email;
  final Value<String> username;
  final Value<String?> fullName;
  final Value<String?> bio;
  final Value<String?> profilePic;
  final Value<String?> coverPhoto;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const LocalUsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.username = const Value.absent(),
    this.fullName = const Value.absent(),
    this.bio = const Value.absent(),
    this.profilePic = const Value.absent(),
    this.coverPhoto = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalUsersCompanion.insert({
    required String id,
    required String email,
    required String username,
    this.fullName = const Value.absent(),
    this.bio = const Value.absent(),
    this.profilePic = const Value.absent(),
    this.coverPhoto = const Value.absent(),
    required DateTime lastUpdated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        email = Value(email),
        username = Value(username),
        lastUpdated = Value(lastUpdated);
  static Insertable<LocalUser> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<String>? username,
    Expression<String>? fullName,
    Expression<String>? bio,
    Expression<String>? profilePic,
    Expression<String>? coverPhoto,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (username != null) 'username': username,
      if (fullName != null) 'full_name': fullName,
      if (bio != null) 'bio': bio,
      if (profilePic != null) 'profile_pic': profilePic,
      if (coverPhoto != null) 'cover_photo': coverPhoto,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalUsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? email,
      Value<String>? username,
      Value<String?>? fullName,
      Value<String?>? bio,
      Value<String?>? profilePic,
      Value<String?>? coverPhoto,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return LocalUsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      bio: bio ?? this.bio,
      profilePic: profilePic ?? this.profilePic,
      coverPhoto: coverPhoto ?? this.coverPhoto,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (profilePic.present) {
      map['profile_pic'] = Variable<String>(profilePic.value);
    }
    if (coverPhoto.present) {
      map['cover_photo'] = Variable<String>(coverPhoto.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalUsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('username: $username, ')
          ..write('fullName: $fullName, ')
          ..write('bio: $bio, ')
          ..write('profilePic: $profilePic, ')
          ..write('coverPhoto: $coverPhoto, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalBlogsTable extends LocalBlogs
    with TableInfo<$LocalBlogsTable, LocalBlog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalBlogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _blogIdMeta = const VerificationMeta('blogId');
  @override
  late final GeneratedColumn<String> blogId = GeneratedColumn<String>(
      'blog_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _likesCountMeta =
      const VerificationMeta('likesCount');
  @override
  late final GeneratedColumn<int> likesCount = GeneratedColumn<int>(
      'likes_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _commentsCountMeta =
      const VerificationMeta('commentsCount');
  @override
  late final GeneratedColumn<int> commentsCount = GeneratedColumn<int>(
      'comments_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isLikedMeta =
      const VerificationMeta('isLiked');
  @override
  late final GeneratedColumn<bool> isLiked = GeneratedColumn<bool>(
      'is_liked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_liked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userProfilePicMeta =
      const VerificationMeta('userProfilePic');
  @override
  late final GeneratedColumn<String> userProfilePic = GeneratedColumn<String>(
      'user_profile_pic', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isFromFollowingMeta =
      const VerificationMeta('isFromFollowing');
  @override
  late final GeneratedColumn<bool> isFromFollowing = GeneratedColumn<bool>(
      'is_from_following', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_from_following" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        blogId,
        userId,
        title,
        description,
        image,
        category,
        likesCount,
        commentsCount,
        isLiked,
        createdAt,
        username,
        userProfilePic,
        isFromFollowing
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_blogs';
  @override
  VerificationContext validateIntegrity(Insertable<LocalBlog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('blog_id')) {
      context.handle(_blogIdMeta,
          blogId.isAcceptableOrUnknown(data['blog_id']!, _blogIdMeta));
    } else if (isInserting) {
      context.missing(_blogIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('likes_count')) {
      context.handle(
          _likesCountMeta,
          likesCount.isAcceptableOrUnknown(
              data['likes_count']!, _likesCountMeta));
    }
    if (data.containsKey('comments_count')) {
      context.handle(
          _commentsCountMeta,
          commentsCount.isAcceptableOrUnknown(
              data['comments_count']!, _commentsCountMeta));
    }
    if (data.containsKey('is_liked')) {
      context.handle(_isLikedMeta,
          isLiked.isAcceptableOrUnknown(data['is_liked']!, _isLikedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('user_profile_pic')) {
      context.handle(
          _userProfilePicMeta,
          userProfilePic.isAcceptableOrUnknown(
              data['user_profile_pic']!, _userProfilePicMeta));
    }
    if (data.containsKey('is_from_following')) {
      context.handle(
          _isFromFollowingMeta,
          isFromFollowing.isAcceptableOrUnknown(
              data['is_from_following']!, _isFromFollowingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalBlog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalBlog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      blogId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blog_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      likesCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}likes_count'])!,
      commentsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}comments_count'])!,
      isLiked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_liked'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      userProfilePic: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}user_profile_pic']),
      isFromFollowing: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_from_following'])!,
    );
  }

  @override
  $LocalBlogsTable createAlias(String alias) {
    return $LocalBlogsTable(attachedDatabase, alias);
  }
}

class LocalBlog extends DataClass implements Insertable<LocalBlog> {
  final int id;
  final String blogId;
  final String userId;
  final String title;
  final String description;
  final String? image;
  final String category;
  final int likesCount;
  final int commentsCount;
  final bool isLiked;
  final DateTime createdAt;
  final String username;
  final String? userProfilePic;
  final bool isFromFollowing;
  const LocalBlog(
      {required this.id,
      required this.blogId,
      required this.userId,
      required this.title,
      required this.description,
      this.image,
      required this.category,
      required this.likesCount,
      required this.commentsCount,
      required this.isLiked,
      required this.createdAt,
      required this.username,
      this.userProfilePic,
      required this.isFromFollowing});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['blog_id'] = Variable<String>(blogId);
    map['user_id'] = Variable<String>(userId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['category'] = Variable<String>(category);
    map['likes_count'] = Variable<int>(likesCount);
    map['comments_count'] = Variable<int>(commentsCount);
    map['is_liked'] = Variable<bool>(isLiked);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || userProfilePic != null) {
      map['user_profile_pic'] = Variable<String>(userProfilePic);
    }
    map['is_from_following'] = Variable<bool>(isFromFollowing);
    return map;
  }

  LocalBlogsCompanion toCompanion(bool nullToAbsent) {
    return LocalBlogsCompanion(
      id: Value(id),
      blogId: Value(blogId),
      userId: Value(userId),
      title: Value(title),
      description: Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      category: Value(category),
      likesCount: Value(likesCount),
      commentsCount: Value(commentsCount),
      isLiked: Value(isLiked),
      createdAt: Value(createdAt),
      username: Value(username),
      userProfilePic: userProfilePic == null && nullToAbsent
          ? const Value.absent()
          : Value(userProfilePic),
      isFromFollowing: Value(isFromFollowing),
    );
  }

  factory LocalBlog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalBlog(
      id: serializer.fromJson<int>(json['id']),
      blogId: serializer.fromJson<String>(json['blogId']),
      userId: serializer.fromJson<String>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
      category: serializer.fromJson<String>(json['category']),
      likesCount: serializer.fromJson<int>(json['likesCount']),
      commentsCount: serializer.fromJson<int>(json['commentsCount']),
      isLiked: serializer.fromJson<bool>(json['isLiked']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      username: serializer.fromJson<String>(json['username']),
      userProfilePic: serializer.fromJson<String?>(json['userProfilePic']),
      isFromFollowing: serializer.fromJson<bool>(json['isFromFollowing']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'blogId': serializer.toJson<String>(blogId),
      'userId': serializer.toJson<String>(userId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String?>(image),
      'category': serializer.toJson<String>(category),
      'likesCount': serializer.toJson<int>(likesCount),
      'commentsCount': serializer.toJson<int>(commentsCount),
      'isLiked': serializer.toJson<bool>(isLiked),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'username': serializer.toJson<String>(username),
      'userProfilePic': serializer.toJson<String?>(userProfilePic),
      'isFromFollowing': serializer.toJson<bool>(isFromFollowing),
    };
  }

  LocalBlog copyWith(
          {int? id,
          String? blogId,
          String? userId,
          String? title,
          String? description,
          Value<String?> image = const Value.absent(),
          String? category,
          int? likesCount,
          int? commentsCount,
          bool? isLiked,
          DateTime? createdAt,
          String? username,
          Value<String?> userProfilePic = const Value.absent(),
          bool? isFromFollowing}) =>
      LocalBlog(
        id: id ?? this.id,
        blogId: blogId ?? this.blogId,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image.present ? image.value : this.image,
        category: category ?? this.category,
        likesCount: likesCount ?? this.likesCount,
        commentsCount: commentsCount ?? this.commentsCount,
        isLiked: isLiked ?? this.isLiked,
        createdAt: createdAt ?? this.createdAt,
        username: username ?? this.username,
        userProfilePic:
            userProfilePic.present ? userProfilePic.value : this.userProfilePic,
        isFromFollowing: isFromFollowing ?? this.isFromFollowing,
      );
  LocalBlog copyWithCompanion(LocalBlogsCompanion data) {
    return LocalBlog(
      id: data.id.present ? data.id.value : this.id,
      blogId: data.blogId.present ? data.blogId.value : this.blogId,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      category: data.category.present ? data.category.value : this.category,
      likesCount:
          data.likesCount.present ? data.likesCount.value : this.likesCount,
      commentsCount: data.commentsCount.present
          ? data.commentsCount.value
          : this.commentsCount,
      isLiked: data.isLiked.present ? data.isLiked.value : this.isLiked,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      username: data.username.present ? data.username.value : this.username,
      userProfilePic: data.userProfilePic.present
          ? data.userProfilePic.value
          : this.userProfilePic,
      isFromFollowing: data.isFromFollowing.present
          ? data.isFromFollowing.value
          : this.isFromFollowing,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlog(')
          ..write('id: $id, ')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('category: $category, ')
          ..write('likesCount: $likesCount, ')
          ..write('commentsCount: $commentsCount, ')
          ..write('isLiked: $isLiked, ')
          ..write('createdAt: $createdAt, ')
          ..write('username: $username, ')
          ..write('userProfilePic: $userProfilePic, ')
          ..write('isFromFollowing: $isFromFollowing')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      blogId,
      userId,
      title,
      description,
      image,
      category,
      likesCount,
      commentsCount,
      isLiked,
      createdAt,
      username,
      userProfilePic,
      isFromFollowing);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalBlog &&
          other.id == this.id &&
          other.blogId == this.blogId &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.description == this.description &&
          other.image == this.image &&
          other.category == this.category &&
          other.likesCount == this.likesCount &&
          other.commentsCount == this.commentsCount &&
          other.isLiked == this.isLiked &&
          other.createdAt == this.createdAt &&
          other.username == this.username &&
          other.userProfilePic == this.userProfilePic &&
          other.isFromFollowing == this.isFromFollowing);
}

class LocalBlogsCompanion extends UpdateCompanion<LocalBlog> {
  final Value<int> id;
  final Value<String> blogId;
  final Value<String> userId;
  final Value<String> title;
  final Value<String> description;
  final Value<String?> image;
  final Value<String> category;
  final Value<int> likesCount;
  final Value<int> commentsCount;
  final Value<bool> isLiked;
  final Value<DateTime> createdAt;
  final Value<String> username;
  final Value<String?> userProfilePic;
  final Value<bool> isFromFollowing;
  const LocalBlogsCompanion({
    this.id = const Value.absent(),
    this.blogId = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.category = const Value.absent(),
    this.likesCount = const Value.absent(),
    this.commentsCount = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.username = const Value.absent(),
    this.userProfilePic = const Value.absent(),
    this.isFromFollowing = const Value.absent(),
  });
  LocalBlogsCompanion.insert({
    this.id = const Value.absent(),
    required String blogId,
    required String userId,
    required String title,
    required String description,
    this.image = const Value.absent(),
    required String category,
    this.likesCount = const Value.absent(),
    this.commentsCount = const Value.absent(),
    this.isLiked = const Value.absent(),
    required DateTime createdAt,
    required String username,
    this.userProfilePic = const Value.absent(),
    this.isFromFollowing = const Value.absent(),
  })  : blogId = Value(blogId),
        userId = Value(userId),
        title = Value(title),
        description = Value(description),
        category = Value(category),
        createdAt = Value(createdAt),
        username = Value(username);
  static Insertable<LocalBlog> custom({
    Expression<int>? id,
    Expression<String>? blogId,
    Expression<String>? userId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? image,
    Expression<String>? category,
    Expression<int>? likesCount,
    Expression<int>? commentsCount,
    Expression<bool>? isLiked,
    Expression<DateTime>? createdAt,
    Expression<String>? username,
    Expression<String>? userProfilePic,
    Expression<bool>? isFromFollowing,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (blogId != null) 'blog_id': blogId,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (category != null) 'category': category,
      if (likesCount != null) 'likes_count': likesCount,
      if (commentsCount != null) 'comments_count': commentsCount,
      if (isLiked != null) 'is_liked': isLiked,
      if (createdAt != null) 'created_at': createdAt,
      if (username != null) 'username': username,
      if (userProfilePic != null) 'user_profile_pic': userProfilePic,
      if (isFromFollowing != null) 'is_from_following': isFromFollowing,
    });
  }

  LocalBlogsCompanion copyWith(
      {Value<int>? id,
      Value<String>? blogId,
      Value<String>? userId,
      Value<String>? title,
      Value<String>? description,
      Value<String?>? image,
      Value<String>? category,
      Value<int>? likesCount,
      Value<int>? commentsCount,
      Value<bool>? isLiked,
      Value<DateTime>? createdAt,
      Value<String>? username,
      Value<String?>? userProfilePic,
      Value<bool>? isFromFollowing}) {
    return LocalBlogsCompanion(
      id: id ?? this.id,
      blogId: blogId ?? this.blogId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      category: category ?? this.category,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isLiked: isLiked ?? this.isLiked,
      createdAt: createdAt ?? this.createdAt,
      username: username ?? this.username,
      userProfilePic: userProfilePic ?? this.userProfilePic,
      isFromFollowing: isFromFollowing ?? this.isFromFollowing,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (blogId.present) {
      map['blog_id'] = Variable<String>(blogId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (likesCount.present) {
      map['likes_count'] = Variable<int>(likesCount.value);
    }
    if (commentsCount.present) {
      map['comments_count'] = Variable<int>(commentsCount.value);
    }
    if (isLiked.present) {
      map['is_liked'] = Variable<bool>(isLiked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (userProfilePic.present) {
      map['user_profile_pic'] = Variable<String>(userProfilePic.value);
    }
    if (isFromFollowing.present) {
      map['is_from_following'] = Variable<bool>(isFromFollowing.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogsCompanion(')
          ..write('id: $id, ')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('category: $category, ')
          ..write('likesCount: $likesCount, ')
          ..write('commentsCount: $commentsCount, ')
          ..write('isLiked: $isLiked, ')
          ..write('createdAt: $createdAt, ')
          ..write('username: $username, ')
          ..write('userProfilePic: $userProfilePic, ')
          ..write('isFromFollowing: $isFromFollowing')
          ..write(')'))
        .toString();
  }
}

class $LocalFollowingTable extends LocalFollowing
    with TableInfo<$LocalFollowingTable, LocalFollowingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalFollowingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _followerIdMeta =
      const VerificationMeta('followerId');
  @override
  late final GeneratedColumn<String> followerId = GeneratedColumn<String>(
      'follower_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _followedIdMeta =
      const VerificationMeta('followedId');
  @override
  late final GeneratedColumn<String> followedId = GeneratedColumn<String>(
      'followed_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [followerId, followedId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_following';
  @override
  VerificationContext validateIntegrity(Insertable<LocalFollowingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('follower_id')) {
      context.handle(
          _followerIdMeta,
          followerId.isAcceptableOrUnknown(
              data['follower_id']!, _followerIdMeta));
    } else if (isInserting) {
      context.missing(_followerIdMeta);
    }
    if (data.containsKey('followed_id')) {
      context.handle(
          _followedIdMeta,
          followedId.isAcceptableOrUnknown(
              data['followed_id']!, _followedIdMeta));
    } else if (isInserting) {
      context.missing(_followedIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {followerId, followedId};
  @override
  LocalFollowingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFollowingData(
      followerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}follower_id'])!,
      followedId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}followed_id'])!,
    );
  }

  @override
  $LocalFollowingTable createAlias(String alias) {
    return $LocalFollowingTable(attachedDatabase, alias);
  }
}

class LocalFollowingData extends DataClass
    implements Insertable<LocalFollowingData> {
  final String followerId;
  final String followedId;
  const LocalFollowingData(
      {required this.followerId, required this.followedId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['follower_id'] = Variable<String>(followerId);
    map['followed_id'] = Variable<String>(followedId);
    return map;
  }

  LocalFollowingCompanion toCompanion(bool nullToAbsent) {
    return LocalFollowingCompanion(
      followerId: Value(followerId),
      followedId: Value(followedId),
    );
  }

  factory LocalFollowingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalFollowingData(
      followerId: serializer.fromJson<String>(json['followerId']),
      followedId: serializer.fromJson<String>(json['followedId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'followerId': serializer.toJson<String>(followerId),
      'followedId': serializer.toJson<String>(followedId),
    };
  }

  LocalFollowingData copyWith({String? followerId, String? followedId}) =>
      LocalFollowingData(
        followerId: followerId ?? this.followerId,
        followedId: followedId ?? this.followedId,
      );
  LocalFollowingData copyWithCompanion(LocalFollowingCompanion data) {
    return LocalFollowingData(
      followerId:
          data.followerId.present ? data.followerId.value : this.followerId,
      followedId:
          data.followedId.present ? data.followedId.value : this.followedId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFollowingData(')
          ..write('followerId: $followerId, ')
          ..write('followedId: $followedId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(followerId, followedId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFollowingData &&
          other.followerId == this.followerId &&
          other.followedId == this.followedId);
}

class LocalFollowingCompanion extends UpdateCompanion<LocalFollowingData> {
  final Value<String> followerId;
  final Value<String> followedId;
  final Value<int> rowid;
  const LocalFollowingCompanion({
    this.followerId = const Value.absent(),
    this.followedId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalFollowingCompanion.insert({
    required String followerId,
    required String followedId,
    this.rowid = const Value.absent(),
  })  : followerId = Value(followerId),
        followedId = Value(followedId);
  static Insertable<LocalFollowingData> custom({
    Expression<String>? followerId,
    Expression<String>? followedId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (followerId != null) 'follower_id': followerId,
      if (followedId != null) 'followed_id': followedId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalFollowingCompanion copyWith(
      {Value<String>? followerId,
      Value<String>? followedId,
      Value<int>? rowid}) {
    return LocalFollowingCompanion(
      followerId: followerId ?? this.followerId,
      followedId: followedId ?? this.followedId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (followerId.present) {
      map['follower_id'] = Variable<String>(followerId.value);
    }
    if (followedId.present) {
      map['followed_id'] = Variable<String>(followedId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalFollowingCompanion(')
          ..write('followerId: $followerId, ')
          ..write('followedId: $followedId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalUsersTable localUsers = $LocalUsersTable(this);
  late final $LocalBlogsTable localBlogs = $LocalBlogsTable(this);
  late final $LocalFollowingTable localFollowing = $LocalFollowingTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [localUsers, localBlogs, localFollowing];
}

typedef $$LocalUsersTableCreateCompanionBuilder = LocalUsersCompanion Function({
  required String id,
  required String email,
  required String username,
  Value<String?> fullName,
  Value<String?> bio,
  Value<String?> profilePic,
  Value<String?> coverPhoto,
  required DateTime lastUpdated,
  Value<int> rowid,
});
typedef $$LocalUsersTableUpdateCompanionBuilder = LocalUsersCompanion Function({
  Value<String> id,
  Value<String> email,
  Value<String> username,
  Value<String?> fullName,
  Value<String?> bio,
  Value<String?> profilePic,
  Value<String?> coverPhoto,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

class $$LocalUsersTableFilterComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profilePic => $composableBuilder(
      column: $table.profilePic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverPhoto => $composableBuilder(
      column: $table.coverPhoto, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$LocalUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profilePic => $composableBuilder(
      column: $table.profilePic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverPhoto => $composableBuilder(
      column: $table.coverPhoto, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$LocalUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<String> get profilePic => $composableBuilder(
      column: $table.profilePic, builder: (column) => column);

  GeneratedColumn<String> get coverPhoto => $composableBuilder(
      column: $table.coverPhoto, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$LocalUsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalUsersTable,
    LocalUser,
    $$LocalUsersTableFilterComposer,
    $$LocalUsersTableOrderingComposer,
    $$LocalUsersTableAnnotationComposer,
    $$LocalUsersTableCreateCompanionBuilder,
    $$LocalUsersTableUpdateCompanionBuilder,
    (LocalUser, BaseReferences<_$AppDatabase, $LocalUsersTable, LocalUser>),
    LocalUser,
    PrefetchHooks Function()> {
  $$LocalUsersTableTableManager(_$AppDatabase db, $LocalUsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<String?> bio = const Value.absent(),
            Value<String?> profilePic = const Value.absent(),
            Value<String?> coverPhoto = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalUsersCompanion(
            id: id,
            email: email,
            username: username,
            fullName: fullName,
            bio: bio,
            profilePic: profilePic,
            coverPhoto: coverPhoto,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String email,
            required String username,
            Value<String?> fullName = const Value.absent(),
            Value<String?> bio = const Value.absent(),
            Value<String?> profilePic = const Value.absent(),
            Value<String?> coverPhoto = const Value.absent(),
            required DateTime lastUpdated,
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalUsersCompanion.insert(
            id: id,
            email: email,
            username: username,
            fullName: fullName,
            bio: bio,
            profilePic: profilePic,
            coverPhoto: coverPhoto,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalUsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalUsersTable,
    LocalUser,
    $$LocalUsersTableFilterComposer,
    $$LocalUsersTableOrderingComposer,
    $$LocalUsersTableAnnotationComposer,
    $$LocalUsersTableCreateCompanionBuilder,
    $$LocalUsersTableUpdateCompanionBuilder,
    (LocalUser, BaseReferences<_$AppDatabase, $LocalUsersTable, LocalUser>),
    LocalUser,
    PrefetchHooks Function()>;
typedef $$LocalBlogsTableCreateCompanionBuilder = LocalBlogsCompanion Function({
  Value<int> id,
  required String blogId,
  required String userId,
  required String title,
  required String description,
  Value<String?> image,
  required String category,
  Value<int> likesCount,
  Value<int> commentsCount,
  Value<bool> isLiked,
  required DateTime createdAt,
  required String username,
  Value<String?> userProfilePic,
  Value<bool> isFromFollowing,
});
typedef $$LocalBlogsTableUpdateCompanionBuilder = LocalBlogsCompanion Function({
  Value<int> id,
  Value<String> blogId,
  Value<String> userId,
  Value<String> title,
  Value<String> description,
  Value<String?> image,
  Value<String> category,
  Value<int> likesCount,
  Value<int> commentsCount,
  Value<bool> isLiked,
  Value<DateTime> createdAt,
  Value<String> username,
  Value<String?> userProfilePic,
  Value<bool> isFromFollowing,
});

class $$LocalBlogsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalBlogsTable> {
  $$LocalBlogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get likesCount => $composableBuilder(
      column: $table.likesCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get commentsCount => $composableBuilder(
      column: $table.commentsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLiked => $composableBuilder(
      column: $table.isLiked, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userProfilePic => $composableBuilder(
      column: $table.userProfilePic,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFromFollowing => $composableBuilder(
      column: $table.isFromFollowing,
      builder: (column) => ColumnFilters(column));
}

class $$LocalBlogsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalBlogsTable> {
  $$LocalBlogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get likesCount => $composableBuilder(
      column: $table.likesCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get commentsCount => $composableBuilder(
      column: $table.commentsCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLiked => $composableBuilder(
      column: $table.isLiked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userProfilePic => $composableBuilder(
      column: $table.userProfilePic,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFromFollowing => $composableBuilder(
      column: $table.isFromFollowing,
      builder: (column) => ColumnOrderings(column));
}

class $$LocalBlogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalBlogsTable> {
  $$LocalBlogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get blogId =>
      $composableBuilder(column: $table.blogId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get likesCount => $composableBuilder(
      column: $table.likesCount, builder: (column) => column);

  GeneratedColumn<int> get commentsCount => $composableBuilder(
      column: $table.commentsCount, builder: (column) => column);

  GeneratedColumn<bool> get isLiked =>
      $composableBuilder(column: $table.isLiked, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get userProfilePic => $composableBuilder(
      column: $table.userProfilePic, builder: (column) => column);

  GeneratedColumn<bool> get isFromFollowing => $composableBuilder(
      column: $table.isFromFollowing, builder: (column) => column);
}

class $$LocalBlogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalBlogsTable,
    LocalBlog,
    $$LocalBlogsTableFilterComposer,
    $$LocalBlogsTableOrderingComposer,
    $$LocalBlogsTableAnnotationComposer,
    $$LocalBlogsTableCreateCompanionBuilder,
    $$LocalBlogsTableUpdateCompanionBuilder,
    (LocalBlog, BaseReferences<_$AppDatabase, $LocalBlogsTable, LocalBlog>),
    LocalBlog,
    PrefetchHooks Function()> {
  $$LocalBlogsTableTableManager(_$AppDatabase db, $LocalBlogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalBlogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalBlogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalBlogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> blogId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> likesCount = const Value.absent(),
            Value<int> commentsCount = const Value.absent(),
            Value<bool> isLiked = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String?> userProfilePic = const Value.absent(),
            Value<bool> isFromFollowing = const Value.absent(),
          }) =>
              LocalBlogsCompanion(
            id: id,
            blogId: blogId,
            userId: userId,
            title: title,
            description: description,
            image: image,
            category: category,
            likesCount: likesCount,
            commentsCount: commentsCount,
            isLiked: isLiked,
            createdAt: createdAt,
            username: username,
            userProfilePic: userProfilePic,
            isFromFollowing: isFromFollowing,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String blogId,
            required String userId,
            required String title,
            required String description,
            Value<String?> image = const Value.absent(),
            required String category,
            Value<int> likesCount = const Value.absent(),
            Value<int> commentsCount = const Value.absent(),
            Value<bool> isLiked = const Value.absent(),
            required DateTime createdAt,
            required String username,
            Value<String?> userProfilePic = const Value.absent(),
            Value<bool> isFromFollowing = const Value.absent(),
          }) =>
              LocalBlogsCompanion.insert(
            id: id,
            blogId: blogId,
            userId: userId,
            title: title,
            description: description,
            image: image,
            category: category,
            likesCount: likesCount,
            commentsCount: commentsCount,
            isLiked: isLiked,
            createdAt: createdAt,
            username: username,
            userProfilePic: userProfilePic,
            isFromFollowing: isFromFollowing,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalBlogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalBlogsTable,
    LocalBlog,
    $$LocalBlogsTableFilterComposer,
    $$LocalBlogsTableOrderingComposer,
    $$LocalBlogsTableAnnotationComposer,
    $$LocalBlogsTableCreateCompanionBuilder,
    $$LocalBlogsTableUpdateCompanionBuilder,
    (LocalBlog, BaseReferences<_$AppDatabase, $LocalBlogsTable, LocalBlog>),
    LocalBlog,
    PrefetchHooks Function()>;
typedef $$LocalFollowingTableCreateCompanionBuilder = LocalFollowingCompanion
    Function({
  required String followerId,
  required String followedId,
  Value<int> rowid,
});
typedef $$LocalFollowingTableUpdateCompanionBuilder = LocalFollowingCompanion
    Function({
  Value<String> followerId,
  Value<String> followedId,
  Value<int> rowid,
});

class $$LocalFollowingTableFilterComposer
    extends Composer<_$AppDatabase, $LocalFollowingTable> {
  $$LocalFollowingTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get followerId => $composableBuilder(
      column: $table.followerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get followedId => $composableBuilder(
      column: $table.followedId, builder: (column) => ColumnFilters(column));
}

class $$LocalFollowingTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalFollowingTable> {
  $$LocalFollowingTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get followerId => $composableBuilder(
      column: $table.followerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get followedId => $composableBuilder(
      column: $table.followedId, builder: (column) => ColumnOrderings(column));
}

class $$LocalFollowingTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalFollowingTable> {
  $$LocalFollowingTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get followerId => $composableBuilder(
      column: $table.followerId, builder: (column) => column);

  GeneratedColumn<String> get followedId => $composableBuilder(
      column: $table.followedId, builder: (column) => column);
}

class $$LocalFollowingTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalFollowingTable,
    LocalFollowingData,
    $$LocalFollowingTableFilterComposer,
    $$LocalFollowingTableOrderingComposer,
    $$LocalFollowingTableAnnotationComposer,
    $$LocalFollowingTableCreateCompanionBuilder,
    $$LocalFollowingTableUpdateCompanionBuilder,
    (
      LocalFollowingData,
      BaseReferences<_$AppDatabase, $LocalFollowingTable, LocalFollowingData>
    ),
    LocalFollowingData,
    PrefetchHooks Function()> {
  $$LocalFollowingTableTableManager(
      _$AppDatabase db, $LocalFollowingTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalFollowingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalFollowingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalFollowingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> followerId = const Value.absent(),
            Value<String> followedId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalFollowingCompanion(
            followerId: followerId,
            followedId: followedId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String followerId,
            required String followedId,
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalFollowingCompanion.insert(
            followerId: followerId,
            followedId: followedId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalFollowingTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalFollowingTable,
    LocalFollowingData,
    $$LocalFollowingTableFilterComposer,
    $$LocalFollowingTableOrderingComposer,
    $$LocalFollowingTableAnnotationComposer,
    $$LocalFollowingTableCreateCompanionBuilder,
    $$LocalFollowingTableUpdateCompanionBuilder,
    (
      LocalFollowingData,
      BaseReferences<_$AppDatabase, $LocalFollowingTable, LocalFollowingData>
    ),
    LocalFollowingData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalUsersTableTableManager get localUsers =>
      $$LocalUsersTableTableManager(_db, _db.localUsers);
  $$LocalBlogsTableTableManager get localBlogs =>
      $$LocalBlogsTableTableManager(_db, _db.localBlogs);
  $$LocalFollowingTableTableManager get localFollowing =>
      $$LocalFollowingTableTableManager(_db, _db.localFollowing);
}
