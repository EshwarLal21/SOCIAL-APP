// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalUsersTable extends LocalUsers
    with drift.TableInfo<$LocalUsersTable, LocalUser> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalUsersTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _usernameMeta =
      const drift.VerificationMeta('username');
  @override
  late final drift.GeneratedColumn<String> username =
      drift.GeneratedColumn<String>('username', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _emailMeta =
      const drift.VerificationMeta('email');
  @override
  late final drift.GeneratedColumn<String> email =
      drift.GeneratedColumn<String>('email', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _bioMeta =
      const drift.VerificationMeta('bio');
  @override
  late final drift.GeneratedColumn<String> bio = drift.GeneratedColumn<String>(
      'bio', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _locationMeta =
      const drift.VerificationMeta('location');
  @override
  late final drift.GeneratedColumn<String> location =
      drift.GeneratedColumn<String>('location', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _profilepicMeta =
      const drift.VerificationMeta('profilepic');
  @override
  late final drift.GeneratedColumn<String> profilepic =
      drift.GeneratedColumn<String>('profilepic', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _bannerMeta =
      const drift.VerificationMeta('banner');
  @override
  late final drift.GeneratedColumn<String> banner =
      drift.GeneratedColumn<String>('banner', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('guest'));
  static const drift.VerificationMeta _usertypeMeta =
      const drift.VerificationMeta('usertype');
  @override
  late final drift.GeneratedColumn<String> usertype =
      drift.GeneratedColumn<String>('usertype', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('guest'));
  static const drift.VerificationMeta _followingMeta =
      const drift.VerificationMeta('following');
  @override
  late final drift.GeneratedColumn<int> following = drift.GeneratedColumn<int>(
      'following', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const drift.Constant(1));
  static const drift.VerificationMeta _followersMeta =
      const drift.VerificationMeta('followers');
  @override
  late final drift.GeneratedColumn<int> followers = drift.GeneratedColumn<int>(
      'followers', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const drift.Constant(0));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const drift.VerificationMeta _themeModeMeta =
      const drift.VerificationMeta('themeMode');
  @override
  late final drift.GeneratedColumn<String> themeMode =
      drift.GeneratedColumn<String>('theme_mode', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('system'));
  static const drift.VerificationMeta _notificationsEnabledMeta =
      const drift.VerificationMeta('notificationsEnabled');
  @override
  late final drift.GeneratedColumn<bool> notificationsEnabled =
      drift.GeneratedColumn<bool>('notifications_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("notifications_enabled" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _creditsMeta =
      const drift.VerificationMeta('credits');
  @override
  late final drift.GeneratedColumn<int> credits = drift.GeneratedColumn<int>(
      'credits', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const drift.Constant(0));
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        username,
        email,
        bio,
        location,
        profilepic,
        banner,
        usertype,
        following,
        followers,
        createdAt,
        themeMode,
        notificationsEnabled,
        credits
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_users';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalUser> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('profilepic')) {
      context.handle(
          _profilepicMeta,
          profilepic.isAcceptableOrUnknown(
              data['profilepic']!, _profilepicMeta));
    }
    if (data.containsKey('banner')) {
      context.handle(_bannerMeta,
          banner.isAcceptableOrUnknown(data['banner']!, _bannerMeta));
    }
    if (data.containsKey('usertype')) {
      context.handle(_usertypeMeta,
          usertype.isAcceptableOrUnknown(data['usertype']!, _usertypeMeta));
    }
    if (data.containsKey('following')) {
      context.handle(_followingMeta,
          following.isAcceptableOrUnknown(data['following']!, _followingMeta));
    }
    if (data.containsKey('followers')) {
      context.handle(_followersMeta,
          followers.isAcceptableOrUnknown(data['followers']!, _followersMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
          _notificationsEnabledMeta,
          notificationsEnabled.isAcceptableOrUnknown(
              data['notifications_enabled']!, _notificationsEnabledMeta));
    }
    if (data.containsKey('credits')) {
      context.handle(_creditsMeta,
          credits.isAcceptableOrUnknown(data['credits']!, _creditsMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalUser(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      bio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bio']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      profilepic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profilepic']),
      banner: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}banner'])!,
      usertype: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}usertype'])!,
      following: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}following'])!,
      followers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}followers'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_mode'])!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}notifications_enabled'])!,
      credits: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}credits'])!,
    );
  }

  @override
  $LocalUsersTable createAlias(String alias) {
    return $LocalUsersTable(attachedDatabase, alias);
  }
}

class LocalUser extends drift.DataClass implements drift.Insertable<LocalUser> {
  final String id;
  final String username;
  final String email;
  final String? bio;
  final String? location;
  final String? profilepic;
  final String banner;
  final String usertype;
  final int following;
  final int followers;
  final DateTime? createdAt;
  final String themeMode;
  final bool notificationsEnabled;
  final int credits;
  const LocalUser(
      {required this.id,
      required this.username,
      required this.email,
      this.bio,
      this.location,
      this.profilepic,
      required this.banner,
      required this.usertype,
      required this.following,
      required this.followers,
      this.createdAt,
      required this.themeMode,
      required this.notificationsEnabled,
      required this.credits});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['username'] = drift.Variable<String>(username);
    map['email'] = drift.Variable<String>(email);
    if (!nullToAbsent || bio != null) {
      map['bio'] = drift.Variable<String>(bio);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = drift.Variable<String>(location);
    }
    if (!nullToAbsent || profilepic != null) {
      map['profilepic'] = drift.Variable<String>(profilepic);
    }
    map['banner'] = drift.Variable<String>(banner);
    map['usertype'] = drift.Variable<String>(usertype);
    map['following'] = drift.Variable<int>(following);
    map['followers'] = drift.Variable<int>(followers);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = drift.Variable<DateTime>(createdAt);
    }
    map['theme_mode'] = drift.Variable<String>(themeMode);
    map['notifications_enabled'] = drift.Variable<bool>(notificationsEnabled);
    map['credits'] = drift.Variable<int>(credits);
    return map;
  }

  LocalUsersCompanion toCompanion(bool nullToAbsent) {
    return LocalUsersCompanion(
      id: drift.Value(id),
      username: drift.Value(username),
      email: drift.Value(email),
      bio: bio == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(bio),
      location: location == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(location),
      profilepic: profilepic == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(profilepic),
      banner: drift.Value(banner),
      usertype: drift.Value(usertype),
      following: drift.Value(following),
      followers: drift.Value(followers),
      createdAt: createdAt == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(createdAt),
      themeMode: drift.Value(themeMode),
      notificationsEnabled: drift.Value(notificationsEnabled),
      credits: drift.Value(credits),
    );
  }

  factory LocalUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalUser(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      bio: serializer.fromJson<String?>(json['bio']),
      location: serializer.fromJson<String?>(json['location']),
      profilepic: serializer.fromJson<String?>(json['profilepic']),
      banner: serializer.fromJson<String>(json['banner']),
      usertype: serializer.fromJson<String>(json['usertype']),
      following: serializer.fromJson<int>(json['following']),
      followers: serializer.fromJson<int>(json['followers']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      notificationsEnabled:
          serializer.fromJson<bool>(json['notificationsEnabled']),
      credits: serializer.fromJson<int>(json['credits']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'bio': serializer.toJson<String?>(bio),
      'location': serializer.toJson<String?>(location),
      'profilepic': serializer.toJson<String?>(profilepic),
      'banner': serializer.toJson<String>(banner),
      'usertype': serializer.toJson<String>(usertype),
      'following': serializer.toJson<int>(following),
      'followers': serializer.toJson<int>(followers),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'themeMode': serializer.toJson<String>(themeMode),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'credits': serializer.toJson<int>(credits),
    };
  }

  LocalUser copyWith(
          {String? id,
          String? username,
          String? email,
          drift.Value<String?> bio = const drift.Value.absent(),
          drift.Value<String?> location = const drift.Value.absent(),
          drift.Value<String?> profilepic = const drift.Value.absent(),
          String? banner,
          String? usertype,
          int? following,
          int? followers,
          drift.Value<DateTime?> createdAt = const drift.Value.absent(),
          String? themeMode,
          bool? notificationsEnabled,
          int? credits}) =>
      LocalUser(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        bio: bio.present ? bio.value : this.bio,
        location: location.present ? location.value : this.location,
        profilepic: profilepic.present ? profilepic.value : this.profilepic,
        banner: banner ?? this.banner,
        usertype: usertype ?? this.usertype,
        following: following ?? this.following,
        followers: followers ?? this.followers,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        themeMode: themeMode ?? this.themeMode,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        credits: credits ?? this.credits,
      );
  LocalUser copyWithCompanion(LocalUsersCompanion data) {
    return LocalUser(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      bio: data.bio.present ? data.bio.value : this.bio,
      location: data.location.present ? data.location.value : this.location,
      profilepic:
          data.profilepic.present ? data.profilepic.value : this.profilepic,
      banner: data.banner.present ? data.banner.value : this.banner,
      usertype: data.usertype.present ? data.usertype.value : this.usertype,
      following: data.following.present ? data.following.value : this.following,
      followers: data.followers.present ? data.followers.value : this.followers,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      credits: data.credits.present ? data.credits.value : this.credits,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalUser(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('bio: $bio, ')
          ..write('location: $location, ')
          ..write('profilepic: $profilepic, ')
          ..write('banner: $banner, ')
          ..write('usertype: $usertype, ')
          ..write('following: $following, ')
          ..write('followers: $followers, ')
          ..write('createdAt: $createdAt, ')
          ..write('themeMode: $themeMode, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('credits: $credits')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      username,
      email,
      bio,
      location,
      profilepic,
      banner,
      usertype,
      following,
      followers,
      createdAt,
      themeMode,
      notificationsEnabled,
      credits);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalUser &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.bio == this.bio &&
          other.location == this.location &&
          other.profilepic == this.profilepic &&
          other.banner == this.banner &&
          other.usertype == this.usertype &&
          other.following == this.following &&
          other.followers == this.followers &&
          other.createdAt == this.createdAt &&
          other.themeMode == this.themeMode &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.credits == this.credits);
}

class LocalUsersCompanion extends drift.UpdateCompanion<LocalUser> {
  final drift.Value<String> id;
  final drift.Value<String> username;
  final drift.Value<String> email;
  final drift.Value<String?> bio;
  final drift.Value<String?> location;
  final drift.Value<String?> profilepic;
  final drift.Value<String> banner;
  final drift.Value<String> usertype;
  final drift.Value<int> following;
  final drift.Value<int> followers;
  final drift.Value<DateTime?> createdAt;
  final drift.Value<String> themeMode;
  final drift.Value<bool> notificationsEnabled;
  final drift.Value<int> credits;
  final drift.Value<int> rowid;
  const LocalUsersCompanion({
    this.id = const drift.Value.absent(),
    this.username = const drift.Value.absent(),
    this.email = const drift.Value.absent(),
    this.bio = const drift.Value.absent(),
    this.location = const drift.Value.absent(),
    this.profilepic = const drift.Value.absent(),
    this.banner = const drift.Value.absent(),
    this.usertype = const drift.Value.absent(),
    this.following = const drift.Value.absent(),
    this.followers = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.themeMode = const drift.Value.absent(),
    this.notificationsEnabled = const drift.Value.absent(),
    this.credits = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalUsersCompanion.insert({
    required String id,
    required String username,
    required String email,
    this.bio = const drift.Value.absent(),
    this.location = const drift.Value.absent(),
    this.profilepic = const drift.Value.absent(),
    this.banner = const drift.Value.absent(),
    this.usertype = const drift.Value.absent(),
    this.following = const drift.Value.absent(),
    this.followers = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.themeMode = const drift.Value.absent(),
    this.notificationsEnabled = const drift.Value.absent(),
    this.credits = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        username = drift.Value(username),
        email = drift.Value(email);
  static drift.Insertable<LocalUser> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? username,
    drift.Expression<String>? email,
    drift.Expression<String>? bio,
    drift.Expression<String>? location,
    drift.Expression<String>? profilepic,
    drift.Expression<String>? banner,
    drift.Expression<String>? usertype,
    drift.Expression<int>? following,
    drift.Expression<int>? followers,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<String>? themeMode,
    drift.Expression<bool>? notificationsEnabled,
    drift.Expression<int>? credits,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (bio != null) 'bio': bio,
      if (location != null) 'location': location,
      if (profilepic != null) 'profilepic': profilepic,
      if (banner != null) 'banner': banner,
      if (usertype != null) 'usertype': usertype,
      if (following != null) 'following': following,
      if (followers != null) 'followers': followers,
      if (createdAt != null) 'created_at': createdAt,
      if (themeMode != null) 'theme_mode': themeMode,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (credits != null) 'credits': credits,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalUsersCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? username,
      drift.Value<String>? email,
      drift.Value<String?>? bio,
      drift.Value<String?>? location,
      drift.Value<String?>? profilepic,
      drift.Value<String>? banner,
      drift.Value<String>? usertype,
      drift.Value<int>? following,
      drift.Value<int>? followers,
      drift.Value<DateTime?>? createdAt,
      drift.Value<String>? themeMode,
      drift.Value<bool>? notificationsEnabled,
      drift.Value<int>? credits,
      drift.Value<int>? rowid}) {
    return LocalUsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      profilepic: profilepic ?? this.profilepic,
      banner: banner ?? this.banner,
      usertype: usertype ?? this.usertype,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      createdAt: createdAt ?? this.createdAt,
      themeMode: themeMode ?? this.themeMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      credits: credits ?? this.credits,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = drift.Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = drift.Variable<String>(email.value);
    }
    if (bio.present) {
      map['bio'] = drift.Variable<String>(bio.value);
    }
    if (location.present) {
      map['location'] = drift.Variable<String>(location.value);
    }
    if (profilepic.present) {
      map['profilepic'] = drift.Variable<String>(profilepic.value);
    }
    if (banner.present) {
      map['banner'] = drift.Variable<String>(banner.value);
    }
    if (usertype.present) {
      map['usertype'] = drift.Variable<String>(usertype.value);
    }
    if (following.present) {
      map['following'] = drift.Variable<int>(following.value);
    }
    if (followers.present) {
      map['followers'] = drift.Variable<int>(followers.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = drift.Variable<String>(themeMode.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] =
          drift.Variable<bool>(notificationsEnabled.value);
    }
    if (credits.present) {
      map['credits'] = drift.Variable<int>(credits.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalUsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('bio: $bio, ')
          ..write('location: $location, ')
          ..write('profilepic: $profilepic, ')
          ..write('banner: $banner, ')
          ..write('usertype: $usertype, ')
          ..write('following: $following, ')
          ..write('followers: $followers, ')
          ..write('createdAt: $createdAt, ')
          ..write('themeMode: $themeMode, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('credits: $credits, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalChangesTable extends LocalChanges
    with drift.TableInfo<$LocalChangesTable, LocalChange> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalChangesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _actionMeta =
      const drift.VerificationMeta('action');
  @override
  late final drift.GeneratedColumn<String> action =
      drift.GeneratedColumn<String>('action', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _payloadMeta =
      const drift.VerificationMeta('payload');
  @override
  late final drift.GeneratedColumn<String> payload =
      drift.GeneratedColumn<String>('payload', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns => [id, action, payload, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_changes';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalChange> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalChange map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalChange(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalChangesTable createAlias(String alias) {
    return $LocalChangesTable(attachedDatabase, alias);
  }
}

class LocalChange extends drift.DataClass
    implements drift.Insertable<LocalChange> {
  final String id;
  final String action;
  final String payload;
  final DateTime createdAt;
  const LocalChange(
      {required this.id,
      required this.action,
      required this.payload,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['action'] = drift.Variable<String>(action);
    map['payload'] = drift.Variable<String>(payload);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalChangesCompanion toCompanion(bool nullToAbsent) {
    return LocalChangesCompanion(
      id: drift.Value(id),
      action: drift.Value(action),
      payload: drift.Value(payload),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalChange.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalChange(
      id: serializer.fromJson<String>(json['id']),
      action: serializer.fromJson<String>(json['action']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'action': serializer.toJson<String>(action),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalChange copyWith(
          {String? id, String? action, String? payload, DateTime? createdAt}) =>
      LocalChange(
        id: id ?? this.id,
        action: action ?? this.action,
        payload: payload ?? this.payload,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalChange copyWithCompanion(LocalChangesCompanion data) {
    return LocalChange(
      id: data.id.present ? data.id.value : this.id,
      action: data.action.present ? data.action.value : this.action,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalChange(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, action, payload, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalChange &&
          other.id == this.id &&
          other.action == this.action &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt);
}

class LocalChangesCompanion extends drift.UpdateCompanion<LocalChange> {
  final drift.Value<String> id;
  final drift.Value<String> action;
  final drift.Value<String> payload;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalChangesCompanion({
    this.id = const drift.Value.absent(),
    this.action = const drift.Value.absent(),
    this.payload = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalChangesCompanion.insert({
    required String id,
    required String action,
    required String payload,
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        action = drift.Value(action),
        payload = drift.Value(payload);
  static drift.Insertable<LocalChange> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? action,
    drift.Expression<String>? payload,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (action != null) 'action': action,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalChangesCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? action,
      drift.Value<String>? payload,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalChangesCompanion(
      id: id ?? this.id,
      action: action ?? this.action,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (action.present) {
      map['action'] = drift.Variable<String>(action.value);
    }
    if (payload.present) {
      map['payload'] = drift.Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalChangesCompanion(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalUpgradeRequestsTable extends LocalUpgradeRequests
    with drift.TableInfo<$LocalUpgradeRequestsTable, LocalUpgradeRequest> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalUpgradeRequestsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _businessIdMeta =
      const drift.VerificationMeta('businessId');
  @override
  late final drift.GeneratedColumn<String> businessId =
      drift.GeneratedColumn<String>('business_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _statusMeta =
      const drift.VerificationMeta('status');
  @override
  late final drift.GeneratedColumn<String> status =
      drift.GeneratedColumn<String>('status', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('pending'));
  static const drift.VerificationMeta _requestedTypeMeta =
      const drift.VerificationMeta('requestedType');
  @override
  late final drift.GeneratedColumn<String> requestedType =
      drift.GeneratedColumn<String>('requested_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  static const drift.VerificationMeta _reviewedAtMeta =
      const drift.VerificationMeta('reviewedAt');
  @override
  late final drift.GeneratedColumn<DateTime> reviewedAt =
      drift.GeneratedColumn<DateTime>('reviewed_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const drift.VerificationMeta _reviewedByMeta =
      const drift.VerificationMeta('reviewedBy');
  @override
  late final drift.GeneratedColumn<String> reviewedBy =
      drift.GeneratedColumn<String>('reviewed_by', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _rejectionReasonMeta =
      const drift.VerificationMeta('rejectionReason');
  @override
  late final drift.GeneratedColumn<String> rejectionReason =
      drift.GeneratedColumn<String>('rejection_reason', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _fileUrlsMeta =
      const drift.VerificationMeta('fileUrls');
  @override
  late final drift.GeneratedColumn<String> fileUrls =
      drift.GeneratedColumn<String>('file_urls', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('[]'));
  static const drift.VerificationMeta _requestedValueMeta =
      const drift.VerificationMeta('requestedValue');
  @override
  late final drift.GeneratedColumn<String> requestedValue =
      drift.GeneratedColumn<String>('requested_value', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        userId,
        businessId,
        status,
        requestedType,
        createdAt,
        reviewedAt,
        reviewedBy,
        rejectionReason,
        fileUrls,
        requestedValue
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_upgrade_requests';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalUpgradeRequest> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('business_id')) {
      context.handle(
          _businessIdMeta,
          businessId.isAcceptableOrUnknown(
              data['business_id']!, _businessIdMeta));
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('requested_type')) {
      context.handle(
          _requestedTypeMeta,
          requestedType.isAcceptableOrUnknown(
              data['requested_type']!, _requestedTypeMeta));
    } else if (isInserting) {
      context.missing(_requestedTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('reviewed_at')) {
      context.handle(
          _reviewedAtMeta,
          reviewedAt.isAcceptableOrUnknown(
              data['reviewed_at']!, _reviewedAtMeta));
    }
    if (data.containsKey('reviewed_by')) {
      context.handle(
          _reviewedByMeta,
          reviewedBy.isAcceptableOrUnknown(
              data['reviewed_by']!, _reviewedByMeta));
    }
    if (data.containsKey('rejection_reason')) {
      context.handle(
          _rejectionReasonMeta,
          rejectionReason.isAcceptableOrUnknown(
              data['rejection_reason']!, _rejectionReasonMeta));
    }
    if (data.containsKey('file_urls')) {
      context.handle(_fileUrlsMeta,
          fileUrls.isAcceptableOrUnknown(data['file_urls']!, _fileUrlsMeta));
    }
    if (data.containsKey('requested_value')) {
      context.handle(
          _requestedValueMeta,
          requestedValue.isAcceptableOrUnknown(
              data['requested_value']!, _requestedValueMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalUpgradeRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalUpgradeRequest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      businessId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      requestedType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}requested_type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      reviewedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}reviewed_at']),
      reviewedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reviewed_by']),
      rejectionReason: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}rejection_reason']),
      fileUrls: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_urls'])!,
      requestedValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}requested_value']),
    );
  }

  @override
  $LocalUpgradeRequestsTable createAlias(String alias) {
    return $LocalUpgradeRequestsTable(attachedDatabase, alias);
  }
}

class LocalUpgradeRequest extends drift.DataClass
    implements drift.Insertable<LocalUpgradeRequest> {
  final String id;
  final String userId;
  final String businessId;
  final String status;
  final String requestedType;
  final DateTime createdAt;
  final DateTime? reviewedAt;
  final String? reviewedBy;
  final String? rejectionReason;
  final String fileUrls;
  final String? requestedValue;
  const LocalUpgradeRequest(
      {required this.id,
      required this.userId,
      required this.businessId,
      required this.status,
      required this.requestedType,
      required this.createdAt,
      this.reviewedAt,
      this.reviewedBy,
      this.rejectionReason,
      required this.fileUrls,
      this.requestedValue});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['user_id'] = drift.Variable<String>(userId);
    map['business_id'] = drift.Variable<String>(businessId);
    map['status'] = drift.Variable<String>(status);
    map['requested_type'] = drift.Variable<String>(requestedType);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    if (!nullToAbsent || reviewedAt != null) {
      map['reviewed_at'] = drift.Variable<DateTime>(reviewedAt);
    }
    if (!nullToAbsent || reviewedBy != null) {
      map['reviewed_by'] = drift.Variable<String>(reviewedBy);
    }
    if (!nullToAbsent || rejectionReason != null) {
      map['rejection_reason'] = drift.Variable<String>(rejectionReason);
    }
    map['file_urls'] = drift.Variable<String>(fileUrls);
    if (!nullToAbsent || requestedValue != null) {
      map['requested_value'] = drift.Variable<String>(requestedValue);
    }
    return map;
  }

  LocalUpgradeRequestsCompanion toCompanion(bool nullToAbsent) {
    return LocalUpgradeRequestsCompanion(
      id: drift.Value(id),
      userId: drift.Value(userId),
      businessId: drift.Value(businessId),
      status: drift.Value(status),
      requestedType: drift.Value(requestedType),
      createdAt: drift.Value(createdAt),
      reviewedAt: reviewedAt == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(reviewedAt),
      reviewedBy: reviewedBy == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(reviewedBy),
      rejectionReason: rejectionReason == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(rejectionReason),
      fileUrls: drift.Value(fileUrls),
      requestedValue: requestedValue == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(requestedValue),
    );
  }

  factory LocalUpgradeRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalUpgradeRequest(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      businessId: serializer.fromJson<String>(json['businessId']),
      status: serializer.fromJson<String>(json['status']),
      requestedType: serializer.fromJson<String>(json['requestedType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      reviewedAt: serializer.fromJson<DateTime?>(json['reviewedAt']),
      reviewedBy: serializer.fromJson<String?>(json['reviewedBy']),
      rejectionReason: serializer.fromJson<String?>(json['rejectionReason']),
      fileUrls: serializer.fromJson<String>(json['fileUrls']),
      requestedValue: serializer.fromJson<String?>(json['requestedValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'businessId': serializer.toJson<String>(businessId),
      'status': serializer.toJson<String>(status),
      'requestedType': serializer.toJson<String>(requestedType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'reviewedAt': serializer.toJson<DateTime?>(reviewedAt),
      'reviewedBy': serializer.toJson<String?>(reviewedBy),
      'rejectionReason': serializer.toJson<String?>(rejectionReason),
      'fileUrls': serializer.toJson<String>(fileUrls),
      'requestedValue': serializer.toJson<String?>(requestedValue),
    };
  }

  LocalUpgradeRequest copyWith(
          {String? id,
          String? userId,
          String? businessId,
          String? status,
          String? requestedType,
          DateTime? createdAt,
          drift.Value<DateTime?> reviewedAt = const drift.Value.absent(),
          drift.Value<String?> reviewedBy = const drift.Value.absent(),
          drift.Value<String?> rejectionReason = const drift.Value.absent(),
          String? fileUrls,
          drift.Value<String?> requestedValue = const drift.Value.absent()}) =>
      LocalUpgradeRequest(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        businessId: businessId ?? this.businessId,
        status: status ?? this.status,
        requestedType: requestedType ?? this.requestedType,
        createdAt: createdAt ?? this.createdAt,
        reviewedAt: reviewedAt.present ? reviewedAt.value : this.reviewedAt,
        reviewedBy: reviewedBy.present ? reviewedBy.value : this.reviewedBy,
        rejectionReason: rejectionReason.present
            ? rejectionReason.value
            : this.rejectionReason,
        fileUrls: fileUrls ?? this.fileUrls,
        requestedValue:
            requestedValue.present ? requestedValue.value : this.requestedValue,
      );
  LocalUpgradeRequest copyWithCompanion(LocalUpgradeRequestsCompanion data) {
    return LocalUpgradeRequest(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      businessId:
          data.businessId.present ? data.businessId.value : this.businessId,
      status: data.status.present ? data.status.value : this.status,
      requestedType: data.requestedType.present
          ? data.requestedType.value
          : this.requestedType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      reviewedAt:
          data.reviewedAt.present ? data.reviewedAt.value : this.reviewedAt,
      reviewedBy:
          data.reviewedBy.present ? data.reviewedBy.value : this.reviewedBy,
      rejectionReason: data.rejectionReason.present
          ? data.rejectionReason.value
          : this.rejectionReason,
      fileUrls: data.fileUrls.present ? data.fileUrls.value : this.fileUrls,
      requestedValue: data.requestedValue.present
          ? data.requestedValue.value
          : this.requestedValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalUpgradeRequest(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('businessId: $businessId, ')
          ..write('status: $status, ')
          ..write('requestedType: $requestedType, ')
          ..write('createdAt: $createdAt, ')
          ..write('reviewedAt: $reviewedAt, ')
          ..write('reviewedBy: $reviewedBy, ')
          ..write('rejectionReason: $rejectionReason, ')
          ..write('fileUrls: $fileUrls, ')
          ..write('requestedValue: $requestedValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      businessId,
      status,
      requestedType,
      createdAt,
      reviewedAt,
      reviewedBy,
      rejectionReason,
      fileUrls,
      requestedValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalUpgradeRequest &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.businessId == this.businessId &&
          other.status == this.status &&
          other.requestedType == this.requestedType &&
          other.createdAt == this.createdAt &&
          other.reviewedAt == this.reviewedAt &&
          other.reviewedBy == this.reviewedBy &&
          other.rejectionReason == this.rejectionReason &&
          other.fileUrls == this.fileUrls &&
          other.requestedValue == this.requestedValue);
}

class LocalUpgradeRequestsCompanion
    extends drift.UpdateCompanion<LocalUpgradeRequest> {
  final drift.Value<String> id;
  final drift.Value<String> userId;
  final drift.Value<String> businessId;
  final drift.Value<String> status;
  final drift.Value<String> requestedType;
  final drift.Value<DateTime> createdAt;
  final drift.Value<DateTime?> reviewedAt;
  final drift.Value<String?> reviewedBy;
  final drift.Value<String?> rejectionReason;
  final drift.Value<String> fileUrls;
  final drift.Value<String?> requestedValue;
  final drift.Value<int> rowid;
  const LocalUpgradeRequestsCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.businessId = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
    this.requestedType = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.reviewedAt = const drift.Value.absent(),
    this.reviewedBy = const drift.Value.absent(),
    this.rejectionReason = const drift.Value.absent(),
    this.fileUrls = const drift.Value.absent(),
    this.requestedValue = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalUpgradeRequestsCompanion.insert({
    this.id = const drift.Value.absent(),
    required String userId,
    required String businessId,
    this.status = const drift.Value.absent(),
    required String requestedType,
    this.createdAt = const drift.Value.absent(),
    this.reviewedAt = const drift.Value.absent(),
    this.reviewedBy = const drift.Value.absent(),
    this.rejectionReason = const drift.Value.absent(),
    this.fileUrls = const drift.Value.absent(),
    this.requestedValue = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : userId = drift.Value(userId),
        businessId = drift.Value(businessId),
        requestedType = drift.Value(requestedType);
  static drift.Insertable<LocalUpgradeRequest> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<String>? businessId,
    drift.Expression<String>? status,
    drift.Expression<String>? requestedType,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<DateTime>? reviewedAt,
    drift.Expression<String>? reviewedBy,
    drift.Expression<String>? rejectionReason,
    drift.Expression<String>? fileUrls,
    drift.Expression<String>? requestedValue,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (businessId != null) 'business_id': businessId,
      if (status != null) 'status': status,
      if (requestedType != null) 'requested_type': requestedType,
      if (createdAt != null) 'created_at': createdAt,
      if (reviewedAt != null) 'reviewed_at': reviewedAt,
      if (reviewedBy != null) 'reviewed_by': reviewedBy,
      if (rejectionReason != null) 'rejection_reason': rejectionReason,
      if (fileUrls != null) 'file_urls': fileUrls,
      if (requestedValue != null) 'requested_value': requestedValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalUpgradeRequestsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? userId,
      drift.Value<String>? businessId,
      drift.Value<String>? status,
      drift.Value<String>? requestedType,
      drift.Value<DateTime>? createdAt,
      drift.Value<DateTime?>? reviewedAt,
      drift.Value<String?>? reviewedBy,
      drift.Value<String?>? rejectionReason,
      drift.Value<String>? fileUrls,
      drift.Value<String?>? requestedValue,
      drift.Value<int>? rowid}) {
    return LocalUpgradeRequestsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      businessId: businessId ?? this.businessId,
      status: status ?? this.status,
      requestedType: requestedType ?? this.requestedType,
      createdAt: createdAt ?? this.createdAt,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      reviewedBy: reviewedBy ?? this.reviewedBy,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      fileUrls: fileUrls ?? this.fileUrls,
      requestedValue: requestedValue ?? this.requestedValue,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (businessId.present) {
      map['business_id'] = drift.Variable<String>(businessId.value);
    }
    if (status.present) {
      map['status'] = drift.Variable<String>(status.value);
    }
    if (requestedType.present) {
      map['requested_type'] = drift.Variable<String>(requestedType.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (reviewedAt.present) {
      map['reviewed_at'] = drift.Variable<DateTime>(reviewedAt.value);
    }
    if (reviewedBy.present) {
      map['reviewed_by'] = drift.Variable<String>(reviewedBy.value);
    }
    if (rejectionReason.present) {
      map['rejection_reason'] = drift.Variable<String>(rejectionReason.value);
    }
    if (fileUrls.present) {
      map['file_urls'] = drift.Variable<String>(fileUrls.value);
    }
    if (requestedValue.present) {
      map['requested_value'] = drift.Variable<String>(requestedValue.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalUpgradeRequestsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('businessId: $businessId, ')
          ..write('status: $status, ')
          ..write('requestedType: $requestedType, ')
          ..write('createdAt: $createdAt, ')
          ..write('reviewedAt: $reviewedAt, ')
          ..write('reviewedBy: $reviewedBy, ')
          ..write('rejectionReason: $rejectionReason, ')
          ..write('fileUrls: $fileUrls, ')
          ..write('requestedValue: $requestedValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalNotificationsTable extends LocalNotifications
    with drift.TableInfo<$LocalNotificationsTable, LocalNotification> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalNotificationsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _messageMeta =
      const drift.VerificationMeta('message');
  @override
  late final drift.GeneratedColumn<String> message =
      drift.GeneratedColumn<String>('message', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _isReadMeta =
      const drift.VerificationMeta('isRead');
  @override
  late final drift.GeneratedColumn<bool> isRead = drift.GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, userId, message, isRead, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_notifications';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalNotification> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalNotification(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalNotificationsTable createAlias(String alias) {
    return $LocalNotificationsTable(attachedDatabase, alias);
  }
}

class LocalNotification extends drift.DataClass
    implements drift.Insertable<LocalNotification> {
  final String id;
  final String userId;
  final String message;
  final bool isRead;
  final DateTime createdAt;
  const LocalNotification(
      {required this.id,
      required this.userId,
      required this.message,
      required this.isRead,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['user_id'] = drift.Variable<String>(userId);
    map['message'] = drift.Variable<String>(message);
    map['is_read'] = drift.Variable<bool>(isRead);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalNotificationsCompanion toCompanion(bool nullToAbsent) {
    return LocalNotificationsCompanion(
      id: drift.Value(id),
      userId: drift.Value(userId),
      message: drift.Value(message),
      isRead: drift.Value(isRead),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalNotification(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      message: serializer.fromJson<String>(json['message']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'message': serializer.toJson<String>(message),
      'isRead': serializer.toJson<bool>(isRead),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalNotification copyWith(
          {String? id,
          String? userId,
          String? message,
          bool? isRead,
          DateTime? createdAt}) =>
      LocalNotification(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        message: message ?? this.message,
        isRead: isRead ?? this.isRead,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalNotification copyWithCompanion(LocalNotificationsCompanion data) {
    return LocalNotification(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      message: data.message.present ? data.message.value : this.message,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalNotification(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, message, isRead, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalNotification &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.message == this.message &&
          other.isRead == this.isRead &&
          other.createdAt == this.createdAt);
}

class LocalNotificationsCompanion
    extends drift.UpdateCompanion<LocalNotification> {
  final drift.Value<String> id;
  final drift.Value<String> userId;
  final drift.Value<String> message;
  final drift.Value<bool> isRead;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalNotificationsCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.message = const drift.Value.absent(),
    this.isRead = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalNotificationsCompanion.insert({
    required String id,
    required String userId,
    required String message,
    this.isRead = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        userId = drift.Value(userId),
        message = drift.Value(message);
  static drift.Insertable<LocalNotification> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<String>? message,
    drift.Expression<bool>? isRead,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (message != null) 'message': message,
      if (isRead != null) 'is_read': isRead,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalNotificationsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? userId,
      drift.Value<String>? message,
      drift.Value<bool>? isRead,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalNotificationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (message.present) {
      map['message'] = drift.Variable<String>(message.value);
    }
    if (isRead.present) {
      map['is_read'] = drift.Variable<bool>(isRead.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalNotificationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalReportsTable extends LocalReports
    with drift.TableInfo<$LocalReportsTable, LocalReport> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalReportsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _contentIdMeta =
      const drift.VerificationMeta('contentId');
  @override
  late final drift.GeneratedColumn<String> contentId =
      drift.GeneratedColumn<String>('content_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _contentTypeMeta =
      const drift.VerificationMeta('contentType');
  @override
  late final drift.GeneratedColumn<String> contentType =
      drift.GeneratedColumn<String>('content_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _reasonMeta =
      const drift.VerificationMeta('reason');
  @override
  late final drift.GeneratedColumn<String> reason =
      drift.GeneratedColumn<String>('reason', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, userId, contentId, contentType, reason, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_reports';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalReport> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('content_id')) {
      context.handle(_contentIdMeta,
          contentId.isAcceptableOrUnknown(data['content_id']!, _contentIdMeta));
    } else if (isInserting) {
      context.missing(_contentIdMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
          _contentTypeMeta,
          contentType.isAcceptableOrUnknown(
              data['content_type']!, _contentTypeMeta));
    } else if (isInserting) {
      context.missing(_contentTypeMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalReport(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      contentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_id'])!,
      contentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_type'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalReportsTable createAlias(String alias) {
    return $LocalReportsTable(attachedDatabase, alias);
  }
}

class LocalReport extends drift.DataClass
    implements drift.Insertable<LocalReport> {
  final String id;
  final String userId;
  final String contentId;
  final String contentType;
  final String reason;
  final DateTime createdAt;
  const LocalReport(
      {required this.id,
      required this.userId,
      required this.contentId,
      required this.contentType,
      required this.reason,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['user_id'] = drift.Variable<String>(userId);
    map['content_id'] = drift.Variable<String>(contentId);
    map['content_type'] = drift.Variable<String>(contentType);
    map['reason'] = drift.Variable<String>(reason);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalReportsCompanion toCompanion(bool nullToAbsent) {
    return LocalReportsCompanion(
      id: drift.Value(id),
      userId: drift.Value(userId),
      contentId: drift.Value(contentId),
      contentType: drift.Value(contentType),
      reason: drift.Value(reason),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalReport.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalReport(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      contentId: serializer.fromJson<String>(json['contentId']),
      contentType: serializer.fromJson<String>(json['contentType']),
      reason: serializer.fromJson<String>(json['reason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'contentId': serializer.toJson<String>(contentId),
      'contentType': serializer.toJson<String>(contentType),
      'reason': serializer.toJson<String>(reason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalReport copyWith(
          {String? id,
          String? userId,
          String? contentId,
          String? contentType,
          String? reason,
          DateTime? createdAt}) =>
      LocalReport(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        contentId: contentId ?? this.contentId,
        contentType: contentType ?? this.contentType,
        reason: reason ?? this.reason,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalReport copyWithCompanion(LocalReportsCompanion data) {
    return LocalReport(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      contentId: data.contentId.present ? data.contentId.value : this.contentId,
      contentType:
          data.contentType.present ? data.contentType.value : this.contentType,
      reason: data.reason.present ? data.reason.value : this.reason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalReport(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('contentId: $contentId, ')
          ..write('contentType: $contentType, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, contentId, contentType, reason, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalReport &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.contentId == this.contentId &&
          other.contentType == this.contentType &&
          other.reason == this.reason &&
          other.createdAt == this.createdAt);
}

class LocalReportsCompanion extends drift.UpdateCompanion<LocalReport> {
  final drift.Value<String> id;
  final drift.Value<String> userId;
  final drift.Value<String> contentId;
  final drift.Value<String> contentType;
  final drift.Value<String> reason;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalReportsCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.contentId = const drift.Value.absent(),
    this.contentType = const drift.Value.absent(),
    this.reason = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalReportsCompanion.insert({
    required String id,
    required String userId,
    required String contentId,
    required String contentType,
    required String reason,
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        userId = drift.Value(userId),
        contentId = drift.Value(contentId),
        contentType = drift.Value(contentType),
        reason = drift.Value(reason);
  static drift.Insertable<LocalReport> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<String>? contentId,
    drift.Expression<String>? contentType,
    drift.Expression<String>? reason,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (contentId != null) 'content_id': contentId,
      if (contentType != null) 'content_type': contentType,
      if (reason != null) 'reason': reason,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalReportsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? userId,
      drift.Value<String>? contentId,
      drift.Value<String>? contentType,
      drift.Value<String>? reason,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalReportsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      contentId: contentId ?? this.contentId,
      contentType: contentType ?? this.contentType,
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (contentId.present) {
      map['content_id'] = drift.Variable<String>(contentId.value);
    }
    if (contentType.present) {
      map['content_type'] = drift.Variable<String>(contentType.value);
    }
    if (reason.present) {
      map['reason'] = drift.Variable<String>(reason.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalReportsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('contentId: $contentId, ')
          ..write('contentType: $contentType, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalServiceApplicationsTable extends LocalServiceApplications
    with
        drift
        .TableInfo<$LocalServiceApplicationsTable, LocalServiceApplication> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalServiceApplicationsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _serviceIdMeta =
      const drift.VerificationMeta('serviceId');
  @override
  late final drift.GeneratedColumn<String> serviceId =
      drift.GeneratedColumn<String>('service_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _messageMeta =
      const drift.VerificationMeta('message');
  @override
  late final drift.GeneratedColumn<String> message =
      drift.GeneratedColumn<String>('message', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _statusMeta =
      const drift.VerificationMeta('status');
  @override
  late final drift.GeneratedColumn<String> status =
      drift.GeneratedColumn<String>('status', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('applied'));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<String> createdAt =
      drift.GeneratedColumn<String>('created_at', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(''));
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, serviceId, userId, message, status, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_service_applications';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalServiceApplication> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('service_id')) {
      context.handle(_serviceIdMeta,
          serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta));
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalServiceApplication map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalServiceApplication(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      serviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalServiceApplicationsTable createAlias(String alias) {
    return $LocalServiceApplicationsTable(attachedDatabase, alias);
  }
}

class LocalServiceApplication extends drift.DataClass
    implements drift.Insertable<LocalServiceApplication> {
  final String id;
  final String serviceId;
  final String userId;
  final String? message;
  final String status;
  final String createdAt;
  const LocalServiceApplication(
      {required this.id,
      required this.serviceId,
      required this.userId,
      this.message,
      required this.status,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['service_id'] = drift.Variable<String>(serviceId);
    map['user_id'] = drift.Variable<String>(userId);
    if (!nullToAbsent || message != null) {
      map['message'] = drift.Variable<String>(message);
    }
    map['status'] = drift.Variable<String>(status);
    map['created_at'] = drift.Variable<String>(createdAt);
    return map;
  }

  LocalServiceApplicationsCompanion toCompanion(bool nullToAbsent) {
    return LocalServiceApplicationsCompanion(
      id: drift.Value(id),
      serviceId: drift.Value(serviceId),
      userId: drift.Value(userId),
      message: message == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(message),
      status: drift.Value(status),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalServiceApplication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalServiceApplication(
      id: serializer.fromJson<String>(json['id']),
      serviceId: serializer.fromJson<String>(json['serviceId']),
      userId: serializer.fromJson<String>(json['userId']),
      message: serializer.fromJson<String?>(json['message']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'serviceId': serializer.toJson<String>(serviceId),
      'userId': serializer.toJson<String>(userId),
      'message': serializer.toJson<String?>(message),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  LocalServiceApplication copyWith(
          {String? id,
          String? serviceId,
          String? userId,
          drift.Value<String?> message = const drift.Value.absent(),
          String? status,
          String? createdAt}) =>
      LocalServiceApplication(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        userId: userId ?? this.userId,
        message: message.present ? message.value : this.message,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalServiceApplication copyWithCompanion(
      LocalServiceApplicationsCompanion data) {
    return LocalServiceApplication(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      userId: data.userId.present ? data.userId.value : this.userId,
      message: data.message.present ? data.message.value : this.message,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalServiceApplication(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, serviceId, userId, message, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalServiceApplication &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.userId == this.userId &&
          other.message == this.message &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class LocalServiceApplicationsCompanion
    extends drift.UpdateCompanion<LocalServiceApplication> {
  final drift.Value<String> id;
  final drift.Value<String> serviceId;
  final drift.Value<String> userId;
  final drift.Value<String?> message;
  final drift.Value<String> status;
  final drift.Value<String> createdAt;
  final drift.Value<int> rowid;
  const LocalServiceApplicationsCompanion({
    this.id = const drift.Value.absent(),
    this.serviceId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.message = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalServiceApplicationsCompanion.insert({
    required String id,
    required String serviceId,
    required String userId,
    this.message = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        serviceId = drift.Value(serviceId),
        userId = drift.Value(userId);
  static drift.Insertable<LocalServiceApplication> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? serviceId,
    drift.Expression<String>? userId,
    drift.Expression<String>? message,
    drift.Expression<String>? status,
    drift.Expression<String>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (userId != null) 'user_id': userId,
      if (message != null) 'message': message,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalServiceApplicationsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? serviceId,
      drift.Value<String>? userId,
      drift.Value<String?>? message,
      drift.Value<String>? status,
      drift.Value<String>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalServiceApplicationsCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = drift.Variable<String>(serviceId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (message.present) {
      map['message'] = drift.Variable<String>(message.value);
    }
    if (status.present) {
      map['status'] = drift.Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalServiceApplicationsCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalServiceRatingsTable extends LocalServiceRatings
    with drift.TableInfo<$LocalServiceRatingsTable, LocalServiceRating> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalServiceRatingsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _serviceIdMeta =
      const drift.VerificationMeta('serviceId');
  @override
  late final drift.GeneratedColumn<String> serviceId =
      drift.GeneratedColumn<String>('service_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _ratingMeta =
      const drift.VerificationMeta('rating');
  @override
  late final drift.GeneratedColumn<int> rating = drift.GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  static const drift.VerificationMeta _updatedAtMeta =
      const drift.VerificationMeta('updatedAt');
  @override
  late final drift.GeneratedColumn<DateTime> updatedAt =
      drift.GeneratedColumn<DateTime>('updated_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, serviceId, userId, rating, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_service_ratings';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalServiceRating> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('service_id')) {
      context.handle(_serviceIdMeta,
          serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta));
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalServiceRating map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalServiceRating(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      serviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $LocalServiceRatingsTable createAlias(String alias) {
    return $LocalServiceRatingsTable(attachedDatabase, alias);
  }
}

class LocalServiceRating extends drift.DataClass
    implements drift.Insertable<LocalServiceRating> {
  final String id;
  final String serviceId;
  final String userId;
  final int rating;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const LocalServiceRating(
      {required this.id,
      required this.serviceId,
      required this.userId,
      required this.rating,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['service_id'] = drift.Variable<String>(serviceId);
    map['user_id'] = drift.Variable<String>(userId);
    map['rating'] = drift.Variable<int>(rating);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = drift.Variable<DateTime>(updatedAt);
    }
    return map;
  }

  LocalServiceRatingsCompanion toCompanion(bool nullToAbsent) {
    return LocalServiceRatingsCompanion(
      id: drift.Value(id),
      serviceId: drift.Value(serviceId),
      userId: drift.Value(userId),
      rating: drift.Value(rating),
      createdAt: drift.Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(updatedAt),
    );
  }

  factory LocalServiceRating.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalServiceRating(
      id: serializer.fromJson<String>(json['id']),
      serviceId: serializer.fromJson<String>(json['serviceId']),
      userId: serializer.fromJson<String>(json['userId']),
      rating: serializer.fromJson<int>(json['rating']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'serviceId': serializer.toJson<String>(serviceId),
      'userId': serializer.toJson<String>(userId),
      'rating': serializer.toJson<int>(rating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  LocalServiceRating copyWith(
          {String? id,
          String? serviceId,
          String? userId,
          int? rating,
          DateTime? createdAt,
          drift.Value<DateTime?> updatedAt = const drift.Value.absent()}) =>
      LocalServiceRating(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        userId: userId ?? this.userId,
        rating: rating ?? this.rating,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  LocalServiceRating copyWithCompanion(LocalServiceRatingsCompanion data) {
    return LocalServiceRating(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      userId: data.userId.present ? data.userId.value : this.userId,
      rating: data.rating.present ? data.rating.value : this.rating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalServiceRating(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('userId: $userId, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, serviceId, userId, rating, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalServiceRating &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.userId == this.userId &&
          other.rating == this.rating &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LocalServiceRatingsCompanion
    extends drift.UpdateCompanion<LocalServiceRating> {
  final drift.Value<String> id;
  final drift.Value<String> serviceId;
  final drift.Value<String> userId;
  final drift.Value<int> rating;
  final drift.Value<DateTime> createdAt;
  final drift.Value<DateTime?> updatedAt;
  final drift.Value<int> rowid;
  const LocalServiceRatingsCompanion({
    this.id = const drift.Value.absent(),
    this.serviceId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.rating = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.updatedAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalServiceRatingsCompanion.insert({
    required String id,
    required String serviceId,
    required String userId,
    required int rating,
    this.createdAt = const drift.Value.absent(),
    this.updatedAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        serviceId = drift.Value(serviceId),
        userId = drift.Value(userId),
        rating = drift.Value(rating);
  static drift.Insertable<LocalServiceRating> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? serviceId,
    drift.Expression<String>? userId,
    drift.Expression<int>? rating,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<DateTime>? updatedAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (userId != null) 'user_id': userId,
      if (rating != null) 'rating': rating,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalServiceRatingsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? serviceId,
      drift.Value<String>? userId,
      drift.Value<int>? rating,
      drift.Value<DateTime>? createdAt,
      drift.Value<DateTime?>? updatedAt,
      drift.Value<int>? rowid}) {
    return LocalServiceRatingsCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = drift.Variable<String>(serviceId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (rating.present) {
      map['rating'] = drift.Variable<int>(rating.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = drift.Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalServiceRatingsCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('userId: $userId, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalServicesTable extends LocalServices
    with drift.TableInfo<$LocalServicesTable, LocalService> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalServicesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _companyMeta =
      const drift.VerificationMeta('company');
  @override
  late final drift.GeneratedColumn<String> company =
      drift.GeneratedColumn<String>('company', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _servicedescMeta =
      const drift.VerificationMeta('servicedesc');
  @override
  late final drift.GeneratedColumn<String> servicedesc =
      drift.GeneratedColumn<String>('servicedesc', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _companylocationMeta =
      const drift.VerificationMeta('companylocation');
  @override
  late final drift.GeneratedColumn<String> companylocation =
      drift.GeneratedColumn<String>('companylocation', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _salaryMeta =
      const drift.VerificationMeta('salary');
  @override
  late final drift.GeneratedColumn<double> salary =
      drift.GeneratedColumn<double>('salary', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _servicetypeMeta =
      const drift.VerificationMeta('servicetype');
  @override
  late final drift.GeneratedColumn<String> servicetype =
      drift.GeneratedColumn<String>('servicetype', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _useridMeta =
      const drift.VerificationMeta('userid');
  @override
  late final drift.GeneratedColumn<String> userid =
      drift.GeneratedColumn<String>('userid', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdatMeta =
      const drift.VerificationMeta('createdat');
  @override
  late final drift.GeneratedColumn<DateTime> createdat =
      drift.GeneratedColumn<DateTime>('createdat', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const drift.VerificationMeta _serviceimageMeta =
      const drift.VerificationMeta('serviceimage');
  @override
  late final drift.GeneratedColumn<String> serviceimage =
      drift.GeneratedColumn<String>('serviceimage', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _serviceratingMeta =
      const drift.VerificationMeta('servicerating');
  @override
  late final drift.GeneratedColumn<double> servicerating =
      drift.GeneratedColumn<double>('servicerating', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0.0));
  static const drift.VerificationMeta _contactMeta =
      const drift.VerificationMeta('contact');
  @override
  late final drift.GeneratedColumn<String> contact =
      drift.GeneratedColumn<String>('contact', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        company,
        servicedesc,
        companylocation,
        salary,
        servicetype,
        userid,
        createdat,
        serviceimage,
        servicerating,
        contact
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_services';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalService> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    } else if (isInserting) {
      context.missing(_companyMeta);
    }
    if (data.containsKey('servicedesc')) {
      context.handle(
          _servicedescMeta,
          servicedesc.isAcceptableOrUnknown(
              data['servicedesc']!, _servicedescMeta));
    } else if (isInserting) {
      context.missing(_servicedescMeta);
    }
    if (data.containsKey('companylocation')) {
      context.handle(
          _companylocationMeta,
          companylocation.isAcceptableOrUnknown(
              data['companylocation']!, _companylocationMeta));
    } else if (isInserting) {
      context.missing(_companylocationMeta);
    }
    if (data.containsKey('salary')) {
      context.handle(_salaryMeta,
          salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta));
    } else if (isInserting) {
      context.missing(_salaryMeta);
    }
    if (data.containsKey('servicetype')) {
      context.handle(
          _servicetypeMeta,
          servicetype.isAcceptableOrUnknown(
              data['servicetype']!, _servicetypeMeta));
    } else if (isInserting) {
      context.missing(_servicetypeMeta);
    }
    if (data.containsKey('userid')) {
      context.handle(_useridMeta,
          userid.isAcceptableOrUnknown(data['userid']!, _useridMeta));
    } else if (isInserting) {
      context.missing(_useridMeta);
    }
    if (data.containsKey('createdat')) {
      context.handle(_createdatMeta,
          createdat.isAcceptableOrUnknown(data['createdat']!, _createdatMeta));
    } else if (isInserting) {
      context.missing(_createdatMeta);
    }
    if (data.containsKey('serviceimage')) {
      context.handle(
          _serviceimageMeta,
          serviceimage.isAcceptableOrUnknown(
              data['serviceimage']!, _serviceimageMeta));
    }
    if (data.containsKey('servicerating')) {
      context.handle(
          _serviceratingMeta,
          servicerating.isAcceptableOrUnknown(
              data['servicerating']!, _serviceratingMeta));
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalService map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalService(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company'])!,
      servicedesc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}servicedesc'])!,
      companylocation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}companylocation'])!,
      salary: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}salary'])!,
      servicetype: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}servicetype'])!,
      userid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}userid'])!,
      createdat: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}createdat'])!,
      serviceimage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serviceimage']),
      servicerating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}servicerating'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact'])!,
    );
  }

  @override
  $LocalServicesTable createAlias(String alias) {
    return $LocalServicesTable(attachedDatabase, alias);
  }
}

class LocalService extends drift.DataClass
    implements drift.Insertable<LocalService> {
  final String id;
  final String company;
  final String servicedesc;
  final String companylocation;
  final double salary;
  final String servicetype;
  final String userid;
  final DateTime createdat;
  final String? serviceimage;
  final double servicerating;
  final String contact;
  const LocalService(
      {required this.id,
      required this.company,
      required this.servicedesc,
      required this.companylocation,
      required this.salary,
      required this.servicetype,
      required this.userid,
      required this.createdat,
      this.serviceimage,
      required this.servicerating,
      required this.contact});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['company'] = drift.Variable<String>(company);
    map['servicedesc'] = drift.Variable<String>(servicedesc);
    map['companylocation'] = drift.Variable<String>(companylocation);
    map['salary'] = drift.Variable<double>(salary);
    map['servicetype'] = drift.Variable<String>(servicetype);
    map['userid'] = drift.Variable<String>(userid);
    map['createdat'] = drift.Variable<DateTime>(createdat);
    if (!nullToAbsent || serviceimage != null) {
      map['serviceimage'] = drift.Variable<String>(serviceimage);
    }
    map['servicerating'] = drift.Variable<double>(servicerating);
    map['contact'] = drift.Variable<String>(contact);
    return map;
  }

  LocalServicesCompanion toCompanion(bool nullToAbsent) {
    return LocalServicesCompanion(
      id: drift.Value(id),
      company: drift.Value(company),
      servicedesc: drift.Value(servicedesc),
      companylocation: drift.Value(companylocation),
      salary: drift.Value(salary),
      servicetype: drift.Value(servicetype),
      userid: drift.Value(userid),
      createdat: drift.Value(createdat),
      serviceimage: serviceimage == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(serviceimage),
      servicerating: drift.Value(servicerating),
      contact: drift.Value(contact),
    );
  }

  factory LocalService.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalService(
      id: serializer.fromJson<String>(json['id']),
      company: serializer.fromJson<String>(json['company']),
      servicedesc: serializer.fromJson<String>(json['servicedesc']),
      companylocation: serializer.fromJson<String>(json['companylocation']),
      salary: serializer.fromJson<double>(json['salary']),
      servicetype: serializer.fromJson<String>(json['servicetype']),
      userid: serializer.fromJson<String>(json['userid']),
      createdat: serializer.fromJson<DateTime>(json['createdat']),
      serviceimage: serializer.fromJson<String?>(json['serviceimage']),
      servicerating: serializer.fromJson<double>(json['servicerating']),
      contact: serializer.fromJson<String>(json['contact']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'company': serializer.toJson<String>(company),
      'servicedesc': serializer.toJson<String>(servicedesc),
      'companylocation': serializer.toJson<String>(companylocation),
      'salary': serializer.toJson<double>(salary),
      'servicetype': serializer.toJson<String>(servicetype),
      'userid': serializer.toJson<String>(userid),
      'createdat': serializer.toJson<DateTime>(createdat),
      'serviceimage': serializer.toJson<String?>(serviceimage),
      'servicerating': serializer.toJson<double>(servicerating),
      'contact': serializer.toJson<String>(contact),
    };
  }

  LocalService copyWith(
          {String? id,
          String? company,
          String? servicedesc,
          String? companylocation,
          double? salary,
          String? servicetype,
          String? userid,
          DateTime? createdat,
          drift.Value<String?> serviceimage = const drift.Value.absent(),
          double? servicerating,
          String? contact}) =>
      LocalService(
        id: id ?? this.id,
        company: company ?? this.company,
        servicedesc: servicedesc ?? this.servicedesc,
        companylocation: companylocation ?? this.companylocation,
        salary: salary ?? this.salary,
        servicetype: servicetype ?? this.servicetype,
        userid: userid ?? this.userid,
        createdat: createdat ?? this.createdat,
        serviceimage:
            serviceimage.present ? serviceimage.value : this.serviceimage,
        servicerating: servicerating ?? this.servicerating,
        contact: contact ?? this.contact,
      );
  LocalService copyWithCompanion(LocalServicesCompanion data) {
    return LocalService(
      id: data.id.present ? data.id.value : this.id,
      company: data.company.present ? data.company.value : this.company,
      servicedesc:
          data.servicedesc.present ? data.servicedesc.value : this.servicedesc,
      companylocation: data.companylocation.present
          ? data.companylocation.value
          : this.companylocation,
      salary: data.salary.present ? data.salary.value : this.salary,
      servicetype:
          data.servicetype.present ? data.servicetype.value : this.servicetype,
      userid: data.userid.present ? data.userid.value : this.userid,
      createdat: data.createdat.present ? data.createdat.value : this.createdat,
      serviceimage: data.serviceimage.present
          ? data.serviceimage.value
          : this.serviceimage,
      servicerating: data.servicerating.present
          ? data.servicerating.value
          : this.servicerating,
      contact: data.contact.present ? data.contact.value : this.contact,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalService(')
          ..write('id: $id, ')
          ..write('company: $company, ')
          ..write('servicedesc: $servicedesc, ')
          ..write('companylocation: $companylocation, ')
          ..write('salary: $salary, ')
          ..write('servicetype: $servicetype, ')
          ..write('userid: $userid, ')
          ..write('createdat: $createdat, ')
          ..write('serviceimage: $serviceimage, ')
          ..write('servicerating: $servicerating, ')
          ..write('contact: $contact')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      company,
      servicedesc,
      companylocation,
      salary,
      servicetype,
      userid,
      createdat,
      serviceimage,
      servicerating,
      contact);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalService &&
          other.id == this.id &&
          other.company == this.company &&
          other.servicedesc == this.servicedesc &&
          other.companylocation == this.companylocation &&
          other.salary == this.salary &&
          other.servicetype == this.servicetype &&
          other.userid == this.userid &&
          other.createdat == this.createdat &&
          other.serviceimage == this.serviceimage &&
          other.servicerating == this.servicerating &&
          other.contact == this.contact);
}

class LocalServicesCompanion extends drift.UpdateCompanion<LocalService> {
  final drift.Value<String> id;
  final drift.Value<String> company;
  final drift.Value<String> servicedesc;
  final drift.Value<String> companylocation;
  final drift.Value<double> salary;
  final drift.Value<String> servicetype;
  final drift.Value<String> userid;
  final drift.Value<DateTime> createdat;
  final drift.Value<String?> serviceimage;
  final drift.Value<double> servicerating;
  final drift.Value<String> contact;
  final drift.Value<int> rowid;
  const LocalServicesCompanion({
    this.id = const drift.Value.absent(),
    this.company = const drift.Value.absent(),
    this.servicedesc = const drift.Value.absent(),
    this.companylocation = const drift.Value.absent(),
    this.salary = const drift.Value.absent(),
    this.servicetype = const drift.Value.absent(),
    this.userid = const drift.Value.absent(),
    this.createdat = const drift.Value.absent(),
    this.serviceimage = const drift.Value.absent(),
    this.servicerating = const drift.Value.absent(),
    this.contact = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalServicesCompanion.insert({
    required String id,
    required String company,
    required String servicedesc,
    required String companylocation,
    required double salary,
    required String servicetype,
    required String userid,
    required DateTime createdat,
    this.serviceimage = const drift.Value.absent(),
    this.servicerating = const drift.Value.absent(),
    required String contact,
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        company = drift.Value(company),
        servicedesc = drift.Value(servicedesc),
        companylocation = drift.Value(companylocation),
        salary = drift.Value(salary),
        servicetype = drift.Value(servicetype),
        userid = drift.Value(userid),
        createdat = drift.Value(createdat),
        contact = drift.Value(contact);
  static drift.Insertable<LocalService> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? company,
    drift.Expression<String>? servicedesc,
    drift.Expression<String>? companylocation,
    drift.Expression<double>? salary,
    drift.Expression<String>? servicetype,
    drift.Expression<String>? userid,
    drift.Expression<DateTime>? createdat,
    drift.Expression<String>? serviceimage,
    drift.Expression<double>? servicerating,
    drift.Expression<String>? contact,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (company != null) 'company': company,
      if (servicedesc != null) 'servicedesc': servicedesc,
      if (companylocation != null) 'companylocation': companylocation,
      if (salary != null) 'salary': salary,
      if (servicetype != null) 'servicetype': servicetype,
      if (userid != null) 'userid': userid,
      if (createdat != null) 'createdat': createdat,
      if (serviceimage != null) 'serviceimage': serviceimage,
      if (servicerating != null) 'servicerating': servicerating,
      if (contact != null) 'contact': contact,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalServicesCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? company,
      drift.Value<String>? servicedesc,
      drift.Value<String>? companylocation,
      drift.Value<double>? salary,
      drift.Value<String>? servicetype,
      drift.Value<String>? userid,
      drift.Value<DateTime>? createdat,
      drift.Value<String?>? serviceimage,
      drift.Value<double>? servicerating,
      drift.Value<String>? contact,
      drift.Value<int>? rowid}) {
    return LocalServicesCompanion(
      id: id ?? this.id,
      company: company ?? this.company,
      servicedesc: servicedesc ?? this.servicedesc,
      companylocation: companylocation ?? this.companylocation,
      salary: salary ?? this.salary,
      servicetype: servicetype ?? this.servicetype,
      userid: userid ?? this.userid,
      createdat: createdat ?? this.createdat,
      serviceimage: serviceimage ?? this.serviceimage,
      servicerating: servicerating ?? this.servicerating,
      contact: contact ?? this.contact,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (company.present) {
      map['company'] = drift.Variable<String>(company.value);
    }
    if (servicedesc.present) {
      map['servicedesc'] = drift.Variable<String>(servicedesc.value);
    }
    if (companylocation.present) {
      map['companylocation'] = drift.Variable<String>(companylocation.value);
    }
    if (salary.present) {
      map['salary'] = drift.Variable<double>(salary.value);
    }
    if (servicetype.present) {
      map['servicetype'] = drift.Variable<String>(servicetype.value);
    }
    if (userid.present) {
      map['userid'] = drift.Variable<String>(userid.value);
    }
    if (createdat.present) {
      map['createdat'] = drift.Variable<DateTime>(createdat.value);
    }
    if (serviceimage.present) {
      map['serviceimage'] = drift.Variable<String>(serviceimage.value);
    }
    if (servicerating.present) {
      map['servicerating'] = drift.Variable<double>(servicerating.value);
    }
    if (contact.present) {
      map['contact'] = drift.Variable<String>(contact.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalServicesCompanion(')
          ..write('id: $id, ')
          ..write('company: $company, ')
          ..write('servicedesc: $servicedesc, ')
          ..write('companylocation: $companylocation, ')
          ..write('salary: $salary, ')
          ..write('servicetype: $servicetype, ')
          ..write('userid: $userid, ')
          ..write('createdat: $createdat, ')
          ..write('serviceimage: $serviceimage, ')
          ..write('servicerating: $servicerating, ')
          ..write('contact: $contact, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ServiceRatingsTable extends ServiceRatings
    with drift.TableInfo<$ServiceRatingsTable, ServiceRating> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceRatingsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _serviceIdMeta =
      const drift.VerificationMeta('serviceId');
  @override
  late final drift.GeneratedColumn<String> serviceId =
      drift.GeneratedColumn<String>('service_id', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 36),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 36),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const drift.VerificationMeta _ratingMeta =
      const drift.VerificationMeta('rating');
  @override
  late final drift.GeneratedColumn<int> rating = drift.GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const drift.VerificationMeta _updatedAtMeta =
      const drift.VerificationMeta('updatedAt');
  @override
  late final drift.GeneratedColumn<DateTime> updatedAt =
      drift.GeneratedColumn<DateTime>('updated_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, serviceId, userId, rating, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_ratings';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<ServiceRating> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_id')) {
      context.handle(_serviceIdMeta,
          serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta));
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceRating map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceRating(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $ServiceRatingsTable createAlias(String alias) {
    return $ServiceRatingsTable(attachedDatabase, alias);
  }
}

class ServiceRating extends drift.DataClass
    implements drift.Insertable<ServiceRating> {
  final int id;
  final String serviceId;
  final String userId;
  final int rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const ServiceRating(
      {required this.id,
      required this.serviceId,
      required this.userId,
      required this.rating,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['service_id'] = drift.Variable<String>(serviceId);
    map['user_id'] = drift.Variable<String>(userId);
    map['rating'] = drift.Variable<int>(rating);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = drift.Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = drift.Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ServiceRatingsCompanion toCompanion(bool nullToAbsent) {
    return ServiceRatingsCompanion(
      id: drift.Value(id),
      serviceId: drift.Value(serviceId),
      userId: drift.Value(userId),
      rating: drift.Value(rating),
      createdAt: createdAt == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(updatedAt),
    );
  }

  factory ServiceRating.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return ServiceRating(
      id: serializer.fromJson<int>(json['id']),
      serviceId: serializer.fromJson<String>(json['serviceId']),
      userId: serializer.fromJson<String>(json['userId']),
      rating: serializer.fromJson<int>(json['rating']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serviceId': serializer.toJson<String>(serviceId),
      'userId': serializer.toJson<String>(userId),
      'rating': serializer.toJson<int>(rating),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  ServiceRating copyWith(
          {int? id,
          String? serviceId,
          String? userId,
          int? rating,
          drift.Value<DateTime?> createdAt = const drift.Value.absent(),
          drift.Value<DateTime?> updatedAt = const drift.Value.absent()}) =>
      ServiceRating(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        userId: userId ?? this.userId,
        rating: rating ?? this.rating,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  ServiceRating copyWithCompanion(ServiceRatingsCompanion data) {
    return ServiceRating(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      userId: data.userId.present ? data.userId.value : this.userId,
      rating: data.rating.present ? data.rating.value : this.rating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceRating(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('userId: $userId, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, serviceId, userId, rating, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceRating &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.userId == this.userId &&
          other.rating == this.rating &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ServiceRatingsCompanion extends drift.UpdateCompanion<ServiceRating> {
  final drift.Value<int> id;
  final drift.Value<String> serviceId;
  final drift.Value<String> userId;
  final drift.Value<int> rating;
  final drift.Value<DateTime?> createdAt;
  final drift.Value<DateTime?> updatedAt;
  const ServiceRatingsCompanion({
    this.id = const drift.Value.absent(),
    this.serviceId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.rating = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.updatedAt = const drift.Value.absent(),
  });
  ServiceRatingsCompanion.insert({
    this.id = const drift.Value.absent(),
    required String serviceId,
    required String userId,
    required int rating,
    this.createdAt = const drift.Value.absent(),
    this.updatedAt = const drift.Value.absent(),
  })  : serviceId = drift.Value(serviceId),
        userId = drift.Value(userId),
        rating = drift.Value(rating);
  static drift.Insertable<ServiceRating> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? serviceId,
    drift.Expression<String>? userId,
    drift.Expression<int>? rating,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<DateTime>? updatedAt,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (userId != null) 'user_id': userId,
      if (rating != null) 'rating': rating,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ServiceRatingsCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? serviceId,
      drift.Value<String>? userId,
      drift.Value<int>? rating,
      drift.Value<DateTime?>? createdAt,
      drift.Value<DateTime?>? updatedAt}) {
    return ServiceRatingsCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = drift.Variable<String>(serviceId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (rating.present) {
      map['rating'] = drift.Variable<int>(rating.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = drift.Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceRatingsCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('userId: $userId, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $HireRequestsTable extends HireRequests
    with drift.TableInfo<$HireRequestsTable, HireRequest> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HireRequestsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _serviceIdMeta =
      const drift.VerificationMeta('serviceId');
  @override
  late final drift.GeneratedColumn<String> serviceId =
      drift.GeneratedColumn<String>('service_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _messageMeta =
      const drift.VerificationMeta('message');
  @override
  late final drift.GeneratedColumn<String> message =
      drift.GeneratedColumn<String>('message', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _statusMeta =
      const drift.VerificationMeta('status');
  @override
  late final drift.GeneratedColumn<String> status =
      drift.GeneratedColumn<String>('status', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('applied'));
  static const drift.VerificationMeta _isSyncedMeta =
      const drift.VerificationMeta('isSynced');
  @override
  late final drift.GeneratedColumn<bool> isSynced = drift.GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<String> createdAt =
      drift.GeneratedColumn<String>('created_at', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(''));
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, serviceId, userId, message, status, isSynced, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hire_requests';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<HireRequest> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('service_id')) {
      context.handle(_serviceIdMeta,
          serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta));
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<drift.GeneratedColumn>> get uniqueKeys => [
        {serviceId, userId},
      ];
  @override
  HireRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HireRequest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      serviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HireRequestsTable createAlias(String alias) {
    return $HireRequestsTable(attachedDatabase, alias);
  }
}

class HireRequest extends drift.DataClass
    implements drift.Insertable<HireRequest> {
  final String id;
  final String serviceId;
  final String userId;
  final String? message;
  final String status;
  final bool isSynced;
  final String createdAt;
  const HireRequest(
      {required this.id,
      required this.serviceId,
      required this.userId,
      this.message,
      required this.status,
      required this.isSynced,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['service_id'] = drift.Variable<String>(serviceId);
    map['user_id'] = drift.Variable<String>(userId);
    if (!nullToAbsent || message != null) {
      map['message'] = drift.Variable<String>(message);
    }
    map['status'] = drift.Variable<String>(status);
    map['is_synced'] = drift.Variable<bool>(isSynced);
    map['created_at'] = drift.Variable<String>(createdAt);
    return map;
  }

  HireRequestsCompanion toCompanion(bool nullToAbsent) {
    return HireRequestsCompanion(
      id: drift.Value(id),
      serviceId: drift.Value(serviceId),
      userId: drift.Value(userId),
      message: message == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(message),
      status: drift.Value(status),
      isSynced: drift.Value(isSynced),
      createdAt: drift.Value(createdAt),
    );
  }

  factory HireRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return HireRequest(
      id: serializer.fromJson<String>(json['id']),
      serviceId: serializer.fromJson<String>(json['serviceId']),
      userId: serializer.fromJson<String>(json['userId']),
      message: serializer.fromJson<String?>(json['message']),
      status: serializer.fromJson<String>(json['status']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'serviceId': serializer.toJson<String>(serviceId),
      'userId': serializer.toJson<String>(userId),
      'message': serializer.toJson<String?>(message),
      'status': serializer.toJson<String>(status),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  HireRequest copyWith(
          {String? id,
          String? serviceId,
          String? userId,
          drift.Value<String?> message = const drift.Value.absent(),
          String? status,
          bool? isSynced,
          String? createdAt}) =>
      HireRequest(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        userId: userId ?? this.userId,
        message: message.present ? message.value : this.message,
        status: status ?? this.status,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
      );
  HireRequest copyWithCompanion(HireRequestsCompanion data) {
    return HireRequest(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      userId: data.userId.present ? data.userId.value : this.userId,
      message: data.message.present ? data.message.value : this.message,
      status: data.status.present ? data.status.value : this.status,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HireRequest(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('status: $status, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, serviceId, userId, message, status, isSynced, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HireRequest &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.userId == this.userId &&
          other.message == this.message &&
          other.status == this.status &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt);
}

class HireRequestsCompanion extends drift.UpdateCompanion<HireRequest> {
  final drift.Value<String> id;
  final drift.Value<String> serviceId;
  final drift.Value<String> userId;
  final drift.Value<String?> message;
  final drift.Value<String> status;
  final drift.Value<bool> isSynced;
  final drift.Value<String> createdAt;
  final drift.Value<int> rowid;
  const HireRequestsCompanion({
    this.id = const drift.Value.absent(),
    this.serviceId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.message = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  HireRequestsCompanion.insert({
    required String id,
    required String serviceId,
    required String userId,
    this.message = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        serviceId = drift.Value(serviceId),
        userId = drift.Value(userId);
  static drift.Insertable<HireRequest> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? serviceId,
    drift.Expression<String>? userId,
    drift.Expression<String>? message,
    drift.Expression<String>? status,
    drift.Expression<bool>? isSynced,
    drift.Expression<String>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (userId != null) 'user_id': userId,
      if (message != null) 'message': message,
      if (status != null) 'status': status,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HireRequestsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? serviceId,
      drift.Value<String>? userId,
      drift.Value<String?>? message,
      drift.Value<String>? status,
      drift.Value<bool>? isSynced,
      drift.Value<String>? createdAt,
      drift.Value<int>? rowid}) {
    return HireRequestsCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      status: status ?? this.status,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = drift.Variable<String>(serviceId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (message.present) {
      map['message'] = drift.Variable<String>(message.value);
    }
    if (status.present) {
      map['status'] = drift.Variable<String>(status.value);
    }
    if (isSynced.present) {
      map['is_synced'] = drift.Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HireRequestsCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('status: $status, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalFavoritesTable extends LocalFavorites
    with drift.TableInfo<$LocalFavoritesTable, LocalFavorite> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalFavoritesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _postIdMeta =
      const drift.VerificationMeta('postId');
  @override
  late final drift.GeneratedColumn<String> postId =
      drift.GeneratedColumn<String>('post_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns => [id, userId, postId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_favorites';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalFavorite> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalFavorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFavorite(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      postId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}post_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalFavoritesTable createAlias(String alias) {
    return $LocalFavoritesTable(attachedDatabase, alias);
  }
}

class LocalFavorite extends drift.DataClass
    implements drift.Insertable<LocalFavorite> {
  final String id;
  final String userId;
  final String postId;
  final DateTime createdAt;
  const LocalFavorite(
      {required this.id,
      required this.userId,
      required this.postId,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['user_id'] = drift.Variable<String>(userId);
    map['post_id'] = drift.Variable<String>(postId);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalFavoritesCompanion toCompanion(bool nullToAbsent) {
    return LocalFavoritesCompanion(
      id: drift.Value(id),
      userId: drift.Value(userId),
      postId: drift.Value(postId),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalFavorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalFavorite(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      postId: serializer.fromJson<String>(json['postId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'postId': serializer.toJson<String>(postId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalFavorite copyWith(
          {String? id, String? userId, String? postId, DateTime? createdAt}) =>
      LocalFavorite(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        postId: postId ?? this.postId,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalFavorite copyWithCompanion(LocalFavoritesCompanion data) {
    return LocalFavorite(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      postId: data.postId.present ? data.postId.value : this.postId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFavorite(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('postId: $postId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, postId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFavorite &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.postId == this.postId &&
          other.createdAt == this.createdAt);
}

class LocalFavoritesCompanion extends drift.UpdateCompanion<LocalFavorite> {
  final drift.Value<String> id;
  final drift.Value<String> userId;
  final drift.Value<String> postId;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalFavoritesCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.postId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalFavoritesCompanion.insert({
    required String id,
    required String userId,
    required String postId,
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        userId = drift.Value(userId),
        postId = drift.Value(postId);
  static drift.Insertable<LocalFavorite> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<String>? postId,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (postId != null) 'post_id': postId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalFavoritesCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? userId,
      drift.Value<String>? postId,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalFavoritesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (postId.present) {
      map['post_id'] = drift.Variable<String>(postId.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalFavoritesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('postId: $postId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalCommentsTable extends LocalComments
    with drift.TableInfo<$LocalCommentsTable, LocalComment> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalCommentsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _blogIdMeta =
      const drift.VerificationMeta('blogId');
  @override
  late final drift.GeneratedColumn<String> blogId =
      drift.GeneratedColumn<String>('blog_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _commentMeta =
      const drift.VerificationMeta('comment');
  @override
  late final drift.GeneratedColumn<String> comment =
      drift.GeneratedColumn<String>('comment', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _parentIdMeta =
      const drift.VerificationMeta('parentId');
  @override
  late final drift.GeneratedColumn<String> parentId =
      drift.GeneratedColumn<String>('parent_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, userId, blogId, comment, parentId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_comments';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalComment> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('blog_id')) {
      context.handle(_blogIdMeta,
          blogId.isAcceptableOrUnknown(data['blog_id']!, _blogIdMeta));
    } else if (isInserting) {
      context.missing(_blogIdMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalComment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalComment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      blogId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blog_id'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalCommentsTable createAlias(String alias) {
    return $LocalCommentsTable(attachedDatabase, alias);
  }
}

class LocalComment extends drift.DataClass
    implements drift.Insertable<LocalComment> {
  final String id;
  final String userId;
  final String blogId;
  final String comment;
  final String? parentId;
  final DateTime createdAt;
  const LocalComment(
      {required this.id,
      required this.userId,
      required this.blogId,
      required this.comment,
      this.parentId,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['user_id'] = drift.Variable<String>(userId);
    map['blog_id'] = drift.Variable<String>(blogId);
    map['comment'] = drift.Variable<String>(comment);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = drift.Variable<String>(parentId);
    }
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalCommentsCompanion toCompanion(bool nullToAbsent) {
    return LocalCommentsCompanion(
      id: drift.Value(id),
      userId: drift.Value(userId),
      blogId: drift.Value(blogId),
      comment: drift.Value(comment),
      parentId: parentId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(parentId),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalComment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalComment(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      blogId: serializer.fromJson<String>(json['blogId']),
      comment: serializer.fromJson<String>(json['comment']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'blogId': serializer.toJson<String>(blogId),
      'comment': serializer.toJson<String>(comment),
      'parentId': serializer.toJson<String?>(parentId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalComment copyWith(
          {String? id,
          String? userId,
          String? blogId,
          String? comment,
          drift.Value<String?> parentId = const drift.Value.absent(),
          DateTime? createdAt}) =>
      LocalComment(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        blogId: blogId ?? this.blogId,
        comment: comment ?? this.comment,
        parentId: parentId.present ? parentId.value : this.parentId,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalComment copyWithCompanion(LocalCommentsCompanion data) {
    return LocalComment(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      blogId: data.blogId.present ? data.blogId.value : this.blogId,
      comment: data.comment.present ? data.comment.value : this.comment,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalComment(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('blogId: $blogId, ')
          ..write('comment: $comment, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, blogId, comment, parentId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalComment &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.blogId == this.blogId &&
          other.comment == this.comment &&
          other.parentId == this.parentId &&
          other.createdAt == this.createdAt);
}

class LocalCommentsCompanion extends drift.UpdateCompanion<LocalComment> {
  final drift.Value<String> id;
  final drift.Value<String> userId;
  final drift.Value<String> blogId;
  final drift.Value<String> comment;
  final drift.Value<String?> parentId;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalCommentsCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.blogId = const drift.Value.absent(),
    this.comment = const drift.Value.absent(),
    this.parentId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalCommentsCompanion.insert({
    required String id,
    required String userId,
    required String blogId,
    required String comment,
    this.parentId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        userId = drift.Value(userId),
        blogId = drift.Value(blogId),
        comment = drift.Value(comment);
  static drift.Insertable<LocalComment> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<String>? blogId,
    drift.Expression<String>? comment,
    drift.Expression<String>? parentId,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (blogId != null) 'blog_id': blogId,
      if (comment != null) 'comment': comment,
      if (parentId != null) 'parent_id': parentId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalCommentsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? userId,
      drift.Value<String>? blogId,
      drift.Value<String>? comment,
      drift.Value<String?>? parentId,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalCommentsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      blogId: blogId ?? this.blogId,
      comment: comment ?? this.comment,
      parentId: parentId ?? this.parentId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (blogId.present) {
      map['blog_id'] = drift.Variable<String>(blogId.value);
    }
    if (comment.present) {
      map['comment'] = drift.Variable<String>(comment.value);
    }
    if (parentId.present) {
      map['parent_id'] = drift.Variable<String>(parentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalCommentsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('blogId: $blogId, ')
          ..write('comment: $comment, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalMessagesTable extends LocalMessages
    with drift.TableInfo<$LocalMessagesTable, LocalMessage> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalMessagesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _senderIdMeta =
      const drift.VerificationMeta('senderId');
  @override
  late final drift.GeneratedColumn<String> senderId =
      drift.GeneratedColumn<String>('sender_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _receiverIdMeta =
      const drift.VerificationMeta('receiverId');
  @override
  late final drift.GeneratedColumn<String> receiverId =
      drift.GeneratedColumn<String>('receiver_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _contentMeta =
      const drift.VerificationMeta('content');
  @override
  late final drift.GeneratedColumn<String> content =
      drift.GeneratedColumn<String>('content', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _isReadMeta =
      const drift.VerificationMeta('isRead');
  @override
  late final drift.GeneratedColumn<bool> isRead = drift.GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, senderId, receiverId, content, isRead, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_messages';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalMessage> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(_senderIdMeta,
          senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta));
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('receiver_id')) {
      context.handle(
          _receiverIdMeta,
          receiverId.isAcceptableOrUnknown(
              data['receiver_id']!, _receiverIdMeta));
    } else if (isInserting) {
      context.missing(_receiverIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalMessage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      senderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_id'])!,
      receiverId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receiver_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalMessagesTable createAlias(String alias) {
    return $LocalMessagesTable(attachedDatabase, alias);
  }
}

class LocalMessage extends drift.DataClass
    implements drift.Insertable<LocalMessage> {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final bool isRead;
  final DateTime createdAt;
  const LocalMessage(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      required this.content,
      required this.isRead,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['sender_id'] = drift.Variable<String>(senderId);
    map['receiver_id'] = drift.Variable<String>(receiverId);
    map['content'] = drift.Variable<String>(content);
    map['is_read'] = drift.Variable<bool>(isRead);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalMessagesCompanion toCompanion(bool nullToAbsent) {
    return LocalMessagesCompanion(
      id: drift.Value(id),
      senderId: drift.Value(senderId),
      receiverId: drift.Value(receiverId),
      content: drift.Value(content),
      isRead: drift.Value(isRead),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalMessage(
      id: serializer.fromJson<String>(json['id']),
      senderId: serializer.fromJson<String>(json['senderId']),
      receiverId: serializer.fromJson<String>(json['receiverId']),
      content: serializer.fromJson<String>(json['content']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'senderId': serializer.toJson<String>(senderId),
      'receiverId': serializer.toJson<String>(receiverId),
      'content': serializer.toJson<String>(content),
      'isRead': serializer.toJson<bool>(isRead),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalMessage copyWith(
          {String? id,
          String? senderId,
          String? receiverId,
          String? content,
          bool? isRead,
          DateTime? createdAt}) =>
      LocalMessage(
        id: id ?? this.id,
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        content: content ?? this.content,
        isRead: isRead ?? this.isRead,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalMessage copyWithCompanion(LocalMessagesCompanion data) {
    return LocalMessage(
      id: data.id.present ? data.id.value : this.id,
      senderId: data.senderId.present ? data.senderId.value : this.senderId,
      receiverId:
          data.receiverId.present ? data.receiverId.value : this.receiverId,
      content: data.content.present ? data.content.value : this.content,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalMessage(')
          ..write('id: $id, ')
          ..write('senderId: $senderId, ')
          ..write('receiverId: $receiverId, ')
          ..write('content: $content, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, senderId, receiverId, content, isRead, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalMessage &&
          other.id == this.id &&
          other.senderId == this.senderId &&
          other.receiverId == this.receiverId &&
          other.content == this.content &&
          other.isRead == this.isRead &&
          other.createdAt == this.createdAt);
}

class LocalMessagesCompanion extends drift.UpdateCompanion<LocalMessage> {
  final drift.Value<String> id;
  final drift.Value<String> senderId;
  final drift.Value<String> receiverId;
  final drift.Value<String> content;
  final drift.Value<bool> isRead;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalMessagesCompanion({
    this.id = const drift.Value.absent(),
    this.senderId = const drift.Value.absent(),
    this.receiverId = const drift.Value.absent(),
    this.content = const drift.Value.absent(),
    this.isRead = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalMessagesCompanion.insert({
    required String id,
    required String senderId,
    required String receiverId,
    required String content,
    this.isRead = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        senderId = drift.Value(senderId),
        receiverId = drift.Value(receiverId),
        content = drift.Value(content);
  static drift.Insertable<LocalMessage> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? senderId,
    drift.Expression<String>? receiverId,
    drift.Expression<String>? content,
    drift.Expression<bool>? isRead,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (senderId != null) 'sender_id': senderId,
      if (receiverId != null) 'receiver_id': receiverId,
      if (content != null) 'content': content,
      if (isRead != null) 'is_read': isRead,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalMessagesCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? senderId,
      drift.Value<String>? receiverId,
      drift.Value<String>? content,
      drift.Value<bool>? isRead,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalMessagesCompanion(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      content: content ?? this.content,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (senderId.present) {
      map['sender_id'] = drift.Variable<String>(senderId.value);
    }
    if (receiverId.present) {
      map['receiver_id'] = drift.Variable<String>(receiverId.value);
    }
    if (content.present) {
      map['content'] = drift.Variable<String>(content.value);
    }
    if (isRead.present) {
      map['is_read'] = drift.Variable<bool>(isRead.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalMessagesCompanion(')
          ..write('id: $id, ')
          ..write('senderId: $senderId, ')
          ..write('receiverId: $receiverId, ')
          ..write('content: $content, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ServicesTable extends Services
    with drift.TableInfo<$ServicesTable, Service> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServicesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _serviceIdMeta =
      const drift.VerificationMeta('serviceId');
  @override
  late final drift.GeneratedColumn<String> serviceId =
      drift.GeneratedColumn<String>('service_id', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 36),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const drift.VerificationMeta _companyMeta =
      const drift.VerificationMeta('company');
  @override
  late final drift.GeneratedColumn<String> company =
      drift.GeneratedColumn<String>('company', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _servicedescMeta =
      const drift.VerificationMeta('servicedesc');
  @override
  late final drift.GeneratedColumn<String> servicedesc =
      drift.GeneratedColumn<String>('servicedesc', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _companylocationMeta =
      const drift.VerificationMeta('companylocation');
  @override
  late final drift.GeneratedColumn<String> companylocation =
      drift.GeneratedColumn<String>('companylocation', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _salaryMeta =
      const drift.VerificationMeta('salary');
  @override
  late final drift.GeneratedColumn<double> salary =
      drift.GeneratedColumn<double>('salary', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const drift.VerificationMeta _servicetypeMeta =
      const drift.VerificationMeta('servicetype');
  @override
  late final drift.GeneratedColumn<String> servicetype =
      drift.GeneratedColumn<String>('servicetype', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _useridMeta =
      const drift.VerificationMeta('userid');
  @override
  late final drift.GeneratedColumn<String> userid =
      drift.GeneratedColumn<String>('userid', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _lastUpdatedMeta =
      const drift.VerificationMeta('lastUpdated');
  @override
  late final drift.GeneratedColumn<DateTime> lastUpdated =
      drift.GeneratedColumn<DateTime>('last_updated', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        serviceId,
        company,
        servicedesc,
        companylocation,
        salary,
        servicetype,
        userid,
        lastUpdated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'services';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<Service> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_id')) {
      context.handle(_serviceIdMeta,
          serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta));
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    }
    if (data.containsKey('servicedesc')) {
      context.handle(
          _servicedescMeta,
          servicedesc.isAcceptableOrUnknown(
              data['servicedesc']!, _servicedescMeta));
    }
    if (data.containsKey('companylocation')) {
      context.handle(
          _companylocationMeta,
          companylocation.isAcceptableOrUnknown(
              data['companylocation']!, _companylocationMeta));
    }
    if (data.containsKey('salary')) {
      context.handle(_salaryMeta,
          salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta));
    }
    if (data.containsKey('servicetype')) {
      context.handle(
          _servicetypeMeta,
          servicetype.isAcceptableOrUnknown(
              data['servicetype']!, _servicetypeMeta));
    }
    if (data.containsKey('userid')) {
      context.handle(_useridMeta,
          userid.isAcceptableOrUnknown(data['userid']!, _useridMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  Service map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Service(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_id'])!,
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company']),
      servicedesc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}servicedesc']),
      companylocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}companylocation']),
      salary: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}salary']),
      servicetype: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}servicetype']),
      userid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}userid']),
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated']),
    );
  }

  @override
  $ServicesTable createAlias(String alias) {
    return $ServicesTable(attachedDatabase, alias);
  }
}

class Service extends drift.DataClass implements drift.Insertable<Service> {
  final int id;
  final String serviceId;
  final String? company;
  final String? servicedesc;
  final String? companylocation;
  final double? salary;
  final String? servicetype;
  final String? userid;
  final DateTime? lastUpdated;
  const Service(
      {required this.id,
      required this.serviceId,
      this.company,
      this.servicedesc,
      this.companylocation,
      this.salary,
      this.servicetype,
      this.userid,
      this.lastUpdated});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['service_id'] = drift.Variable<String>(serviceId);
    if (!nullToAbsent || company != null) {
      map['company'] = drift.Variable<String>(company);
    }
    if (!nullToAbsent || servicedesc != null) {
      map['servicedesc'] = drift.Variable<String>(servicedesc);
    }
    if (!nullToAbsent || companylocation != null) {
      map['companylocation'] = drift.Variable<String>(companylocation);
    }
    if (!nullToAbsent || salary != null) {
      map['salary'] = drift.Variable<double>(salary);
    }
    if (!nullToAbsent || servicetype != null) {
      map['servicetype'] = drift.Variable<String>(servicetype);
    }
    if (!nullToAbsent || userid != null) {
      map['userid'] = drift.Variable<String>(userid);
    }
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = drift.Variable<DateTime>(lastUpdated);
    }
    return map;
  }

  ServicesCompanion toCompanion(bool nullToAbsent) {
    return ServicesCompanion(
      id: drift.Value(id),
      serviceId: drift.Value(serviceId),
      company: company == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(company),
      servicedesc: servicedesc == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(servicedesc),
      companylocation: companylocation == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(companylocation),
      salary: salary == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(salary),
      servicetype: servicetype == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(servicetype),
      userid: userid == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(userid),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(lastUpdated),
    );
  }

  factory Service.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Service(
      id: serializer.fromJson<int>(json['id']),
      serviceId: serializer.fromJson<String>(json['serviceId']),
      company: serializer.fromJson<String?>(json['company']),
      servicedesc: serializer.fromJson<String?>(json['servicedesc']),
      companylocation: serializer.fromJson<String?>(json['companylocation']),
      salary: serializer.fromJson<double?>(json['salary']),
      servicetype: serializer.fromJson<String?>(json['servicetype']),
      userid: serializer.fromJson<String?>(json['userid']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serviceId': serializer.toJson<String>(serviceId),
      'company': serializer.toJson<String?>(company),
      'servicedesc': serializer.toJson<String?>(servicedesc),
      'companylocation': serializer.toJson<String?>(companylocation),
      'salary': serializer.toJson<double?>(salary),
      'servicetype': serializer.toJson<String?>(servicetype),
      'userid': serializer.toJson<String?>(userid),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
    };
  }

  Service copyWith(
          {int? id,
          String? serviceId,
          drift.Value<String?> company = const drift.Value.absent(),
          drift.Value<String?> servicedesc = const drift.Value.absent(),
          drift.Value<String?> companylocation = const drift.Value.absent(),
          drift.Value<double?> salary = const drift.Value.absent(),
          drift.Value<String?> servicetype = const drift.Value.absent(),
          drift.Value<String?> userid = const drift.Value.absent(),
          drift.Value<DateTime?> lastUpdated = const drift.Value.absent()}) =>
      Service(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        company: company.present ? company.value : this.company,
        servicedesc: servicedesc.present ? servicedesc.value : this.servicedesc,
        companylocation: companylocation.present
            ? companylocation.value
            : this.companylocation,
        salary: salary.present ? salary.value : this.salary,
        servicetype: servicetype.present ? servicetype.value : this.servicetype,
        userid: userid.present ? userid.value : this.userid,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
      );
  Service copyWithCompanion(ServicesCompanion data) {
    return Service(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      company: data.company.present ? data.company.value : this.company,
      servicedesc:
          data.servicedesc.present ? data.servicedesc.value : this.servicedesc,
      companylocation: data.companylocation.present
          ? data.companylocation.value
          : this.companylocation,
      salary: data.salary.present ? data.salary.value : this.salary,
      servicetype:
          data.servicetype.present ? data.servicetype.value : this.servicetype,
      userid: data.userid.present ? data.userid.value : this.userid,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Service(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('company: $company, ')
          ..write('servicedesc: $servicedesc, ')
          ..write('companylocation: $companylocation, ')
          ..write('salary: $salary, ')
          ..write('servicetype: $servicetype, ')
          ..write('userid: $userid, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, serviceId, company, servicedesc,
      companylocation, salary, servicetype, userid, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Service &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.company == this.company &&
          other.servicedesc == this.servicedesc &&
          other.companylocation == this.companylocation &&
          other.salary == this.salary &&
          other.servicetype == this.servicetype &&
          other.userid == this.userid &&
          other.lastUpdated == this.lastUpdated);
}

class ServicesCompanion extends drift.UpdateCompanion<Service> {
  final drift.Value<int> id;
  final drift.Value<String> serviceId;
  final drift.Value<String?> company;
  final drift.Value<String?> servicedesc;
  final drift.Value<String?> companylocation;
  final drift.Value<double?> salary;
  final drift.Value<String?> servicetype;
  final drift.Value<String?> userid;
  final drift.Value<DateTime?> lastUpdated;
  const ServicesCompanion({
    this.id = const drift.Value.absent(),
    this.serviceId = const drift.Value.absent(),
    this.company = const drift.Value.absent(),
    this.servicedesc = const drift.Value.absent(),
    this.companylocation = const drift.Value.absent(),
    this.salary = const drift.Value.absent(),
    this.servicetype = const drift.Value.absent(),
    this.userid = const drift.Value.absent(),
    this.lastUpdated = const drift.Value.absent(),
  });
  ServicesCompanion.insert({
    this.id = const drift.Value.absent(),
    required String serviceId,
    this.company = const drift.Value.absent(),
    this.servicedesc = const drift.Value.absent(),
    this.companylocation = const drift.Value.absent(),
    this.salary = const drift.Value.absent(),
    this.servicetype = const drift.Value.absent(),
    this.userid = const drift.Value.absent(),
    this.lastUpdated = const drift.Value.absent(),
  }) : serviceId = drift.Value(serviceId);
  static drift.Insertable<Service> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? serviceId,
    drift.Expression<String>? company,
    drift.Expression<String>? servicedesc,
    drift.Expression<String>? companylocation,
    drift.Expression<double>? salary,
    drift.Expression<String>? servicetype,
    drift.Expression<String>? userid,
    drift.Expression<DateTime>? lastUpdated,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (company != null) 'company': company,
      if (servicedesc != null) 'servicedesc': servicedesc,
      if (companylocation != null) 'companylocation': companylocation,
      if (salary != null) 'salary': salary,
      if (servicetype != null) 'servicetype': servicetype,
      if (userid != null) 'userid': userid,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  ServicesCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? serviceId,
      drift.Value<String?>? company,
      drift.Value<String?>? servicedesc,
      drift.Value<String?>? companylocation,
      drift.Value<double?>? salary,
      drift.Value<String?>? servicetype,
      drift.Value<String?>? userid,
      drift.Value<DateTime?>? lastUpdated}) {
    return ServicesCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      company: company ?? this.company,
      servicedesc: servicedesc ?? this.servicedesc,
      companylocation: companylocation ?? this.companylocation,
      salary: salary ?? this.salary,
      servicetype: servicetype ?? this.servicetype,
      userid: userid ?? this.userid,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = drift.Variable<String>(serviceId.value);
    }
    if (company.present) {
      map['company'] = drift.Variable<String>(company.value);
    }
    if (servicedesc.present) {
      map['servicedesc'] = drift.Variable<String>(servicedesc.value);
    }
    if (companylocation.present) {
      map['companylocation'] = drift.Variable<String>(companylocation.value);
    }
    if (salary.present) {
      map['salary'] = drift.Variable<double>(salary.value);
    }
    if (servicetype.present) {
      map['servicetype'] = drift.Variable<String>(servicetype.value);
    }
    if (userid.present) {
      map['userid'] = drift.Variable<String>(userid.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = drift.Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServicesCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('company: $company, ')
          ..write('servicedesc: $servicedesc, ')
          ..write('companylocation: $companylocation, ')
          ..write('salary: $salary, ')
          ..write('servicetype: $servicetype, ')
          ..write('userid: $userid, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

class $LocalBlogsTable extends LocalBlogs
    with drift.TableInfo<$LocalBlogsTable, LocalBlog> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalBlogsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _titleMeta =
      const drift.VerificationMeta('title');
  @override
  late final drift.GeneratedColumn<String> title =
      drift.GeneratedColumn<String>('title', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _descriptionMeta =
      const drift.VerificationMeta('description');
  @override
  late final drift.GeneratedColumn<String> description =
      drift.GeneratedColumn<String>('description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _imageMeta =
      const drift.VerificationMeta('image');
  @override
  late final drift.GeneratedColumn<String> image =
      drift.GeneratedColumn<String>('image', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _categoryMeta =
      const drift.VerificationMeta('category');
  @override
  late final drift.GeneratedColumn<String> category =
      drift.GeneratedColumn<String>('category', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _blogRatingMeta =
      const drift.VerificationMeta('blogRating');
  @override
  late final drift.GeneratedColumn<double> blogRating =
      drift.GeneratedColumn<double>('blog_rating', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const drift.VerificationMeta _locationMeta =
      const drift.VerificationMeta('location');
  @override
  late final drift.GeneratedColumn<String> location =
      drift.GeneratedColumn<String>('location', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const drift.VerificationMeta _usernameMeta =
      const drift.VerificationMeta('username');
  @override
  late final drift.GeneratedColumn<String> username =
      drift.GeneratedColumn<String>('username', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _userProfilePicMeta =
      const drift.VerificationMeta('userProfilePic');
  @override
  late final drift.GeneratedColumn<String> userProfilePic =
      drift.GeneratedColumn<String>('user_profile_pic', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        userId,
        title,
        description,
        image,
        category,
        blogRating,
        location,
        createdAt,
        username,
        userProfilePic
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_blogs';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalBlog> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('blog_rating')) {
      context.handle(
          _blogRatingMeta,
          blogRating.isAcceptableOrUnknown(
              data['blog_rating']!, _blogRatingMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    }
    if (data.containsKey('user_profile_pic')) {
      context.handle(
          _userProfilePicMeta,
          userProfilePic.isAcceptableOrUnknown(
              data['user_profile_pic']!, _userProfilePicMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalBlog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalBlog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      blogRating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}blog_rating']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username']),
      userProfilePic: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}user_profile_pic']),
    );
  }

  @override
  $LocalBlogsTable createAlias(String alias) {
    return $LocalBlogsTable(attachedDatabase, alias);
  }
}

class LocalBlog extends drift.DataClass implements drift.Insertable<LocalBlog> {
  final String id;
  final String? userId;
  final String? title;
  final String? description;
  final String? image;
  final String? category;
  final double? blogRating;
  final String? location;
  final DateTime? createdAt;
  final String? username;
  final String? userProfilePic;
  const LocalBlog(
      {required this.id,
      this.userId,
      this.title,
      this.description,
      this.image,
      this.category,
      this.blogRating,
      this.location,
      this.createdAt,
      this.username,
      this.userProfilePic});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = drift.Variable<String>(userId);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = drift.Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = drift.Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = drift.Variable<String>(image);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = drift.Variable<String>(category);
    }
    if (!nullToAbsent || blogRating != null) {
      map['blog_rating'] = drift.Variable<double>(blogRating);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = drift.Variable<String>(location);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = drift.Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = drift.Variable<String>(username);
    }
    if (!nullToAbsent || userProfilePic != null) {
      map['user_profile_pic'] = drift.Variable<String>(userProfilePic);
    }
    return map;
  }

  LocalBlogsCompanion toCompanion(bool nullToAbsent) {
    return LocalBlogsCompanion(
      id: drift.Value(id),
      userId: userId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(userId),
      title: title == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(title),
      description: description == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(description),
      image: image == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(image),
      category: category == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(category),
      blogRating: blogRating == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(blogRating),
      location: location == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(location),
      createdAt: createdAt == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(createdAt),
      username: username == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(username),
      userProfilePic: userProfilePic == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(userProfilePic),
    );
  }

  factory LocalBlog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalBlog(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
      category: serializer.fromJson<String?>(json['category']),
      blogRating: serializer.fromJson<double?>(json['blogRating']),
      location: serializer.fromJson<String?>(json['location']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      username: serializer.fromJson<String?>(json['username']),
      userProfilePic: serializer.fromJson<String?>(json['userProfilePic']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<String?>(image),
      'category': serializer.toJson<String?>(category),
      'blogRating': serializer.toJson<double?>(blogRating),
      'location': serializer.toJson<String?>(location),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'username': serializer.toJson<String?>(username),
      'userProfilePic': serializer.toJson<String?>(userProfilePic),
    };
  }

  LocalBlog copyWith(
          {String? id,
          drift.Value<String?> userId = const drift.Value.absent(),
          drift.Value<String?> title = const drift.Value.absent(),
          drift.Value<String?> description = const drift.Value.absent(),
          drift.Value<String?> image = const drift.Value.absent(),
          drift.Value<String?> category = const drift.Value.absent(),
          drift.Value<double?> blogRating = const drift.Value.absent(),
          drift.Value<String?> location = const drift.Value.absent(),
          drift.Value<DateTime?> createdAt = const drift.Value.absent(),
          drift.Value<String?> username = const drift.Value.absent(),
          drift.Value<String?> userProfilePic = const drift.Value.absent()}) =>
      LocalBlog(
        id: id ?? this.id,
        userId: userId.present ? userId.value : this.userId,
        title: title.present ? title.value : this.title,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
        category: category.present ? category.value : this.category,
        blogRating: blogRating.present ? blogRating.value : this.blogRating,
        location: location.present ? location.value : this.location,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        username: username.present ? username.value : this.username,
        userProfilePic:
            userProfilePic.present ? userProfilePic.value : this.userProfilePic,
      );
  LocalBlog copyWithCompanion(LocalBlogsCompanion data) {
    return LocalBlog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      category: data.category.present ? data.category.value : this.category,
      blogRating:
          data.blogRating.present ? data.blogRating.value : this.blogRating,
      location: data.location.present ? data.location.value : this.location,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      username: data.username.present ? data.username.value : this.username,
      userProfilePic: data.userProfilePic.present
          ? data.userProfilePic.value
          : this.userProfilePic,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('category: $category, ')
          ..write('blogRating: $blogRating, ')
          ..write('location: $location, ')
          ..write('createdAt: $createdAt, ')
          ..write('username: $username, ')
          ..write('userProfilePic: $userProfilePic')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, title, description, image,
      category, blogRating, location, createdAt, username, userProfilePic);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalBlog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.description == this.description &&
          other.image == this.image &&
          other.category == this.category &&
          other.blogRating == this.blogRating &&
          other.location == this.location &&
          other.createdAt == this.createdAt &&
          other.username == this.username &&
          other.userProfilePic == this.userProfilePic);
}

class LocalBlogsCompanion extends drift.UpdateCompanion<LocalBlog> {
  final drift.Value<String> id;
  final drift.Value<String?> userId;
  final drift.Value<String?> title;
  final drift.Value<String?> description;
  final drift.Value<String?> image;
  final drift.Value<String?> category;
  final drift.Value<double?> blogRating;
  final drift.Value<String?> location;
  final drift.Value<DateTime?> createdAt;
  final drift.Value<String?> username;
  final drift.Value<String?> userProfilePic;
  final drift.Value<int> rowid;
  const LocalBlogsCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.title = const drift.Value.absent(),
    this.description = const drift.Value.absent(),
    this.image = const drift.Value.absent(),
    this.category = const drift.Value.absent(),
    this.blogRating = const drift.Value.absent(),
    this.location = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.username = const drift.Value.absent(),
    this.userProfilePic = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalBlogsCompanion.insert({
    required String id,
    this.userId = const drift.Value.absent(),
    this.title = const drift.Value.absent(),
    this.description = const drift.Value.absent(),
    this.image = const drift.Value.absent(),
    this.category = const drift.Value.absent(),
    this.blogRating = const drift.Value.absent(),
    this.location = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.username = const drift.Value.absent(),
    this.userProfilePic = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id);
  static drift.Insertable<LocalBlog> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<String>? title,
    drift.Expression<String>? description,
    drift.Expression<String>? image,
    drift.Expression<String>? category,
    drift.Expression<double>? blogRating,
    drift.Expression<String>? location,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<String>? username,
    drift.Expression<String>? userProfilePic,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (category != null) 'category': category,
      if (blogRating != null) 'blog_rating': blogRating,
      if (location != null) 'location': location,
      if (createdAt != null) 'created_at': createdAt,
      if (username != null) 'username': username,
      if (userProfilePic != null) 'user_profile_pic': userProfilePic,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalBlogsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String?>? userId,
      drift.Value<String?>? title,
      drift.Value<String?>? description,
      drift.Value<String?>? image,
      drift.Value<String?>? category,
      drift.Value<double?>? blogRating,
      drift.Value<String?>? location,
      drift.Value<DateTime?>? createdAt,
      drift.Value<String?>? username,
      drift.Value<String?>? userProfilePic,
      drift.Value<int>? rowid}) {
    return LocalBlogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      category: category ?? this.category,
      blogRating: blogRating ?? this.blogRating,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      username: username ?? this.username,
      userProfilePic: userProfilePic ?? this.userProfilePic,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (title.present) {
      map['title'] = drift.Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = drift.Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = drift.Variable<String>(image.value);
    }
    if (category.present) {
      map['category'] = drift.Variable<String>(category.value);
    }
    if (blogRating.present) {
      map['blog_rating'] = drift.Variable<double>(blogRating.value);
    }
    if (location.present) {
      map['location'] = drift.Variable<String>(location.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (username.present) {
      map['username'] = drift.Variable<String>(username.value);
    }
    if (userProfilePic.present) {
      map['user_profile_pic'] = drift.Variable<String>(userProfilePic.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('category: $category, ')
          ..write('blogRating: $blogRating, ')
          ..write('location: $location, ')
          ..write('createdAt: $createdAt, ')
          ..write('username: $username, ')
          ..write('userProfilePic: $userProfilePic, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalBlogRatingsTable extends LocalBlogRatings
    with drift.TableInfo<$LocalBlogRatingsTable, LocalBlogRating> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalBlogRatingsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _blogIdMeta =
      const drift.VerificationMeta('blogId');
  @override
  late final drift.GeneratedColumn<String> blogId =
      drift.GeneratedColumn<String>('blog_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _ratingMeta =
      const drift.VerificationMeta('rating');
  @override
  late final drift.GeneratedColumn<int> rating = drift.GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [blogId, userId, rating, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_blog_ratings';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalBlogRating> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {blogId, userId};
  @override
  LocalBlogRating map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalBlogRating(
      blogId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blog_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalBlogRatingsTable createAlias(String alias) {
    return $LocalBlogRatingsTable(attachedDatabase, alias);
  }
}

class LocalBlogRating extends drift.DataClass
    implements drift.Insertable<LocalBlogRating> {
  final String blogId;
  final String userId;
  final int rating;
  final DateTime createdAt;
  const LocalBlogRating(
      {required this.blogId,
      required this.userId,
      required this.rating,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['blog_id'] = drift.Variable<String>(blogId);
    map['user_id'] = drift.Variable<String>(userId);
    map['rating'] = drift.Variable<int>(rating);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalBlogRatingsCompanion toCompanion(bool nullToAbsent) {
    return LocalBlogRatingsCompanion(
      blogId: drift.Value(blogId),
      userId: drift.Value(userId),
      rating: drift.Value(rating),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalBlogRating.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalBlogRating(
      blogId: serializer.fromJson<String>(json['blogId']),
      userId: serializer.fromJson<String>(json['userId']),
      rating: serializer.fromJson<int>(json['rating']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'blogId': serializer.toJson<String>(blogId),
      'userId': serializer.toJson<String>(userId),
      'rating': serializer.toJson<int>(rating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalBlogRating copyWith(
          {String? blogId, String? userId, int? rating, DateTime? createdAt}) =>
      LocalBlogRating(
        blogId: blogId ?? this.blogId,
        userId: userId ?? this.userId,
        rating: rating ?? this.rating,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalBlogRating copyWithCompanion(LocalBlogRatingsCompanion data) {
    return LocalBlogRating(
      blogId: data.blogId.present ? data.blogId.value : this.blogId,
      userId: data.userId.present ? data.userId.value : this.userId,
      rating: data.rating.present ? data.rating.value : this.rating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogRating(')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(blogId, userId, rating, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalBlogRating &&
          other.blogId == this.blogId &&
          other.userId == this.userId &&
          other.rating == this.rating &&
          other.createdAt == this.createdAt);
}

class LocalBlogRatingsCompanion extends drift.UpdateCompanion<LocalBlogRating> {
  final drift.Value<String> blogId;
  final drift.Value<String> userId;
  final drift.Value<int> rating;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalBlogRatingsCompanion({
    this.blogId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.rating = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalBlogRatingsCompanion.insert({
    required String blogId,
    required String userId,
    required int rating,
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : blogId = drift.Value(blogId),
        userId = drift.Value(userId),
        rating = drift.Value(rating);
  static drift.Insertable<LocalBlogRating> custom({
    drift.Expression<String>? blogId,
    drift.Expression<String>? userId,
    drift.Expression<int>? rating,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (blogId != null) 'blog_id': blogId,
      if (userId != null) 'user_id': userId,
      if (rating != null) 'rating': rating,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalBlogRatingsCompanion copyWith(
      {drift.Value<String>? blogId,
      drift.Value<String>? userId,
      drift.Value<int>? rating,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalBlogRatingsCompanion(
      blogId: blogId ?? this.blogId,
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (blogId.present) {
      map['blog_id'] = drift.Variable<String>(blogId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (rating.present) {
      map['rating'] = drift.Variable<int>(rating.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogRatingsCompanion(')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalBlogLikesTable extends LocalBlogLikes
    with drift.TableInfo<$LocalBlogLikesTable, LocalBlogLike> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalBlogLikesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _blogIdMeta =
      const drift.VerificationMeta('blogId');
  @override
  late final drift.GeneratedColumn<String> blogId =
      drift.GeneratedColumn<String>('blog_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns => [id, blogId, userId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_blog_likes';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalBlogLike> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('blog_id')) {
      context.handle(_blogIdMeta,
          blogId.isAcceptableOrUnknown(data['blog_id']!, _blogIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalBlogLike map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalBlogLike(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      blogId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blog_id']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalBlogLikesTable createAlias(String alias) {
    return $LocalBlogLikesTable(attachedDatabase, alias);
  }
}

class LocalBlogLike extends drift.DataClass
    implements drift.Insertable<LocalBlogLike> {
  final String id;
  final String? blogId;
  final String? userId;
  final DateTime createdAt;
  const LocalBlogLike(
      {required this.id, this.blogId, this.userId, required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    if (!nullToAbsent || blogId != null) {
      map['blog_id'] = drift.Variable<String>(blogId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = drift.Variable<String>(userId);
    }
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalBlogLikesCompanion toCompanion(bool nullToAbsent) {
    return LocalBlogLikesCompanion(
      id: drift.Value(id),
      blogId: blogId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(blogId),
      userId: userId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(userId),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalBlogLike.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalBlogLike(
      id: serializer.fromJson<String>(json['id']),
      blogId: serializer.fromJson<String?>(json['blogId']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'blogId': serializer.toJson<String?>(blogId),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalBlogLike copyWith(
          {String? id,
          drift.Value<String?> blogId = const drift.Value.absent(),
          drift.Value<String?> userId = const drift.Value.absent(),
          DateTime? createdAt}) =>
      LocalBlogLike(
        id: id ?? this.id,
        blogId: blogId.present ? blogId.value : this.blogId,
        userId: userId.present ? userId.value : this.userId,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalBlogLike copyWithCompanion(LocalBlogLikesCompanion data) {
    return LocalBlogLike(
      id: data.id.present ? data.id.value : this.id,
      blogId: data.blogId.present ? data.blogId.value : this.blogId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogLike(')
          ..write('id: $id, ')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, blogId, userId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalBlogLike &&
          other.id == this.id &&
          other.blogId == this.blogId &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt);
}

class LocalBlogLikesCompanion extends drift.UpdateCompanion<LocalBlogLike> {
  final drift.Value<String> id;
  final drift.Value<String?> blogId;
  final drift.Value<String?> userId;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalBlogLikesCompanion({
    this.id = const drift.Value.absent(),
    this.blogId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalBlogLikesCompanion.insert({
    required String id,
    this.blogId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id);
  static drift.Insertable<LocalBlogLike> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? blogId,
    drift.Expression<String>? userId,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (blogId != null) 'blog_id': blogId,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalBlogLikesCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String?>? blogId,
      drift.Value<String?>? userId,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalBlogLikesCompanion(
      id: id ?? this.id,
      blogId: blogId ?? this.blogId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (blogId.present) {
      map['blog_id'] = drift.Variable<String>(blogId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogLikesCompanion(')
          ..write('id: $id, ')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalJobsTable extends LocalJobs
    with drift.TableInfo<$LocalJobsTable, LocalJob> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalJobsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _jobTitleMeta =
      const drift.VerificationMeta('jobTitle');
  @override
  late final drift.GeneratedColumn<String> jobTitle =
      drift.GeneratedColumn<String>('job_title', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _jobDescMeta =
      const drift.VerificationMeta('jobDesc');
  @override
  late final drift.GeneratedColumn<String> jobDesc =
      drift.GeneratedColumn<String>('job_desc', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _jobLocationMeta =
      const drift.VerificationMeta('jobLocation');
  @override
  late final drift.GeneratedColumn<String> jobLocation =
      drift.GeneratedColumn<String>('job_location', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _contactMeta =
      const drift.VerificationMeta('contact');
  @override
  late final drift.GeneratedColumn<String> contact =
      drift.GeneratedColumn<String>('contact', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _slotsMeta =
      const drift.VerificationMeta('slots');
  @override
  late final drift.GeneratedColumn<int> slots = drift.GeneratedColumn<int>(
      'slots', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _salaryMeta =
      const drift.VerificationMeta('salary');
  @override
  late final drift.GeneratedColumn<double> salary =
      drift.GeneratedColumn<double>('salary', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _postDurationMeta =
      const drift.VerificationMeta('postDuration');
  @override
  late final drift.GeneratedColumn<DateTime> postDuration =
      drift.GeneratedColumn<DateTime>('post_duration', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        userId,
        jobTitle,
        jobDesc,
        jobLocation,
        contact,
        slots,
        salary,
        postDuration,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_jobs';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalJob> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('job_title')) {
      context.handle(_jobTitleMeta,
          jobTitle.isAcceptableOrUnknown(data['job_title']!, _jobTitleMeta));
    } else if (isInserting) {
      context.missing(_jobTitleMeta);
    }
    if (data.containsKey('job_desc')) {
      context.handle(_jobDescMeta,
          jobDesc.isAcceptableOrUnknown(data['job_desc']!, _jobDescMeta));
    } else if (isInserting) {
      context.missing(_jobDescMeta);
    }
    if (data.containsKey('job_location')) {
      context.handle(
          _jobLocationMeta,
          jobLocation.isAcceptableOrUnknown(
              data['job_location']!, _jobLocationMeta));
    } else if (isInserting) {
      context.missing(_jobLocationMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('slots')) {
      context.handle(
          _slotsMeta, slots.isAcceptableOrUnknown(data['slots']!, _slotsMeta));
    } else if (isInserting) {
      context.missing(_slotsMeta);
    }
    if (data.containsKey('salary')) {
      context.handle(_salaryMeta,
          salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta));
    } else if (isInserting) {
      context.missing(_salaryMeta);
    }
    if (data.containsKey('post_duration')) {
      context.handle(
          _postDurationMeta,
          postDuration.isAcceptableOrUnknown(
              data['post_duration']!, _postDurationMeta));
    } else if (isInserting) {
      context.missing(_postDurationMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalJob map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalJob(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      jobTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_title'])!,
      jobDesc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_desc'])!,
      jobLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_location'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact'])!,
      slots: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}slots'])!,
      salary: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}salary'])!,
      postDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}post_duration'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalJobsTable createAlias(String alias) {
    return $LocalJobsTable(attachedDatabase, alias);
  }
}

class LocalJob extends drift.DataClass implements drift.Insertable<LocalJob> {
  final String id;
  final String userId;
  final String jobTitle;
  final String jobDesc;
  final String jobLocation;
  final String contact;
  final int slots;
  final double salary;
  final DateTime postDuration;
  final DateTime createdAt;
  const LocalJob(
      {required this.id,
      required this.userId,
      required this.jobTitle,
      required this.jobDesc,
      required this.jobLocation,
      required this.contact,
      required this.slots,
      required this.salary,
      required this.postDuration,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['user_id'] = drift.Variable<String>(userId);
    map['job_title'] = drift.Variable<String>(jobTitle);
    map['job_desc'] = drift.Variable<String>(jobDesc);
    map['job_location'] = drift.Variable<String>(jobLocation);
    map['contact'] = drift.Variable<String>(contact);
    map['slots'] = drift.Variable<int>(slots);
    map['salary'] = drift.Variable<double>(salary);
    map['post_duration'] = drift.Variable<DateTime>(postDuration);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalJobsCompanion toCompanion(bool nullToAbsent) {
    return LocalJobsCompanion(
      id: drift.Value(id),
      userId: drift.Value(userId),
      jobTitle: drift.Value(jobTitle),
      jobDesc: drift.Value(jobDesc),
      jobLocation: drift.Value(jobLocation),
      contact: drift.Value(contact),
      slots: drift.Value(slots),
      salary: drift.Value(salary),
      postDuration: drift.Value(postDuration),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalJob.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalJob(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      jobTitle: serializer.fromJson<String>(json['jobTitle']),
      jobDesc: serializer.fromJson<String>(json['jobDesc']),
      jobLocation: serializer.fromJson<String>(json['jobLocation']),
      contact: serializer.fromJson<String>(json['contact']),
      slots: serializer.fromJson<int>(json['slots']),
      salary: serializer.fromJson<double>(json['salary']),
      postDuration: serializer.fromJson<DateTime>(json['postDuration']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'jobTitle': serializer.toJson<String>(jobTitle),
      'jobDesc': serializer.toJson<String>(jobDesc),
      'jobLocation': serializer.toJson<String>(jobLocation),
      'contact': serializer.toJson<String>(contact),
      'slots': serializer.toJson<int>(slots),
      'salary': serializer.toJson<double>(salary),
      'postDuration': serializer.toJson<DateTime>(postDuration),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalJob copyWith(
          {String? id,
          String? userId,
          String? jobTitle,
          String? jobDesc,
          String? jobLocation,
          String? contact,
          int? slots,
          double? salary,
          DateTime? postDuration,
          DateTime? createdAt}) =>
      LocalJob(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        jobTitle: jobTitle ?? this.jobTitle,
        jobDesc: jobDesc ?? this.jobDesc,
        jobLocation: jobLocation ?? this.jobLocation,
        contact: contact ?? this.contact,
        slots: slots ?? this.slots,
        salary: salary ?? this.salary,
        postDuration: postDuration ?? this.postDuration,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalJob copyWithCompanion(LocalJobsCompanion data) {
    return LocalJob(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      jobTitle: data.jobTitle.present ? data.jobTitle.value : this.jobTitle,
      jobDesc: data.jobDesc.present ? data.jobDesc.value : this.jobDesc,
      jobLocation:
          data.jobLocation.present ? data.jobLocation.value : this.jobLocation,
      contact: data.contact.present ? data.contact.value : this.contact,
      slots: data.slots.present ? data.slots.value : this.slots,
      salary: data.salary.present ? data.salary.value : this.salary,
      postDuration: data.postDuration.present
          ? data.postDuration.value
          : this.postDuration,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalJob(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('jobDesc: $jobDesc, ')
          ..write('jobLocation: $jobLocation, ')
          ..write('contact: $contact, ')
          ..write('slots: $slots, ')
          ..write('salary: $salary, ')
          ..write('postDuration: $postDuration, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, jobTitle, jobDesc, jobLocation,
      contact, slots, salary, postDuration, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalJob &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.jobTitle == this.jobTitle &&
          other.jobDesc == this.jobDesc &&
          other.jobLocation == this.jobLocation &&
          other.contact == this.contact &&
          other.slots == this.slots &&
          other.salary == this.salary &&
          other.postDuration == this.postDuration &&
          other.createdAt == this.createdAt);
}

class LocalJobsCompanion extends drift.UpdateCompanion<LocalJob> {
  final drift.Value<String> id;
  final drift.Value<String> userId;
  final drift.Value<String> jobTitle;
  final drift.Value<String> jobDesc;
  final drift.Value<String> jobLocation;
  final drift.Value<String> contact;
  final drift.Value<int> slots;
  final drift.Value<double> salary;
  final drift.Value<DateTime> postDuration;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalJobsCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.jobTitle = const drift.Value.absent(),
    this.jobDesc = const drift.Value.absent(),
    this.jobLocation = const drift.Value.absent(),
    this.contact = const drift.Value.absent(),
    this.slots = const drift.Value.absent(),
    this.salary = const drift.Value.absent(),
    this.postDuration = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalJobsCompanion.insert({
    required String id,
    required String userId,
    required String jobTitle,
    required String jobDesc,
    required String jobLocation,
    required String contact,
    required int slots,
    required double salary,
    required DateTime postDuration,
    required DateTime createdAt,
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        userId = drift.Value(userId),
        jobTitle = drift.Value(jobTitle),
        jobDesc = drift.Value(jobDesc),
        jobLocation = drift.Value(jobLocation),
        contact = drift.Value(contact),
        slots = drift.Value(slots),
        salary = drift.Value(salary),
        postDuration = drift.Value(postDuration),
        createdAt = drift.Value(createdAt);
  static drift.Insertable<LocalJob> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<String>? jobTitle,
    drift.Expression<String>? jobDesc,
    drift.Expression<String>? jobLocation,
    drift.Expression<String>? contact,
    drift.Expression<int>? slots,
    drift.Expression<double>? salary,
    drift.Expression<DateTime>? postDuration,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (jobTitle != null) 'job_title': jobTitle,
      if (jobDesc != null) 'job_desc': jobDesc,
      if (jobLocation != null) 'job_location': jobLocation,
      if (contact != null) 'contact': contact,
      if (slots != null) 'slots': slots,
      if (salary != null) 'salary': salary,
      if (postDuration != null) 'post_duration': postDuration,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalJobsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? userId,
      drift.Value<String>? jobTitle,
      drift.Value<String>? jobDesc,
      drift.Value<String>? jobLocation,
      drift.Value<String>? contact,
      drift.Value<int>? slots,
      drift.Value<double>? salary,
      drift.Value<DateTime>? postDuration,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalJobsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      jobTitle: jobTitle ?? this.jobTitle,
      jobDesc: jobDesc ?? this.jobDesc,
      jobLocation: jobLocation ?? this.jobLocation,
      contact: contact ?? this.contact,
      slots: slots ?? this.slots,
      salary: salary ?? this.salary,
      postDuration: postDuration ?? this.postDuration,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (jobTitle.present) {
      map['job_title'] = drift.Variable<String>(jobTitle.value);
    }
    if (jobDesc.present) {
      map['job_desc'] = drift.Variable<String>(jobDesc.value);
    }
    if (jobLocation.present) {
      map['job_location'] = drift.Variable<String>(jobLocation.value);
    }
    if (contact.present) {
      map['contact'] = drift.Variable<String>(contact.value);
    }
    if (slots.present) {
      map['slots'] = drift.Variable<int>(slots.value);
    }
    if (salary.present) {
      map['salary'] = drift.Variable<double>(salary.value);
    }
    if (postDuration.present) {
      map['post_duration'] = drift.Variable<DateTime>(postDuration.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalJobsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('jobDesc: $jobDesc, ')
          ..write('jobLocation: $jobLocation, ')
          ..write('contact: $contact, ')
          ..write('slots: $slots, ')
          ..write('salary: $salary, ')
          ..write('postDuration: $postDuration, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalFollowsTable extends LocalFollows
    with drift.TableInfo<$LocalFollowsTable, LocalFollow> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalFollowsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _followerIdMeta =
      const drift.VerificationMeta('followerId');
  @override
  late final drift.GeneratedColumn<String> followerId =
      drift.GeneratedColumn<String>('follower_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _followedIdMeta =
      const drift.VerificationMeta('followedId');
  @override
  late final drift.GeneratedColumn<String> followedId =
      drift.GeneratedColumn<String>('followed_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [followerId, followedId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_follows';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalFollow> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {followerId, followedId};
  @override
  LocalFollow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFollow(
      followerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}follower_id'])!,
      followedId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}followed_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalFollowsTable createAlias(String alias) {
    return $LocalFollowsTable(attachedDatabase, alias);
  }
}

class LocalFollow extends drift.DataClass
    implements drift.Insertable<LocalFollow> {
  final String followerId;
  final String followedId;
  final DateTime createdAt;
  const LocalFollow(
      {required this.followerId,
      required this.followedId,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['follower_id'] = drift.Variable<String>(followerId);
    map['followed_id'] = drift.Variable<String>(followedId);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalFollowsCompanion toCompanion(bool nullToAbsent) {
    return LocalFollowsCompanion(
      followerId: drift.Value(followerId),
      followedId: drift.Value(followedId),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalFollow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalFollow(
      followerId: serializer.fromJson<String>(json['followerId']),
      followedId: serializer.fromJson<String>(json['followedId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'followerId': serializer.toJson<String>(followerId),
      'followedId': serializer.toJson<String>(followedId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalFollow copyWith(
          {String? followerId, String? followedId, DateTime? createdAt}) =>
      LocalFollow(
        followerId: followerId ?? this.followerId,
        followedId: followedId ?? this.followedId,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalFollow copyWithCompanion(LocalFollowsCompanion data) {
    return LocalFollow(
      followerId:
          data.followerId.present ? data.followerId.value : this.followerId,
      followedId:
          data.followedId.present ? data.followedId.value : this.followedId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFollow(')
          ..write('followerId: $followerId, ')
          ..write('followedId: $followedId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(followerId, followedId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFollow &&
          other.followerId == this.followerId &&
          other.followedId == this.followedId &&
          other.createdAt == this.createdAt);
}

class LocalFollowsCompanion extends drift.UpdateCompanion<LocalFollow> {
  final drift.Value<String> followerId;
  final drift.Value<String> followedId;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalFollowsCompanion({
    this.followerId = const drift.Value.absent(),
    this.followedId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalFollowsCompanion.insert({
    required String followerId,
    required String followedId,
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : followerId = drift.Value(followerId),
        followedId = drift.Value(followedId);
  static drift.Insertable<LocalFollow> custom({
    drift.Expression<String>? followerId,
    drift.Expression<String>? followedId,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (followerId != null) 'follower_id': followerId,
      if (followedId != null) 'followed_id': followedId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalFollowsCompanion copyWith(
      {drift.Value<String>? followerId,
      drift.Value<String>? followedId,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalFollowsCompanion(
      followerId: followerId ?? this.followerId,
      followedId: followedId ?? this.followedId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (followerId.present) {
      map['follower_id'] = drift.Variable<String>(followerId.value);
    }
    if (followedId.present) {
      map['followed_id'] = drift.Variable<String>(followedId.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalFollowsCompanion(')
          ..write('followerId: $followerId, ')
          ..write('followedId: $followedId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions
    with drift.TableInfo<$SessionsTable, Session> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _isLoggedInMeta =
      const drift.VerificationMeta('isLoggedIn');
  @override
  late final drift.GeneratedColumn<bool> isLoggedIn =
      drift.GeneratedColumn<bool>('is_logged_in', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_logged_in" IN (0, 1))'));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, isLoggedIn, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<Session> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('is_logged_in')) {
      context.handle(
          _isLoggedInMeta,
          isLoggedIn.isAcceptableOrUnknown(
              data['is_logged_in']!, _isLoggedInMeta));
    } else if (isInserting) {
      context.missing(_isLoggedInMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      isLoggedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_logged_in'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends drift.DataClass implements drift.Insertable<Session> {
  final String id;
  final bool isLoggedIn;
  final DateTime createdAt;
  const Session(
      {required this.id, required this.isLoggedIn, required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['is_logged_in'] = drift.Variable<bool>(isLoggedIn);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: drift.Value(id),
      isLoggedIn: drift.Value(isLoggedIn),
      createdAt: drift.Value(createdAt),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<String>(json['id']),
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Session copyWith({String? id, bool? isLoggedIn, DateTime? createdAt}) =>
      Session(
        id: id ?? this.id,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        createdAt: createdAt ?? this.createdAt,
      );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      isLoggedIn:
          data.isLoggedIn.present ? data.isLoggedIn.value : this.isLoggedIn,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isLoggedIn, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.isLoggedIn == this.isLoggedIn &&
          other.createdAt == this.createdAt);
}

class SessionsCompanion extends drift.UpdateCompanion<Session> {
  final drift.Value<String> id;
  final drift.Value<bool> isLoggedIn;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const SessionsCompanion({
    this.id = const drift.Value.absent(),
    this.isLoggedIn = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  SessionsCompanion.insert({
    required String id,
    required bool isLoggedIn,
    required DateTime createdAt,
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        isLoggedIn = drift.Value(isLoggedIn),
        createdAt = drift.Value(createdAt);
  static drift.Insertable<Session> custom({
    drift.Expression<String>? id,
    drift.Expression<bool>? isLoggedIn,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<bool>? isLoggedIn,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return SessionsCompanion(
      id: id ?? this.id,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (isLoggedIn.present) {
      map['is_logged_in'] = drift.Variable<bool>(isLoggedIn.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConversationsTable extends Conversations
    with drift.TableInfo<$ConversationsTable, Conversation> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _usernameMeta =
      const drift.VerificationMeta('username');
  @override
  late final drift.GeneratedColumn<String> username =
      drift.GeneratedColumn<String>('username', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _profilePicMeta =
      const drift.VerificationMeta('profilePic');
  @override
  late final drift.GeneratedColumn<String> profilePic =
      drift.GeneratedColumn<String>('profile_pic', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _lastMessageMeta =
      const drift.VerificationMeta('lastMessage');
  @override
  late final drift.GeneratedColumn<String> lastMessage =
      drift.GeneratedColumn<String>('last_message', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _lastMessageTimeMeta =
      const drift.VerificationMeta('lastMessageTime');
  @override
  late final drift.GeneratedColumn<DateTime> lastMessageTime =
      drift.GeneratedColumn<DateTime>('last_message_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const drift.VerificationMeta _unreadCountMeta =
      const drift.VerificationMeta('unreadCount');
  @override
  late final drift.GeneratedColumn<int> unreadCount =
      drift.GeneratedColumn<int>('unread_count', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0));
  @override
  List<drift.GeneratedColumn> get $columns => [
        id,
        userId,
        username,
        profilePic,
        lastMessage,
        lastMessageTime,
        unreadCount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conversations';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<Conversation> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('profile_pic')) {
      context.handle(
          _profilePicMeta,
          profilePic.isAcceptableOrUnknown(
              data['profile_pic']!, _profilePicMeta));
    }
    if (data.containsKey('last_message')) {
      context.handle(
          _lastMessageMeta,
          lastMessage.isAcceptableOrUnknown(
              data['last_message']!, _lastMessageMeta));
    }
    if (data.containsKey('last_message_time')) {
      context.handle(
          _lastMessageTimeMeta,
          lastMessageTime.isAcceptableOrUnknown(
              data['last_message_time']!, _lastMessageTimeMeta));
    }
    if (data.containsKey('unread_count')) {
      context.handle(
          _unreadCountMeta,
          unreadCount.isAcceptableOrUnknown(
              data['unread_count']!, _unreadCountMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  Conversation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Conversation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      profilePic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_pic']),
      lastMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_message']),
      lastMessageTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_message_time']),
      unreadCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unread_count'])!,
    );
  }

  @override
  $ConversationsTable createAlias(String alias) {
    return $ConversationsTable(attachedDatabase, alias);
  }
}

class Conversation extends drift.DataClass
    implements drift.Insertable<Conversation> {
  final String id;
  final String userId;
  final String username;
  final String? profilePic;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final int unreadCount;
  const Conversation(
      {required this.id,
      required this.userId,
      required this.username,
      this.profilePic,
      this.lastMessage,
      this.lastMessageTime,
      required this.unreadCount});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['user_id'] = drift.Variable<String>(userId);
    map['username'] = drift.Variable<String>(username);
    if (!nullToAbsent || profilePic != null) {
      map['profile_pic'] = drift.Variable<String>(profilePic);
    }
    if (!nullToAbsent || lastMessage != null) {
      map['last_message'] = drift.Variable<String>(lastMessage);
    }
    if (!nullToAbsent || lastMessageTime != null) {
      map['last_message_time'] = drift.Variable<DateTime>(lastMessageTime);
    }
    map['unread_count'] = drift.Variable<int>(unreadCount);
    return map;
  }

  ConversationsCompanion toCompanion(bool nullToAbsent) {
    return ConversationsCompanion(
      id: drift.Value(id),
      userId: drift.Value(userId),
      username: drift.Value(username),
      profilePic: profilePic == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(profilePic),
      lastMessage: lastMessage == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(lastMessage),
      lastMessageTime: lastMessageTime == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(lastMessageTime),
      unreadCount: drift.Value(unreadCount),
    );
  }

  factory Conversation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Conversation(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      username: serializer.fromJson<String>(json['username']),
      profilePic: serializer.fromJson<String?>(json['profilePic']),
      lastMessage: serializer.fromJson<String?>(json['lastMessage']),
      lastMessageTime: serializer.fromJson<DateTime?>(json['lastMessageTime']),
      unreadCount: serializer.fromJson<int>(json['unreadCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'username': serializer.toJson<String>(username),
      'profilePic': serializer.toJson<String?>(profilePic),
      'lastMessage': serializer.toJson<String?>(lastMessage),
      'lastMessageTime': serializer.toJson<DateTime?>(lastMessageTime),
      'unreadCount': serializer.toJson<int>(unreadCount),
    };
  }

  Conversation copyWith(
          {String? id,
          String? userId,
          String? username,
          drift.Value<String?> profilePic = const drift.Value.absent(),
          drift.Value<String?> lastMessage = const drift.Value.absent(),
          drift.Value<DateTime?> lastMessageTime = const drift.Value.absent(),
          int? unreadCount}) =>
      Conversation(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        username: username ?? this.username,
        profilePic: profilePic.present ? profilePic.value : this.profilePic,
        lastMessage: lastMessage.present ? lastMessage.value : this.lastMessage,
        lastMessageTime: lastMessageTime.present
            ? lastMessageTime.value
            : this.lastMessageTime,
        unreadCount: unreadCount ?? this.unreadCount,
      );
  Conversation copyWithCompanion(ConversationsCompanion data) {
    return Conversation(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      username: data.username.present ? data.username.value : this.username,
      profilePic:
          data.profilePic.present ? data.profilePic.value : this.profilePic,
      lastMessage:
          data.lastMessage.present ? data.lastMessage.value : this.lastMessage,
      lastMessageTime: data.lastMessageTime.present
          ? data.lastMessageTime.value
          : this.lastMessageTime,
      unreadCount:
          data.unreadCount.present ? data.unreadCount.value : this.unreadCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Conversation(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('profilePic: $profilePic, ')
          ..write('lastMessage: $lastMessage, ')
          ..write('lastMessageTime: $lastMessageTime, ')
          ..write('unreadCount: $unreadCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, username, profilePic, lastMessage,
      lastMessageTime, unreadCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Conversation &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.username == this.username &&
          other.profilePic == this.profilePic &&
          other.lastMessage == this.lastMessage &&
          other.lastMessageTime == this.lastMessageTime &&
          other.unreadCount == this.unreadCount);
}

class ConversationsCompanion extends drift.UpdateCompanion<Conversation> {
  final drift.Value<String> id;
  final drift.Value<String> userId;
  final drift.Value<String> username;
  final drift.Value<String?> profilePic;
  final drift.Value<String?> lastMessage;
  final drift.Value<DateTime?> lastMessageTime;
  final drift.Value<int> unreadCount;
  final drift.Value<int> rowid;
  const ConversationsCompanion({
    this.id = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.username = const drift.Value.absent(),
    this.profilePic = const drift.Value.absent(),
    this.lastMessage = const drift.Value.absent(),
    this.lastMessageTime = const drift.Value.absent(),
    this.unreadCount = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  ConversationsCompanion.insert({
    required String id,
    required String userId,
    required String username,
    this.profilePic = const drift.Value.absent(),
    this.lastMessage = const drift.Value.absent(),
    this.lastMessageTime = const drift.Value.absent(),
    this.unreadCount = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        userId = drift.Value(userId),
        username = drift.Value(username);
  static drift.Insertable<Conversation> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? userId,
    drift.Expression<String>? username,
    drift.Expression<String>? profilePic,
    drift.Expression<String>? lastMessage,
    drift.Expression<DateTime>? lastMessageTime,
    drift.Expression<int>? unreadCount,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (username != null) 'username': username,
      if (profilePic != null) 'profile_pic': profilePic,
      if (lastMessage != null) 'last_message': lastMessage,
      if (lastMessageTime != null) 'last_message_time': lastMessageTime,
      if (unreadCount != null) 'unread_count': unreadCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConversationsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? userId,
      drift.Value<String>? username,
      drift.Value<String?>? profilePic,
      drift.Value<String?>? lastMessage,
      drift.Value<DateTime?>? lastMessageTime,
      drift.Value<int>? unreadCount,
      drift.Value<int>? rowid}) {
    return ConversationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      profilePic: profilePic ?? this.profilePic,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      unreadCount: unreadCount ?? this.unreadCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (username.present) {
      map['username'] = drift.Variable<String>(username.value);
    }
    if (profilePic.present) {
      map['profile_pic'] = drift.Variable<String>(profilePic.value);
    }
    if (lastMessage.present) {
      map['last_message'] = drift.Variable<String>(lastMessage.value);
    }
    if (lastMessageTime.present) {
      map['last_message_time'] =
          drift.Variable<DateTime>(lastMessageTime.value);
    }
    if (unreadCount.present) {
      map['unread_count'] = drift.Variable<int>(unreadCount.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('profilePic: $profilePic, ')
          ..write('lastMessage: $lastMessage, ')
          ..write('lastMessageTime: $lastMessageTime, ')
          ..write('unreadCount: $unreadCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalBlogBookmarksTable extends LocalBlogBookmarks
    with drift.TableInfo<$LocalBlogBookmarksTable, LocalBlogBookmark> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalBlogBookmarksTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const drift.VerificationMeta _blogIdMeta =
      const drift.VerificationMeta('blogId');
  @override
  late final drift.GeneratedColumn<String> blogId =
      drift.GeneratedColumn<String>('blog_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns => [id, blogId, userId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_blog_bookmarks';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalBlogBookmark> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('blog_id')) {
      context.handle(_blogIdMeta,
          blogId.isAcceptableOrUnknown(data['blog_id']!, _blogIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalBlogBookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalBlogBookmark(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      blogId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blog_id']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalBlogBookmarksTable createAlias(String alias) {
    return $LocalBlogBookmarksTable(attachedDatabase, alias);
  }
}

class LocalBlogBookmark extends drift.DataClass
    implements drift.Insertable<LocalBlogBookmark> {
  final String id;
  final String? blogId;
  final String? userId;
  final DateTime createdAt;
  const LocalBlogBookmark(
      {required this.id, this.blogId, this.userId, required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    if (!nullToAbsent || blogId != null) {
      map['blog_id'] = drift.Variable<String>(blogId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = drift.Variable<String>(userId);
    }
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalBlogBookmarksCompanion toCompanion(bool nullToAbsent) {
    return LocalBlogBookmarksCompanion(
      id: drift.Value(id),
      blogId: blogId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(blogId),
      userId: userId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(userId),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalBlogBookmark.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalBlogBookmark(
      id: serializer.fromJson<String>(json['id']),
      blogId: serializer.fromJson<String?>(json['blogId']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'blogId': serializer.toJson<String?>(blogId),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalBlogBookmark copyWith(
          {String? id,
          drift.Value<String?> blogId = const drift.Value.absent(),
          drift.Value<String?> userId = const drift.Value.absent(),
          DateTime? createdAt}) =>
      LocalBlogBookmark(
        id: id ?? this.id,
        blogId: blogId.present ? blogId.value : this.blogId,
        userId: userId.present ? userId.value : this.userId,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalBlogBookmark copyWithCompanion(LocalBlogBookmarksCompanion data) {
    return LocalBlogBookmark(
      id: data.id.present ? data.id.value : this.id,
      blogId: data.blogId.present ? data.blogId.value : this.blogId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogBookmark(')
          ..write('id: $id, ')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, blogId, userId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalBlogBookmark &&
          other.id == this.id &&
          other.blogId == this.blogId &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt);
}

class LocalBlogBookmarksCompanion
    extends drift.UpdateCompanion<LocalBlogBookmark> {
  final drift.Value<String> id;
  final drift.Value<String?> blogId;
  final drift.Value<String?> userId;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalBlogBookmarksCompanion({
    this.id = const drift.Value.absent(),
    this.blogId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalBlogBookmarksCompanion.insert({
    this.id = const drift.Value.absent(),
    this.blogId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  static drift.Insertable<LocalBlogBookmark> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? blogId,
    drift.Expression<String>? userId,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (blogId != null) 'blog_id': blogId,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalBlogBookmarksCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String?>? blogId,
      drift.Value<String?>? userId,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalBlogBookmarksCompanion(
      id: id ?? this.id,
      blogId: blogId ?? this.blogId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (blogId.present) {
      map['blog_id'] = drift.Variable<String>(blogId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogBookmarksCompanion(')
          ..write('id: $id, ')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalJobApplicationsTable extends LocalJobApplications
    with drift.TableInfo<$LocalJobApplicationsTable, LocalJobApplication> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalJobApplicationsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _jobIdMeta =
      const drift.VerificationMeta('jobId');
  @override
  late final drift.GeneratedColumn<String> jobId =
      drift.GeneratedColumn<String>('job_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _messageMeta =
      const drift.VerificationMeta('message');
  @override
  late final drift.GeneratedColumn<String> message =
      drift.GeneratedColumn<String>('message', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _cvUrlMeta =
      const drift.VerificationMeta('cvUrl');
  @override
  late final drift.GeneratedColumn<String> cvUrl =
      drift.GeneratedColumn<String>('cv_url', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _statusMeta =
      const drift.VerificationMeta('status');
  @override
  late final drift.GeneratedColumn<String> status =
      drift.GeneratedColumn<String>('status', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('applied'));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, jobId, userId, message, cvUrl, status, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_job_applications';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalJobApplication> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('job_id')) {
      context.handle(
          _jobIdMeta, jobId.isAcceptableOrUnknown(data['job_id']!, _jobIdMeta));
    } else if (isInserting) {
      context.missing(_jobIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('cv_url')) {
      context.handle(
          _cvUrlMeta, cvUrl.isAcceptableOrUnknown(data['cv_url']!, _cvUrlMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalJobApplication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalJobApplication(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      jobId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message']),
      cvUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cv_url']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalJobApplicationsTable createAlias(String alias) {
    return $LocalJobApplicationsTable(attachedDatabase, alias);
  }
}

class LocalJobApplication extends drift.DataClass
    implements drift.Insertable<LocalJobApplication> {
  final String id;
  final String jobId;
  final String userId;
  final String? message;
  final String? cvUrl;
  final String status;
  final DateTime createdAt;
  const LocalJobApplication(
      {required this.id,
      required this.jobId,
      required this.userId,
      this.message,
      this.cvUrl,
      required this.status,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['job_id'] = drift.Variable<String>(jobId);
    map['user_id'] = drift.Variable<String>(userId);
    if (!nullToAbsent || message != null) {
      map['message'] = drift.Variable<String>(message);
    }
    if (!nullToAbsent || cvUrl != null) {
      map['cv_url'] = drift.Variable<String>(cvUrl);
    }
    map['status'] = drift.Variable<String>(status);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalJobApplicationsCompanion toCompanion(bool nullToAbsent) {
    return LocalJobApplicationsCompanion(
      id: drift.Value(id),
      jobId: drift.Value(jobId),
      userId: drift.Value(userId),
      message: message == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(message),
      cvUrl: cvUrl == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(cvUrl),
      status: drift.Value(status),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalJobApplication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalJobApplication(
      id: serializer.fromJson<String>(json['id']),
      jobId: serializer.fromJson<String>(json['jobId']),
      userId: serializer.fromJson<String>(json['userId']),
      message: serializer.fromJson<String?>(json['message']),
      cvUrl: serializer.fromJson<String?>(json['cvUrl']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'jobId': serializer.toJson<String>(jobId),
      'userId': serializer.toJson<String>(userId),
      'message': serializer.toJson<String?>(message),
      'cvUrl': serializer.toJson<String?>(cvUrl),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalJobApplication copyWith(
          {String? id,
          String? jobId,
          String? userId,
          drift.Value<String?> message = const drift.Value.absent(),
          drift.Value<String?> cvUrl = const drift.Value.absent(),
          String? status,
          DateTime? createdAt}) =>
      LocalJobApplication(
        id: id ?? this.id,
        jobId: jobId ?? this.jobId,
        userId: userId ?? this.userId,
        message: message.present ? message.value : this.message,
        cvUrl: cvUrl.present ? cvUrl.value : this.cvUrl,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalJobApplication copyWithCompanion(LocalJobApplicationsCompanion data) {
    return LocalJobApplication(
      id: data.id.present ? data.id.value : this.id,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      userId: data.userId.present ? data.userId.value : this.userId,
      message: data.message.present ? data.message.value : this.message,
      cvUrl: data.cvUrl.present ? data.cvUrl.value : this.cvUrl,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalJobApplication(')
          ..write('id: $id, ')
          ..write('jobId: $jobId, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('cvUrl: $cvUrl, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, jobId, userId, message, cvUrl, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalJobApplication &&
          other.id == this.id &&
          other.jobId == this.jobId &&
          other.userId == this.userId &&
          other.message == this.message &&
          other.cvUrl == this.cvUrl &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class LocalJobApplicationsCompanion
    extends drift.UpdateCompanion<LocalJobApplication> {
  final drift.Value<String> id;
  final drift.Value<String> jobId;
  final drift.Value<String> userId;
  final drift.Value<String?> message;
  final drift.Value<String?> cvUrl;
  final drift.Value<String> status;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalJobApplicationsCompanion({
    this.id = const drift.Value.absent(),
    this.jobId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.message = const drift.Value.absent(),
    this.cvUrl = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalJobApplicationsCompanion.insert({
    required String id,
    required String jobId,
    required String userId,
    this.message = const drift.Value.absent(),
    this.cvUrl = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        jobId = drift.Value(jobId),
        userId = drift.Value(userId);
  static drift.Insertable<LocalJobApplication> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? jobId,
    drift.Expression<String>? userId,
    drift.Expression<String>? message,
    drift.Expression<String>? cvUrl,
    drift.Expression<String>? status,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobId != null) 'job_id': jobId,
      if (userId != null) 'user_id': userId,
      if (message != null) 'message': message,
      if (cvUrl != null) 'cv_url': cvUrl,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalJobApplicationsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? jobId,
      drift.Value<String>? userId,
      drift.Value<String?>? message,
      drift.Value<String?>? cvUrl,
      drift.Value<String>? status,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalJobApplicationsCompanion(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      cvUrl: cvUrl ?? this.cvUrl,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (jobId.present) {
      map['job_id'] = drift.Variable<String>(jobId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (message.present) {
      map['message'] = drift.Variable<String>(message.value);
    }
    if (cvUrl.present) {
      map['cv_url'] = drift.Variable<String>(cvUrl.value);
    }
    if (status.present) {
      map['status'] = drift.Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalJobApplicationsCompanion(')
          ..write('id: $id, ')
          ..write('jobId: $jobId, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('cvUrl: $cvUrl, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalBlogReportsTable extends LocalBlogReports
    with drift.TableInfo<$LocalBlogReportsTable, LocalBlogReport> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalBlogReportsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _blogIdMeta =
      const drift.VerificationMeta('blogId');
  @override
  late final drift.GeneratedColumn<String> blogId =
      drift.GeneratedColumn<String>('blog_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _userIdMeta =
      const drift.VerificationMeta('userId');
  @override
  late final drift.GeneratedColumn<String> userId =
      drift.GeneratedColumn<String>('user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _reasonMeta =
      const drift.VerificationMeta('reason');
  @override
  late final drift.GeneratedColumn<String> reason =
      drift.GeneratedColumn<String>('reason', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, blogId, userId, reason, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_blog_reports';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<LocalBlogReport> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
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
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  LocalBlogReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalBlogReport(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      blogId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blog_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalBlogReportsTable createAlias(String alias) {
    return $LocalBlogReportsTable(attachedDatabase, alias);
  }
}

class LocalBlogReport extends drift.DataClass
    implements drift.Insertable<LocalBlogReport> {
  final String id;
  final String blogId;
  final String userId;
  final String reason;
  final DateTime createdAt;
  const LocalBlogReport(
      {required this.id,
      required this.blogId,
      required this.userId,
      required this.reason,
      required this.createdAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['blog_id'] = drift.Variable<String>(blogId);
    map['user_id'] = drift.Variable<String>(userId);
    map['reason'] = drift.Variable<String>(reason);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    return map;
  }

  LocalBlogReportsCompanion toCompanion(bool nullToAbsent) {
    return LocalBlogReportsCompanion(
      id: drift.Value(id),
      blogId: drift.Value(blogId),
      userId: drift.Value(userId),
      reason: drift.Value(reason),
      createdAt: drift.Value(createdAt),
    );
  }

  factory LocalBlogReport.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return LocalBlogReport(
      id: serializer.fromJson<String>(json['id']),
      blogId: serializer.fromJson<String>(json['blogId']),
      userId: serializer.fromJson<String>(json['userId']),
      reason: serializer.fromJson<String>(json['reason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'blogId': serializer.toJson<String>(blogId),
      'userId': serializer.toJson<String>(userId),
      'reason': serializer.toJson<String>(reason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalBlogReport copyWith(
          {String? id,
          String? blogId,
          String? userId,
          String? reason,
          DateTime? createdAt}) =>
      LocalBlogReport(
        id: id ?? this.id,
        blogId: blogId ?? this.blogId,
        userId: userId ?? this.userId,
        reason: reason ?? this.reason,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalBlogReport copyWithCompanion(LocalBlogReportsCompanion data) {
    return LocalBlogReport(
      id: data.id.present ? data.id.value : this.id,
      blogId: data.blogId.present ? data.blogId.value : this.blogId,
      userId: data.userId.present ? data.userId.value : this.userId,
      reason: data.reason.present ? data.reason.value : this.reason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogReport(')
          ..write('id: $id, ')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, blogId, userId, reason, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalBlogReport &&
          other.id == this.id &&
          other.blogId == this.blogId &&
          other.userId == this.userId &&
          other.reason == this.reason &&
          other.createdAt == this.createdAt);
}

class LocalBlogReportsCompanion extends drift.UpdateCompanion<LocalBlogReport> {
  final drift.Value<String> id;
  final drift.Value<String> blogId;
  final drift.Value<String> userId;
  final drift.Value<String> reason;
  final drift.Value<DateTime> createdAt;
  final drift.Value<int> rowid;
  const LocalBlogReportsCompanion({
    this.id = const drift.Value.absent(),
    this.blogId = const drift.Value.absent(),
    this.userId = const drift.Value.absent(),
    this.reason = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  LocalBlogReportsCompanion.insert({
    required String id,
    required String blogId,
    required String userId,
    required String reason,
    this.createdAt = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : id = drift.Value(id),
        blogId = drift.Value(blogId),
        userId = drift.Value(userId),
        reason = drift.Value(reason);
  static drift.Insertable<LocalBlogReport> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? blogId,
    drift.Expression<String>? userId,
    drift.Expression<String>? reason,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (blogId != null) 'blog_id': blogId,
      if (userId != null) 'user_id': userId,
      if (reason != null) 'reason': reason,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalBlogReportsCompanion copyWith(
      {drift.Value<String>? id,
      drift.Value<String>? blogId,
      drift.Value<String>? userId,
      drift.Value<String>? reason,
      drift.Value<DateTime>? createdAt,
      drift.Value<int>? rowid}) {
    return LocalBlogReportsCompanion(
      id: id ?? this.id,
      blogId: blogId ?? this.blogId,
      userId: userId ?? this.userId,
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (blogId.present) {
      map['blog_id'] = drift.Variable<String>(blogId.value);
    }
    if (userId.present) {
      map['user_id'] = drift.Variable<String>(userId.value);
    }
    if (reason.present) {
      map['reason'] = drift.Variable<String>(reason.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalBlogReportsCompanion(')
          ..write('id: $id, ')
          ..write('blogId: $blogId, ')
          ..write('userId: $userId, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends drift.GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalUsersTable localUsers = $LocalUsersTable(this);
  late final $LocalChangesTable localChanges = $LocalChangesTable(this);
  late final $LocalUpgradeRequestsTable localUpgradeRequests =
      $LocalUpgradeRequestsTable(this);
  late final $LocalNotificationsTable localNotifications =
      $LocalNotificationsTable(this);
  late final $LocalReportsTable localReports = $LocalReportsTable(this);
  late final $LocalServiceApplicationsTable localServiceApplications =
      $LocalServiceApplicationsTable(this);
  late final $LocalServiceRatingsTable localServiceRatings =
      $LocalServiceRatingsTable(this);
  late final $LocalServicesTable localServices = $LocalServicesTable(this);
  late final $ServiceRatingsTable serviceRatings = $ServiceRatingsTable(this);
  late final $HireRequestsTable hireRequests = $HireRequestsTable(this);
  late final $LocalFavoritesTable localFavorites = $LocalFavoritesTable(this);
  late final $LocalCommentsTable localComments = $LocalCommentsTable(this);
  late final $LocalMessagesTable localMessages = $LocalMessagesTable(this);
  late final $ServicesTable services = $ServicesTable(this);
  late final $LocalBlogsTable localBlogs = $LocalBlogsTable(this);
  late final $LocalBlogRatingsTable localBlogRatings =
      $LocalBlogRatingsTable(this);
  late final $LocalBlogLikesTable localBlogLikes = $LocalBlogLikesTable(this);
  late final $LocalJobsTable localJobs = $LocalJobsTable(this);
  late final $LocalFollowsTable localFollows = $LocalFollowsTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $ConversationsTable conversations = $ConversationsTable(this);
  late final $LocalBlogBookmarksTable localBlogBookmarks =
      $LocalBlogBookmarksTable(this);
  late final $LocalJobApplicationsTable localJobApplications =
      $LocalJobApplicationsTable(this);
  late final $LocalBlogReportsTable localBlogReports =
      $LocalBlogReportsTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities => [
        localUsers,
        localChanges,
        localUpgradeRequests,
        localNotifications,
        localReports,
        localServiceApplications,
        localServiceRatings,
        localServices,
        serviceRatings,
        hireRequests,
        localFavorites,
        localComments,
        localMessages,
        services,
        localBlogs,
        localBlogRatings,
        localBlogLikes,
        localJobs,
        localFollows,
        sessions,
        conversations,
        localBlogBookmarks,
        localJobApplications,
        localBlogReports
      ];
}

typedef $$LocalUsersTableCreateCompanionBuilder = LocalUsersCompanion Function({
  required String id,
  required String username,
  required String email,
  drift.Value<String?> bio,
  drift.Value<String?> location,
  drift.Value<String?> profilepic,
  drift.Value<String> banner,
  drift.Value<String> usertype,
  drift.Value<int> following,
  drift.Value<int> followers,
  drift.Value<DateTime?> createdAt,
  drift.Value<String> themeMode,
  drift.Value<bool> notificationsEnabled,
  drift.Value<int> credits,
  drift.Value<int> rowid,
});
typedef $$LocalUsersTableUpdateCompanionBuilder = LocalUsersCompanion Function({
  drift.Value<String> id,
  drift.Value<String> username,
  drift.Value<String> email,
  drift.Value<String?> bio,
  drift.Value<String?> location,
  drift.Value<String?> profilepic,
  drift.Value<String> banner,
  drift.Value<String> usertype,
  drift.Value<int> following,
  drift.Value<int> followers,
  drift.Value<DateTime?> createdAt,
  drift.Value<String> themeMode,
  drift.Value<bool> notificationsEnabled,
  drift.Value<int> credits,
  drift.Value<int> rowid,
});

class $$LocalUsersTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get username => $composableBuilder(
      column: $table.username,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get profilepic => $composableBuilder(
      column: $table.profilepic,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get banner => $composableBuilder(
      column: $table.banner, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get usertype => $composableBuilder(
      column: $table.usertype,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get following => $composableBuilder(
      column: $table.following,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get followers => $composableBuilder(
      column: $table.followers,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get themeMode => $composableBuilder(
      column: $table.themeMode,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get credits => $composableBuilder(
      column: $table.credits, builder: (column) => drift.ColumnFilters(column));
}

class $$LocalUsersTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get profilepic => $composableBuilder(
      column: $table.profilepic,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get banner => $composableBuilder(
      column: $table.banner,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get usertype => $composableBuilder(
      column: $table.usertype,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get following => $composableBuilder(
      column: $table.following,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get followers => $composableBuilder(
      column: $table.followers,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get themeMode => $composableBuilder(
      column: $table.themeMode,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get credits => $composableBuilder(
      column: $table.credits,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalUsersTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  drift.GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  drift.GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  drift.GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  drift.GeneratedColumn<String> get profilepic => $composableBuilder(
      column: $table.profilepic, builder: (column) => column);

  drift.GeneratedColumn<String> get banner =>
      $composableBuilder(column: $table.banner, builder: (column) => column);

  drift.GeneratedColumn<String> get usertype =>
      $composableBuilder(column: $table.usertype, builder: (column) => column);

  drift.GeneratedColumn<int> get following =>
      $composableBuilder(column: $table.following, builder: (column) => column);

  drift.GeneratedColumn<int> get followers =>
      $composableBuilder(column: $table.followers, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  drift.GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled, builder: (column) => column);

  drift.GeneratedColumn<int> get credits =>
      $composableBuilder(column: $table.credits, builder: (column) => column);
}

class $$LocalUsersTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalUsersTable,
    LocalUser,
    $$LocalUsersTableFilterComposer,
    $$LocalUsersTableOrderingComposer,
    $$LocalUsersTableAnnotationComposer,
    $$LocalUsersTableCreateCompanionBuilder,
    $$LocalUsersTableUpdateCompanionBuilder,
    (
      LocalUser,
      drift.BaseReferences<_$AppDatabase, $LocalUsersTable, LocalUser>
    ),
    LocalUser,
    drift.PrefetchHooks Function()> {
  $$LocalUsersTableTableManager(_$AppDatabase db, $LocalUsersTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> username = const drift.Value.absent(),
            drift.Value<String> email = const drift.Value.absent(),
            drift.Value<String?> bio = const drift.Value.absent(),
            drift.Value<String?> location = const drift.Value.absent(),
            drift.Value<String?> profilepic = const drift.Value.absent(),
            drift.Value<String> banner = const drift.Value.absent(),
            drift.Value<String> usertype = const drift.Value.absent(),
            drift.Value<int> following = const drift.Value.absent(),
            drift.Value<int> followers = const drift.Value.absent(),
            drift.Value<DateTime?> createdAt = const drift.Value.absent(),
            drift.Value<String> themeMode = const drift.Value.absent(),
            drift.Value<bool> notificationsEnabled = const drift.Value.absent(),
            drift.Value<int> credits = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalUsersCompanion(
            id: id,
            username: username,
            email: email,
            bio: bio,
            location: location,
            profilepic: profilepic,
            banner: banner,
            usertype: usertype,
            following: following,
            followers: followers,
            createdAt: createdAt,
            themeMode: themeMode,
            notificationsEnabled: notificationsEnabled,
            credits: credits,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String username,
            required String email,
            drift.Value<String?> bio = const drift.Value.absent(),
            drift.Value<String?> location = const drift.Value.absent(),
            drift.Value<String?> profilepic = const drift.Value.absent(),
            drift.Value<String> banner = const drift.Value.absent(),
            drift.Value<String> usertype = const drift.Value.absent(),
            drift.Value<int> following = const drift.Value.absent(),
            drift.Value<int> followers = const drift.Value.absent(),
            drift.Value<DateTime?> createdAt = const drift.Value.absent(),
            drift.Value<String> themeMode = const drift.Value.absent(),
            drift.Value<bool> notificationsEnabled = const drift.Value.absent(),
            drift.Value<int> credits = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalUsersCompanion.insert(
            id: id,
            username: username,
            email: email,
            bio: bio,
            location: location,
            profilepic: profilepic,
            banner: banner,
            usertype: usertype,
            following: following,
            followers: followers,
            createdAt: createdAt,
            themeMode: themeMode,
            notificationsEnabled: notificationsEnabled,
            credits: credits,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalUsersTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalUsersTable,
    LocalUser,
    $$LocalUsersTableFilterComposer,
    $$LocalUsersTableOrderingComposer,
    $$LocalUsersTableAnnotationComposer,
    $$LocalUsersTableCreateCompanionBuilder,
    $$LocalUsersTableUpdateCompanionBuilder,
    (
      LocalUser,
      drift.BaseReferences<_$AppDatabase, $LocalUsersTable, LocalUser>
    ),
    LocalUser,
    drift.PrefetchHooks Function()>;
typedef $$LocalChangesTableCreateCompanionBuilder = LocalChangesCompanion
    Function({
  required String id,
  required String action,
  required String payload,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalChangesTableUpdateCompanionBuilder = LocalChangesCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String> action,
  drift.Value<String> payload,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalChangesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalChangesTable> {
  $$LocalChangesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalChangesTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalChangesTable> {
  $$LocalChangesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalChangesTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalChangesTable> {
  $$LocalChangesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  drift.GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalChangesTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalChangesTable,
    LocalChange,
    $$LocalChangesTableFilterComposer,
    $$LocalChangesTableOrderingComposer,
    $$LocalChangesTableAnnotationComposer,
    $$LocalChangesTableCreateCompanionBuilder,
    $$LocalChangesTableUpdateCompanionBuilder,
    (
      LocalChange,
      drift.BaseReferences<_$AppDatabase, $LocalChangesTable, LocalChange>
    ),
    LocalChange,
    drift.PrefetchHooks Function()> {
  $$LocalChangesTableTableManager(_$AppDatabase db, $LocalChangesTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalChangesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalChangesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalChangesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> action = const drift.Value.absent(),
            drift.Value<String> payload = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalChangesCompanion(
            id: id,
            action: action,
            payload: payload,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String action,
            required String payload,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalChangesCompanion.insert(
            id: id,
            action: action,
            payload: payload,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalChangesTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalChangesTable,
    LocalChange,
    $$LocalChangesTableFilterComposer,
    $$LocalChangesTableOrderingComposer,
    $$LocalChangesTableAnnotationComposer,
    $$LocalChangesTableCreateCompanionBuilder,
    $$LocalChangesTableUpdateCompanionBuilder,
    (
      LocalChange,
      drift.BaseReferences<_$AppDatabase, $LocalChangesTable, LocalChange>
    ),
    LocalChange,
    drift.PrefetchHooks Function()>;
typedef $$LocalUpgradeRequestsTableCreateCompanionBuilder
    = LocalUpgradeRequestsCompanion Function({
  drift.Value<String> id,
  required String userId,
  required String businessId,
  drift.Value<String> status,
  required String requestedType,
  drift.Value<DateTime> createdAt,
  drift.Value<DateTime?> reviewedAt,
  drift.Value<String?> reviewedBy,
  drift.Value<String?> rejectionReason,
  drift.Value<String> fileUrls,
  drift.Value<String?> requestedValue,
  drift.Value<int> rowid,
});
typedef $$LocalUpgradeRequestsTableUpdateCompanionBuilder
    = LocalUpgradeRequestsCompanion Function({
  drift.Value<String> id,
  drift.Value<String> userId,
  drift.Value<String> businessId,
  drift.Value<String> status,
  drift.Value<String> requestedType,
  drift.Value<DateTime> createdAt,
  drift.Value<DateTime?> reviewedAt,
  drift.Value<String?> reviewedBy,
  drift.Value<String?> rejectionReason,
  drift.Value<String> fileUrls,
  drift.Value<String?> requestedValue,
  drift.Value<int> rowid,
});

class $$LocalUpgradeRequestsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalUpgradeRequestsTable> {
  $$LocalUpgradeRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get businessId => $composableBuilder(
      column: $table.businessId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get requestedType => $composableBuilder(
      column: $table.requestedType,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get reviewedAt => $composableBuilder(
      column: $table.reviewedAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get reviewedBy => $composableBuilder(
      column: $table.reviewedBy,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get rejectionReason => $composableBuilder(
      column: $table.rejectionReason,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get fileUrls => $composableBuilder(
      column: $table.fileUrls,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get requestedValue => $composableBuilder(
      column: $table.requestedValue,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalUpgradeRequestsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalUpgradeRequestsTable> {
  $$LocalUpgradeRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get businessId => $composableBuilder(
      column: $table.businessId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get requestedType => $composableBuilder(
      column: $table.requestedType,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get reviewedAt => $composableBuilder(
      column: $table.reviewedAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get reviewedBy => $composableBuilder(
      column: $table.reviewedBy,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get rejectionReason => $composableBuilder(
      column: $table.rejectionReason,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get fileUrls => $composableBuilder(
      column: $table.fileUrls,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get requestedValue => $composableBuilder(
      column: $table.requestedValue,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalUpgradeRequestsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalUpgradeRequestsTable> {
  $$LocalUpgradeRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => column);

  drift.GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  drift.GeneratedColumn<String> get requestedType => $composableBuilder(
      column: $table.requestedType, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get reviewedAt => $composableBuilder(
      column: $table.reviewedAt, builder: (column) => column);

  drift.GeneratedColumn<String> get reviewedBy => $composableBuilder(
      column: $table.reviewedBy, builder: (column) => column);

  drift.GeneratedColumn<String> get rejectionReason => $composableBuilder(
      column: $table.rejectionReason, builder: (column) => column);

  drift.GeneratedColumn<String> get fileUrls =>
      $composableBuilder(column: $table.fileUrls, builder: (column) => column);

  drift.GeneratedColumn<String> get requestedValue => $composableBuilder(
      column: $table.requestedValue, builder: (column) => column);
}

class $$LocalUpgradeRequestsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalUpgradeRequestsTable,
    LocalUpgradeRequest,
    $$LocalUpgradeRequestsTableFilterComposer,
    $$LocalUpgradeRequestsTableOrderingComposer,
    $$LocalUpgradeRequestsTableAnnotationComposer,
    $$LocalUpgradeRequestsTableCreateCompanionBuilder,
    $$LocalUpgradeRequestsTableUpdateCompanionBuilder,
    (
      LocalUpgradeRequest,
      drift.BaseReferences<_$AppDatabase, $LocalUpgradeRequestsTable,
          LocalUpgradeRequest>
    ),
    LocalUpgradeRequest,
    drift.PrefetchHooks Function()> {
  $$LocalUpgradeRequestsTableTableManager(
      _$AppDatabase db, $LocalUpgradeRequestsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalUpgradeRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalUpgradeRequestsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalUpgradeRequestsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String> businessId = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
            drift.Value<String> requestedType = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<DateTime?> reviewedAt = const drift.Value.absent(),
            drift.Value<String?> reviewedBy = const drift.Value.absent(),
            drift.Value<String?> rejectionReason = const drift.Value.absent(),
            drift.Value<String> fileUrls = const drift.Value.absent(),
            drift.Value<String?> requestedValue = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalUpgradeRequestsCompanion(
            id: id,
            userId: userId,
            businessId: businessId,
            status: status,
            requestedType: requestedType,
            createdAt: createdAt,
            reviewedAt: reviewedAt,
            reviewedBy: reviewedBy,
            rejectionReason: rejectionReason,
            fileUrls: fileUrls,
            requestedValue: requestedValue,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            required String userId,
            required String businessId,
            drift.Value<String> status = const drift.Value.absent(),
            required String requestedType,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<DateTime?> reviewedAt = const drift.Value.absent(),
            drift.Value<String?> reviewedBy = const drift.Value.absent(),
            drift.Value<String?> rejectionReason = const drift.Value.absent(),
            drift.Value<String> fileUrls = const drift.Value.absent(),
            drift.Value<String?> requestedValue = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalUpgradeRequestsCompanion.insert(
            id: id,
            userId: userId,
            businessId: businessId,
            status: status,
            requestedType: requestedType,
            createdAt: createdAt,
            reviewedAt: reviewedAt,
            reviewedBy: reviewedBy,
            rejectionReason: rejectionReason,
            fileUrls: fileUrls,
            requestedValue: requestedValue,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalUpgradeRequestsTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalUpgradeRequestsTable,
        LocalUpgradeRequest,
        $$LocalUpgradeRequestsTableFilterComposer,
        $$LocalUpgradeRequestsTableOrderingComposer,
        $$LocalUpgradeRequestsTableAnnotationComposer,
        $$LocalUpgradeRequestsTableCreateCompanionBuilder,
        $$LocalUpgradeRequestsTableUpdateCompanionBuilder,
        (
          LocalUpgradeRequest,
          drift.BaseReferences<_$AppDatabase, $LocalUpgradeRequestsTable,
              LocalUpgradeRequest>
        ),
        LocalUpgradeRequest,
        drift.PrefetchHooks Function()>;
typedef $$LocalNotificationsTableCreateCompanionBuilder
    = LocalNotificationsCompanion Function({
  required String id,
  required String userId,
  required String message,
  drift.Value<bool> isRead,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalNotificationsTableUpdateCompanionBuilder
    = LocalNotificationsCompanion Function({
  drift.Value<String> id,
  drift.Value<String> userId,
  drift.Value<String> message,
  drift.Value<bool> isRead,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalNotificationsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalNotificationsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalNotificationsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  drift.GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalNotificationsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalNotificationsTable,
    LocalNotification,
    $$LocalNotificationsTableFilterComposer,
    $$LocalNotificationsTableOrderingComposer,
    $$LocalNotificationsTableAnnotationComposer,
    $$LocalNotificationsTableCreateCompanionBuilder,
    $$LocalNotificationsTableUpdateCompanionBuilder,
    (
      LocalNotification,
      drift.BaseReferences<_$AppDatabase, $LocalNotificationsTable,
          LocalNotification>
    ),
    LocalNotification,
    drift.PrefetchHooks Function()> {
  $$LocalNotificationsTableTableManager(
      _$AppDatabase db, $LocalNotificationsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalNotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalNotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalNotificationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String> message = const drift.Value.absent(),
            drift.Value<bool> isRead = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalNotificationsCompanion(
            id: id,
            userId: userId,
            message: message,
            isRead: isRead,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String message,
            drift.Value<bool> isRead = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalNotificationsCompanion.insert(
            id: id,
            userId: userId,
            message: message,
            isRead: isRead,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalNotificationsTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalNotificationsTable,
        LocalNotification,
        $$LocalNotificationsTableFilterComposer,
        $$LocalNotificationsTableOrderingComposer,
        $$LocalNotificationsTableAnnotationComposer,
        $$LocalNotificationsTableCreateCompanionBuilder,
        $$LocalNotificationsTableUpdateCompanionBuilder,
        (
          LocalNotification,
          drift.BaseReferences<_$AppDatabase, $LocalNotificationsTable,
              LocalNotification>
        ),
        LocalNotification,
        drift.PrefetchHooks Function()>;
typedef $$LocalReportsTableCreateCompanionBuilder = LocalReportsCompanion
    Function({
  required String id,
  required String userId,
  required String contentId,
  required String contentType,
  required String reason,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalReportsTableUpdateCompanionBuilder = LocalReportsCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String> userId,
  drift.Value<String> contentId,
  drift.Value<String> contentType,
  drift.Value<String> reason,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalReportsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalReportsTable> {
  $$LocalReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get contentId => $composableBuilder(
      column: $table.contentId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get contentType => $composableBuilder(
      column: $table.contentType,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalReportsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalReportsTable> {
  $$LocalReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get contentId => $composableBuilder(
      column: $table.contentId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get contentType => $composableBuilder(
      column: $table.contentType,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalReportsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalReportsTable> {
  $$LocalReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get contentId =>
      $composableBuilder(column: $table.contentId, builder: (column) => column);

  drift.GeneratedColumn<String> get contentType => $composableBuilder(
      column: $table.contentType, builder: (column) => column);

  drift.GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalReportsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalReportsTable,
    LocalReport,
    $$LocalReportsTableFilterComposer,
    $$LocalReportsTableOrderingComposer,
    $$LocalReportsTableAnnotationComposer,
    $$LocalReportsTableCreateCompanionBuilder,
    $$LocalReportsTableUpdateCompanionBuilder,
    (
      LocalReport,
      drift.BaseReferences<_$AppDatabase, $LocalReportsTable, LocalReport>
    ),
    LocalReport,
    drift.PrefetchHooks Function()> {
  $$LocalReportsTableTableManager(_$AppDatabase db, $LocalReportsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String> contentId = const drift.Value.absent(),
            drift.Value<String> contentType = const drift.Value.absent(),
            drift.Value<String> reason = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalReportsCompanion(
            id: id,
            userId: userId,
            contentId: contentId,
            contentType: contentType,
            reason: reason,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String contentId,
            required String contentType,
            required String reason,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalReportsCompanion.insert(
            id: id,
            userId: userId,
            contentId: contentId,
            contentType: contentType,
            reason: reason,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalReportsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalReportsTable,
    LocalReport,
    $$LocalReportsTableFilterComposer,
    $$LocalReportsTableOrderingComposer,
    $$LocalReportsTableAnnotationComposer,
    $$LocalReportsTableCreateCompanionBuilder,
    $$LocalReportsTableUpdateCompanionBuilder,
    (
      LocalReport,
      drift.BaseReferences<_$AppDatabase, $LocalReportsTable, LocalReport>
    ),
    LocalReport,
    drift.PrefetchHooks Function()>;
typedef $$LocalServiceApplicationsTableCreateCompanionBuilder
    = LocalServiceApplicationsCompanion Function({
  required String id,
  required String serviceId,
  required String userId,
  drift.Value<String?> message,
  drift.Value<String> status,
  drift.Value<String> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalServiceApplicationsTableUpdateCompanionBuilder
    = LocalServiceApplicationsCompanion Function({
  drift.Value<String> id,
  drift.Value<String> serviceId,
  drift.Value<String> userId,
  drift.Value<String?> message,
  drift.Value<String> status,
  drift.Value<String> createdAt,
  drift.Value<int> rowid,
});

class $$LocalServiceApplicationsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalServiceApplicationsTable> {
  $$LocalServiceApplicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalServiceApplicationsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalServiceApplicationsTable> {
  $$LocalServiceApplicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalServiceApplicationsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalServiceApplicationsTable> {
  $$LocalServiceApplicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  drift.GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  drift.GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalServiceApplicationsTableTableManager
    extends drift.RootTableManager<
        _$AppDatabase,
        $LocalServiceApplicationsTable,
        LocalServiceApplication,
        $$LocalServiceApplicationsTableFilterComposer,
        $$LocalServiceApplicationsTableOrderingComposer,
        $$LocalServiceApplicationsTableAnnotationComposer,
        $$LocalServiceApplicationsTableCreateCompanionBuilder,
        $$LocalServiceApplicationsTableUpdateCompanionBuilder,
        (
          LocalServiceApplication,
          drift.BaseReferences<_$AppDatabase, $LocalServiceApplicationsTable,
              LocalServiceApplication>
        ),
        LocalServiceApplication,
        drift.PrefetchHooks Function()> {
  $$LocalServiceApplicationsTableTableManager(
      _$AppDatabase db, $LocalServiceApplicationsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalServiceApplicationsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalServiceApplicationsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalServiceApplicationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> serviceId = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String?> message = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
            drift.Value<String> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalServiceApplicationsCompanion(
            id: id,
            serviceId: serviceId,
            userId: userId,
            message: message,
            status: status,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String serviceId,
            required String userId,
            drift.Value<String?> message = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
            drift.Value<String> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalServiceApplicationsCompanion.insert(
            id: id,
            serviceId: serviceId,
            userId: userId,
            message: message,
            status: status,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalServiceApplicationsTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalServiceApplicationsTable,
        LocalServiceApplication,
        $$LocalServiceApplicationsTableFilterComposer,
        $$LocalServiceApplicationsTableOrderingComposer,
        $$LocalServiceApplicationsTableAnnotationComposer,
        $$LocalServiceApplicationsTableCreateCompanionBuilder,
        $$LocalServiceApplicationsTableUpdateCompanionBuilder,
        (
          LocalServiceApplication,
          drift.BaseReferences<_$AppDatabase, $LocalServiceApplicationsTable,
              LocalServiceApplication>
        ),
        LocalServiceApplication,
        drift.PrefetchHooks Function()>;
typedef $$LocalServiceRatingsTableCreateCompanionBuilder
    = LocalServiceRatingsCompanion Function({
  required String id,
  required String serviceId,
  required String userId,
  required int rating,
  drift.Value<DateTime> createdAt,
  drift.Value<DateTime?> updatedAt,
  drift.Value<int> rowid,
});
typedef $$LocalServiceRatingsTableUpdateCompanionBuilder
    = LocalServiceRatingsCompanion Function({
  drift.Value<String> id,
  drift.Value<String> serviceId,
  drift.Value<String> userId,
  drift.Value<int> rating,
  drift.Value<DateTime> createdAt,
  drift.Value<DateTime?> updatedAt,
  drift.Value<int> rowid,
});

class $$LocalServiceRatingsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalServiceRatingsTable> {
  $$LocalServiceRatingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalServiceRatingsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalServiceRatingsTable> {
  $$LocalServiceRatingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalServiceRatingsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalServiceRatingsTable> {
  $$LocalServiceRatingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocalServiceRatingsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalServiceRatingsTable,
    LocalServiceRating,
    $$LocalServiceRatingsTableFilterComposer,
    $$LocalServiceRatingsTableOrderingComposer,
    $$LocalServiceRatingsTableAnnotationComposer,
    $$LocalServiceRatingsTableCreateCompanionBuilder,
    $$LocalServiceRatingsTableUpdateCompanionBuilder,
    (
      LocalServiceRating,
      drift.BaseReferences<_$AppDatabase, $LocalServiceRatingsTable,
          LocalServiceRating>
    ),
    LocalServiceRating,
    drift.PrefetchHooks Function()> {
  $$LocalServiceRatingsTableTableManager(
      _$AppDatabase db, $LocalServiceRatingsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalServiceRatingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalServiceRatingsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalServiceRatingsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> serviceId = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<int> rating = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<DateTime?> updatedAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalServiceRatingsCompanion(
            id: id,
            serviceId: serviceId,
            userId: userId,
            rating: rating,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String serviceId,
            required String userId,
            required int rating,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<DateTime?> updatedAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalServiceRatingsCompanion.insert(
            id: id,
            serviceId: serviceId,
            userId: userId,
            rating: rating,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalServiceRatingsTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalServiceRatingsTable,
        LocalServiceRating,
        $$LocalServiceRatingsTableFilterComposer,
        $$LocalServiceRatingsTableOrderingComposer,
        $$LocalServiceRatingsTableAnnotationComposer,
        $$LocalServiceRatingsTableCreateCompanionBuilder,
        $$LocalServiceRatingsTableUpdateCompanionBuilder,
        (
          LocalServiceRating,
          drift.BaseReferences<_$AppDatabase, $LocalServiceRatingsTable,
              LocalServiceRating>
        ),
        LocalServiceRating,
        drift.PrefetchHooks Function()>;
typedef $$LocalServicesTableCreateCompanionBuilder = LocalServicesCompanion
    Function({
  required String id,
  required String company,
  required String servicedesc,
  required String companylocation,
  required double salary,
  required String servicetype,
  required String userid,
  required DateTime createdat,
  drift.Value<String?> serviceimage,
  drift.Value<double> servicerating,
  required String contact,
  drift.Value<int> rowid,
});
typedef $$LocalServicesTableUpdateCompanionBuilder = LocalServicesCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String> company,
  drift.Value<String> servicedesc,
  drift.Value<String> companylocation,
  drift.Value<double> salary,
  drift.Value<String> servicetype,
  drift.Value<String> userid,
  drift.Value<DateTime> createdat,
  drift.Value<String?> serviceimage,
  drift.Value<double> servicerating,
  drift.Value<String> contact,
  drift.Value<int> rowid,
});

class $$LocalServicesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalServicesTable> {
  $$LocalServicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get company => $composableBuilder(
      column: $table.company, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get servicedesc => $composableBuilder(
      column: $table.servicedesc,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get companylocation => $composableBuilder(
      column: $table.companylocation,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get salary => $composableBuilder(
      column: $table.salary, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get servicetype => $composableBuilder(
      column: $table.servicetype,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userid => $composableBuilder(
      column: $table.userid, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdat => $composableBuilder(
      column: $table.createdat,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get serviceimage => $composableBuilder(
      column: $table.serviceimage,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get servicerating => $composableBuilder(
      column: $table.servicerating,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => drift.ColumnFilters(column));
}

class $$LocalServicesTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalServicesTable> {
  $$LocalServicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get company => $composableBuilder(
      column: $table.company,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get servicedesc => $composableBuilder(
      column: $table.servicedesc,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get companylocation => $composableBuilder(
      column: $table.companylocation,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get salary => $composableBuilder(
      column: $table.salary,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get servicetype => $composableBuilder(
      column: $table.servicetype,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userid => $composableBuilder(
      column: $table.userid,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdat => $composableBuilder(
      column: $table.createdat,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get serviceimage => $composableBuilder(
      column: $table.serviceimage,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get servicerating => $composableBuilder(
      column: $table.servicerating,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalServicesTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalServicesTable> {
  $$LocalServicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  drift.GeneratedColumn<String> get servicedesc => $composableBuilder(
      column: $table.servicedesc, builder: (column) => column);

  drift.GeneratedColumn<String> get companylocation => $composableBuilder(
      column: $table.companylocation, builder: (column) => column);

  drift.GeneratedColumn<double> get salary =>
      $composableBuilder(column: $table.salary, builder: (column) => column);

  drift.GeneratedColumn<String> get servicetype => $composableBuilder(
      column: $table.servicetype, builder: (column) => column);

  drift.GeneratedColumn<String> get userid =>
      $composableBuilder(column: $table.userid, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdat =>
      $composableBuilder(column: $table.createdat, builder: (column) => column);

  drift.GeneratedColumn<String> get serviceimage => $composableBuilder(
      column: $table.serviceimage, builder: (column) => column);

  drift.GeneratedColumn<double> get servicerating => $composableBuilder(
      column: $table.servicerating, builder: (column) => column);

  drift.GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);
}

class $$LocalServicesTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalServicesTable,
    LocalService,
    $$LocalServicesTableFilterComposer,
    $$LocalServicesTableOrderingComposer,
    $$LocalServicesTableAnnotationComposer,
    $$LocalServicesTableCreateCompanionBuilder,
    $$LocalServicesTableUpdateCompanionBuilder,
    (
      LocalService,
      drift.BaseReferences<_$AppDatabase, $LocalServicesTable, LocalService>
    ),
    LocalService,
    drift.PrefetchHooks Function()> {
  $$LocalServicesTableTableManager(_$AppDatabase db, $LocalServicesTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalServicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalServicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalServicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> company = const drift.Value.absent(),
            drift.Value<String> servicedesc = const drift.Value.absent(),
            drift.Value<String> companylocation = const drift.Value.absent(),
            drift.Value<double> salary = const drift.Value.absent(),
            drift.Value<String> servicetype = const drift.Value.absent(),
            drift.Value<String> userid = const drift.Value.absent(),
            drift.Value<DateTime> createdat = const drift.Value.absent(),
            drift.Value<String?> serviceimage = const drift.Value.absent(),
            drift.Value<double> servicerating = const drift.Value.absent(),
            drift.Value<String> contact = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalServicesCompanion(
            id: id,
            company: company,
            servicedesc: servicedesc,
            companylocation: companylocation,
            salary: salary,
            servicetype: servicetype,
            userid: userid,
            createdat: createdat,
            serviceimage: serviceimage,
            servicerating: servicerating,
            contact: contact,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String company,
            required String servicedesc,
            required String companylocation,
            required double salary,
            required String servicetype,
            required String userid,
            required DateTime createdat,
            drift.Value<String?> serviceimage = const drift.Value.absent(),
            drift.Value<double> servicerating = const drift.Value.absent(),
            required String contact,
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalServicesCompanion.insert(
            id: id,
            company: company,
            servicedesc: servicedesc,
            companylocation: companylocation,
            salary: salary,
            servicetype: servicetype,
            userid: userid,
            createdat: createdat,
            serviceimage: serviceimage,
            servicerating: servicerating,
            contact: contact,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalServicesTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalServicesTable,
    LocalService,
    $$LocalServicesTableFilterComposer,
    $$LocalServicesTableOrderingComposer,
    $$LocalServicesTableAnnotationComposer,
    $$LocalServicesTableCreateCompanionBuilder,
    $$LocalServicesTableUpdateCompanionBuilder,
    (
      LocalService,
      drift.BaseReferences<_$AppDatabase, $LocalServicesTable, LocalService>
    ),
    LocalService,
    drift.PrefetchHooks Function()>;
typedef $$ServiceRatingsTableCreateCompanionBuilder = ServiceRatingsCompanion
    Function({
  drift.Value<int> id,
  required String serviceId,
  required String userId,
  required int rating,
  drift.Value<DateTime?> createdAt,
  drift.Value<DateTime?> updatedAt,
});
typedef $$ServiceRatingsTableUpdateCompanionBuilder = ServiceRatingsCompanion
    Function({
  drift.Value<int> id,
  drift.Value<String> serviceId,
  drift.Value<String> userId,
  drift.Value<int> rating,
  drift.Value<DateTime?> createdAt,
  drift.Value<DateTime?> updatedAt,
});

class $$ServiceRatingsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ServiceRatingsTable> {
  $$ServiceRatingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$ServiceRatingsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $ServiceRatingsTable> {
  $$ServiceRatingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$ServiceRatingsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $ServiceRatingsTable> {
  $$ServiceRatingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ServiceRatingsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $ServiceRatingsTable,
    ServiceRating,
    $$ServiceRatingsTableFilterComposer,
    $$ServiceRatingsTableOrderingComposer,
    $$ServiceRatingsTableAnnotationComposer,
    $$ServiceRatingsTableCreateCompanionBuilder,
    $$ServiceRatingsTableUpdateCompanionBuilder,
    (
      ServiceRating,
      drift.BaseReferences<_$AppDatabase, $ServiceRatingsTable, ServiceRating>
    ),
    ServiceRating,
    drift.PrefetchHooks Function()> {
  $$ServiceRatingsTableTableManager(
      _$AppDatabase db, $ServiceRatingsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceRatingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceRatingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceRatingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> serviceId = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<int> rating = const drift.Value.absent(),
            drift.Value<DateTime?> createdAt = const drift.Value.absent(),
            drift.Value<DateTime?> updatedAt = const drift.Value.absent(),
          }) =>
              ServiceRatingsCompanion(
            id: id,
            serviceId: serviceId,
            userId: userId,
            rating: rating,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String serviceId,
            required String userId,
            required int rating,
            drift.Value<DateTime?> createdAt = const drift.Value.absent(),
            drift.Value<DateTime?> updatedAt = const drift.Value.absent(),
          }) =>
              ServiceRatingsCompanion.insert(
            id: id,
            serviceId: serviceId,
            userId: userId,
            rating: rating,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ServiceRatingsTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $ServiceRatingsTable,
        ServiceRating,
        $$ServiceRatingsTableFilterComposer,
        $$ServiceRatingsTableOrderingComposer,
        $$ServiceRatingsTableAnnotationComposer,
        $$ServiceRatingsTableCreateCompanionBuilder,
        $$ServiceRatingsTableUpdateCompanionBuilder,
        (
          ServiceRating,
          drift
          .BaseReferences<_$AppDatabase, $ServiceRatingsTable, ServiceRating>
        ),
        ServiceRating,
        drift.PrefetchHooks Function()>;
typedef $$HireRequestsTableCreateCompanionBuilder = HireRequestsCompanion
    Function({
  required String id,
  required String serviceId,
  required String userId,
  drift.Value<String?> message,
  drift.Value<String> status,
  drift.Value<bool> isSynced,
  drift.Value<String> createdAt,
  drift.Value<int> rowid,
});
typedef $$HireRequestsTableUpdateCompanionBuilder = HireRequestsCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String> serviceId,
  drift.Value<String> userId,
  drift.Value<String?> message,
  drift.Value<String> status,
  drift.Value<bool> isSynced,
  drift.Value<String> createdAt,
  drift.Value<int> rowid,
});

class $$HireRequestsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $HireRequestsTable> {
  $$HireRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$HireRequestsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $HireRequestsTable> {
  $$HireRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$HireRequestsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $HireRequestsTable> {
  $$HireRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  drift.GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  drift.GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  drift.GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HireRequestsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $HireRequestsTable,
    HireRequest,
    $$HireRequestsTableFilterComposer,
    $$HireRequestsTableOrderingComposer,
    $$HireRequestsTableAnnotationComposer,
    $$HireRequestsTableCreateCompanionBuilder,
    $$HireRequestsTableUpdateCompanionBuilder,
    (
      HireRequest,
      drift.BaseReferences<_$AppDatabase, $HireRequestsTable, HireRequest>
    ),
    HireRequest,
    drift.PrefetchHooks Function()> {
  $$HireRequestsTableTableManager(_$AppDatabase db, $HireRequestsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HireRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HireRequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HireRequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> serviceId = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String?> message = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
            drift.Value<bool> isSynced = const drift.Value.absent(),
            drift.Value<String> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              HireRequestsCompanion(
            id: id,
            serviceId: serviceId,
            userId: userId,
            message: message,
            status: status,
            isSynced: isSynced,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String serviceId,
            required String userId,
            drift.Value<String?> message = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
            drift.Value<bool> isSynced = const drift.Value.absent(),
            drift.Value<String> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              HireRequestsCompanion.insert(
            id: id,
            serviceId: serviceId,
            userId: userId,
            message: message,
            status: status,
            isSynced: isSynced,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HireRequestsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $HireRequestsTable,
    HireRequest,
    $$HireRequestsTableFilterComposer,
    $$HireRequestsTableOrderingComposer,
    $$HireRequestsTableAnnotationComposer,
    $$HireRequestsTableCreateCompanionBuilder,
    $$HireRequestsTableUpdateCompanionBuilder,
    (
      HireRequest,
      drift.BaseReferences<_$AppDatabase, $HireRequestsTable, HireRequest>
    ),
    HireRequest,
    drift.PrefetchHooks Function()>;
typedef $$LocalFavoritesTableCreateCompanionBuilder = LocalFavoritesCompanion
    Function({
  required String id,
  required String userId,
  required String postId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalFavoritesTableUpdateCompanionBuilder = LocalFavoritesCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String> userId,
  drift.Value<String> postId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalFavoritesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalFavoritesTable> {
  $$LocalFavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get postId => $composableBuilder(
      column: $table.postId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalFavoritesTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalFavoritesTable> {
  $$LocalFavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get postId => $composableBuilder(
      column: $table.postId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalFavoritesTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalFavoritesTable> {
  $$LocalFavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalFavoritesTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalFavoritesTable,
    LocalFavorite,
    $$LocalFavoritesTableFilterComposer,
    $$LocalFavoritesTableOrderingComposer,
    $$LocalFavoritesTableAnnotationComposer,
    $$LocalFavoritesTableCreateCompanionBuilder,
    $$LocalFavoritesTableUpdateCompanionBuilder,
    (
      LocalFavorite,
      drift.BaseReferences<_$AppDatabase, $LocalFavoritesTable, LocalFavorite>
    ),
    LocalFavorite,
    drift.PrefetchHooks Function()> {
  $$LocalFavoritesTableTableManager(
      _$AppDatabase db, $LocalFavoritesTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalFavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalFavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalFavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String> postId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalFavoritesCompanion(
            id: id,
            userId: userId,
            postId: postId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String postId,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalFavoritesCompanion.insert(
            id: id,
            userId: userId,
            postId: postId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalFavoritesTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalFavoritesTable,
        LocalFavorite,
        $$LocalFavoritesTableFilterComposer,
        $$LocalFavoritesTableOrderingComposer,
        $$LocalFavoritesTableAnnotationComposer,
        $$LocalFavoritesTableCreateCompanionBuilder,
        $$LocalFavoritesTableUpdateCompanionBuilder,
        (
          LocalFavorite,
          drift
          .BaseReferences<_$AppDatabase, $LocalFavoritesTable, LocalFavorite>
        ),
        LocalFavorite,
        drift.PrefetchHooks Function()>;
typedef $$LocalCommentsTableCreateCompanionBuilder = LocalCommentsCompanion
    Function({
  required String id,
  required String userId,
  required String blogId,
  required String comment,
  drift.Value<String?> parentId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalCommentsTableUpdateCompanionBuilder = LocalCommentsCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String> userId,
  drift.Value<String> blogId,
  drift.Value<String> comment,
  drift.Value<String?> parentId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalCommentsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalCommentsTable> {
  $$LocalCommentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get parentId => $composableBuilder(
      column: $table.parentId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalCommentsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalCommentsTable> {
  $$LocalCommentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get blogId => $composableBuilder(
      column: $table.blogId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get parentId => $composableBuilder(
      column: $table.parentId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalCommentsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalCommentsTable> {
  $$LocalCommentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get blogId =>
      $composableBuilder(column: $table.blogId, builder: (column) => column);

  drift.GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  drift.GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalCommentsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalCommentsTable,
    LocalComment,
    $$LocalCommentsTableFilterComposer,
    $$LocalCommentsTableOrderingComposer,
    $$LocalCommentsTableAnnotationComposer,
    $$LocalCommentsTableCreateCompanionBuilder,
    $$LocalCommentsTableUpdateCompanionBuilder,
    (
      LocalComment,
      drift.BaseReferences<_$AppDatabase, $LocalCommentsTable, LocalComment>
    ),
    LocalComment,
    drift.PrefetchHooks Function()> {
  $$LocalCommentsTableTableManager(_$AppDatabase db, $LocalCommentsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalCommentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalCommentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalCommentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String> blogId = const drift.Value.absent(),
            drift.Value<String> comment = const drift.Value.absent(),
            drift.Value<String?> parentId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalCommentsCompanion(
            id: id,
            userId: userId,
            blogId: blogId,
            comment: comment,
            parentId: parentId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String blogId,
            required String comment,
            drift.Value<String?> parentId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalCommentsCompanion.insert(
            id: id,
            userId: userId,
            blogId: blogId,
            comment: comment,
            parentId: parentId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalCommentsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalCommentsTable,
    LocalComment,
    $$LocalCommentsTableFilterComposer,
    $$LocalCommentsTableOrderingComposer,
    $$LocalCommentsTableAnnotationComposer,
    $$LocalCommentsTableCreateCompanionBuilder,
    $$LocalCommentsTableUpdateCompanionBuilder,
    (
      LocalComment,
      drift.BaseReferences<_$AppDatabase, $LocalCommentsTable, LocalComment>
    ),
    LocalComment,
    drift.PrefetchHooks Function()>;
typedef $$LocalMessagesTableCreateCompanionBuilder = LocalMessagesCompanion
    Function({
  required String id,
  required String senderId,
  required String receiverId,
  required String content,
  drift.Value<bool> isRead,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalMessagesTableUpdateCompanionBuilder = LocalMessagesCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String> senderId,
  drift.Value<String> receiverId,
  drift.Value<String> content,
  drift.Value<bool> isRead,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalMessagesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalMessagesTable> {
  $$LocalMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get senderId => $composableBuilder(
      column: $table.senderId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get receiverId => $composableBuilder(
      column: $table.receiverId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalMessagesTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalMessagesTable> {
  $$LocalMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get senderId => $composableBuilder(
      column: $table.senderId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get receiverId => $composableBuilder(
      column: $table.receiverId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalMessagesTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalMessagesTable> {
  $$LocalMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get senderId =>
      $composableBuilder(column: $table.senderId, builder: (column) => column);

  drift.GeneratedColumn<String> get receiverId => $composableBuilder(
      column: $table.receiverId, builder: (column) => column);

  drift.GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  drift.GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalMessagesTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalMessagesTable,
    LocalMessage,
    $$LocalMessagesTableFilterComposer,
    $$LocalMessagesTableOrderingComposer,
    $$LocalMessagesTableAnnotationComposer,
    $$LocalMessagesTableCreateCompanionBuilder,
    $$LocalMessagesTableUpdateCompanionBuilder,
    (
      LocalMessage,
      drift.BaseReferences<_$AppDatabase, $LocalMessagesTable, LocalMessage>
    ),
    LocalMessage,
    drift.PrefetchHooks Function()> {
  $$LocalMessagesTableTableManager(_$AppDatabase db, $LocalMessagesTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalMessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> senderId = const drift.Value.absent(),
            drift.Value<String> receiverId = const drift.Value.absent(),
            drift.Value<String> content = const drift.Value.absent(),
            drift.Value<bool> isRead = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalMessagesCompanion(
            id: id,
            senderId: senderId,
            receiverId: receiverId,
            content: content,
            isRead: isRead,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String senderId,
            required String receiverId,
            required String content,
            drift.Value<bool> isRead = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalMessagesCompanion.insert(
            id: id,
            senderId: senderId,
            receiverId: receiverId,
            content: content,
            isRead: isRead,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalMessagesTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalMessagesTable,
    LocalMessage,
    $$LocalMessagesTableFilterComposer,
    $$LocalMessagesTableOrderingComposer,
    $$LocalMessagesTableAnnotationComposer,
    $$LocalMessagesTableCreateCompanionBuilder,
    $$LocalMessagesTableUpdateCompanionBuilder,
    (
      LocalMessage,
      drift.BaseReferences<_$AppDatabase, $LocalMessagesTable, LocalMessage>
    ),
    LocalMessage,
    drift.PrefetchHooks Function()>;
typedef $$ServicesTableCreateCompanionBuilder = ServicesCompanion Function({
  drift.Value<int> id,
  required String serviceId,
  drift.Value<String?> company,
  drift.Value<String?> servicedesc,
  drift.Value<String?> companylocation,
  drift.Value<double?> salary,
  drift.Value<String?> servicetype,
  drift.Value<String?> userid,
  drift.Value<DateTime?> lastUpdated,
});
typedef $$ServicesTableUpdateCompanionBuilder = ServicesCompanion Function({
  drift.Value<int> id,
  drift.Value<String> serviceId,
  drift.Value<String?> company,
  drift.Value<String?> servicedesc,
  drift.Value<String?> companylocation,
  drift.Value<double?> salary,
  drift.Value<String?> servicetype,
  drift.Value<String?> userid,
  drift.Value<DateTime?> lastUpdated,
});

class $$ServicesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ServicesTable> {
  $$ServicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get company => $composableBuilder(
      column: $table.company, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get servicedesc => $composableBuilder(
      column: $table.servicedesc,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get companylocation => $composableBuilder(
      column: $table.companylocation,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get salary => $composableBuilder(
      column: $table.salary, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get servicetype => $composableBuilder(
      column: $table.servicetype,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userid => $composableBuilder(
      column: $table.userid, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated,
      builder: (column) => drift.ColumnFilters(column));
}

class $$ServicesTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $ServicesTable> {
  $$ServicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get serviceId => $composableBuilder(
      column: $table.serviceId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get company => $composableBuilder(
      column: $table.company,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get servicedesc => $composableBuilder(
      column: $table.servicedesc,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get companylocation => $composableBuilder(
      column: $table.companylocation,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get salary => $composableBuilder(
      column: $table.salary,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get servicetype => $composableBuilder(
      column: $table.servicetype,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userid => $composableBuilder(
      column: $table.userid,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$ServicesTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $ServicesTable> {
  $$ServicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  drift.GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  drift.GeneratedColumn<String> get servicedesc => $composableBuilder(
      column: $table.servicedesc, builder: (column) => column);

  drift.GeneratedColumn<String> get companylocation => $composableBuilder(
      column: $table.companylocation, builder: (column) => column);

  drift.GeneratedColumn<double> get salary =>
      $composableBuilder(column: $table.salary, builder: (column) => column);

  drift.GeneratedColumn<String> get servicetype => $composableBuilder(
      column: $table.servicetype, builder: (column) => column);

  drift.GeneratedColumn<String> get userid =>
      $composableBuilder(column: $table.userid, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$ServicesTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $ServicesTable,
    Service,
    $$ServicesTableFilterComposer,
    $$ServicesTableOrderingComposer,
    $$ServicesTableAnnotationComposer,
    $$ServicesTableCreateCompanionBuilder,
    $$ServicesTableUpdateCompanionBuilder,
    (Service, drift.BaseReferences<_$AppDatabase, $ServicesTable, Service>),
    Service,
    drift.PrefetchHooks Function()> {
  $$ServicesTableTableManager(_$AppDatabase db, $ServicesTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> serviceId = const drift.Value.absent(),
            drift.Value<String?> company = const drift.Value.absent(),
            drift.Value<String?> servicedesc = const drift.Value.absent(),
            drift.Value<String?> companylocation = const drift.Value.absent(),
            drift.Value<double?> salary = const drift.Value.absent(),
            drift.Value<String?> servicetype = const drift.Value.absent(),
            drift.Value<String?> userid = const drift.Value.absent(),
            drift.Value<DateTime?> lastUpdated = const drift.Value.absent(),
          }) =>
              ServicesCompanion(
            id: id,
            serviceId: serviceId,
            company: company,
            servicedesc: servicedesc,
            companylocation: companylocation,
            salary: salary,
            servicetype: servicetype,
            userid: userid,
            lastUpdated: lastUpdated,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String serviceId,
            drift.Value<String?> company = const drift.Value.absent(),
            drift.Value<String?> servicedesc = const drift.Value.absent(),
            drift.Value<String?> companylocation = const drift.Value.absent(),
            drift.Value<double?> salary = const drift.Value.absent(),
            drift.Value<String?> servicetype = const drift.Value.absent(),
            drift.Value<String?> userid = const drift.Value.absent(),
            drift.Value<DateTime?> lastUpdated = const drift.Value.absent(),
          }) =>
              ServicesCompanion.insert(
            id: id,
            serviceId: serviceId,
            company: company,
            servicedesc: servicedesc,
            companylocation: companylocation,
            salary: salary,
            servicetype: servicetype,
            userid: userid,
            lastUpdated: lastUpdated,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ServicesTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $ServicesTable,
    Service,
    $$ServicesTableFilterComposer,
    $$ServicesTableOrderingComposer,
    $$ServicesTableAnnotationComposer,
    $$ServicesTableCreateCompanionBuilder,
    $$ServicesTableUpdateCompanionBuilder,
    (Service, drift.BaseReferences<_$AppDatabase, $ServicesTable, Service>),
    Service,
    drift.PrefetchHooks Function()>;
typedef $$LocalBlogsTableCreateCompanionBuilder = LocalBlogsCompanion Function({
  required String id,
  drift.Value<String?> userId,
  drift.Value<String?> title,
  drift.Value<String?> description,
  drift.Value<String?> image,
  drift.Value<String?> category,
  drift.Value<double?> blogRating,
  drift.Value<String?> location,
  drift.Value<DateTime?> createdAt,
  drift.Value<String?> username,
  drift.Value<String?> userProfilePic,
  drift.Value<int> rowid,
});
typedef $$LocalBlogsTableUpdateCompanionBuilder = LocalBlogsCompanion Function({
  drift.Value<String> id,
  drift.Value<String?> userId,
  drift.Value<String?> title,
  drift.Value<String?> description,
  drift.Value<String?> image,
  drift.Value<String?> category,
  drift.Value<double?> blogRating,
  drift.Value<String?> location,
  drift.Value<DateTime?> createdAt,
  drift.Value<String?> username,
  drift.Value<String?> userProfilePic,
  drift.Value<int> rowid,
});

class $$LocalBlogsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogsTable> {
  $$LocalBlogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get category => $composableBuilder(
      column: $table.category,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get blogRating => $composableBuilder(
      column: $table.blogRating,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get username => $composableBuilder(
      column: $table.username,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userProfilePic => $composableBuilder(
      column: $table.userProfilePic,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalBlogsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogsTable> {
  $$LocalBlogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get blogRating => $composableBuilder(
      column: $table.blogRating,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userProfilePic => $composableBuilder(
      column: $table.userProfilePic,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalBlogsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogsTable> {
  $$LocalBlogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  drift.GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  drift.GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  drift.GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  drift.GeneratedColumn<double> get blogRating => $composableBuilder(
      column: $table.blogRating, builder: (column) => column);

  drift.GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  drift.GeneratedColumn<String> get userProfilePic => $composableBuilder(
      column: $table.userProfilePic, builder: (column) => column);
}

class $$LocalBlogsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalBlogsTable,
    LocalBlog,
    $$LocalBlogsTableFilterComposer,
    $$LocalBlogsTableOrderingComposer,
    $$LocalBlogsTableAnnotationComposer,
    $$LocalBlogsTableCreateCompanionBuilder,
    $$LocalBlogsTableUpdateCompanionBuilder,
    (
      LocalBlog,
      drift.BaseReferences<_$AppDatabase, $LocalBlogsTable, LocalBlog>
    ),
    LocalBlog,
    drift.PrefetchHooks Function()> {
  $$LocalBlogsTableTableManager(_$AppDatabase db, $LocalBlogsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalBlogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalBlogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalBlogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String?> userId = const drift.Value.absent(),
            drift.Value<String?> title = const drift.Value.absent(),
            drift.Value<String?> description = const drift.Value.absent(),
            drift.Value<String?> image = const drift.Value.absent(),
            drift.Value<String?> category = const drift.Value.absent(),
            drift.Value<double?> blogRating = const drift.Value.absent(),
            drift.Value<String?> location = const drift.Value.absent(),
            drift.Value<DateTime?> createdAt = const drift.Value.absent(),
            drift.Value<String?> username = const drift.Value.absent(),
            drift.Value<String?> userProfilePic = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogsCompanion(
            id: id,
            userId: userId,
            title: title,
            description: description,
            image: image,
            category: category,
            blogRating: blogRating,
            location: location,
            createdAt: createdAt,
            username: username,
            userProfilePic: userProfilePic,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            drift.Value<String?> userId = const drift.Value.absent(),
            drift.Value<String?> title = const drift.Value.absent(),
            drift.Value<String?> description = const drift.Value.absent(),
            drift.Value<String?> image = const drift.Value.absent(),
            drift.Value<String?> category = const drift.Value.absent(),
            drift.Value<double?> blogRating = const drift.Value.absent(),
            drift.Value<String?> location = const drift.Value.absent(),
            drift.Value<DateTime?> createdAt = const drift.Value.absent(),
            drift.Value<String?> username = const drift.Value.absent(),
            drift.Value<String?> userProfilePic = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogsCompanion.insert(
            id: id,
            userId: userId,
            title: title,
            description: description,
            image: image,
            category: category,
            blogRating: blogRating,
            location: location,
            createdAt: createdAt,
            username: username,
            userProfilePic: userProfilePic,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalBlogsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalBlogsTable,
    LocalBlog,
    $$LocalBlogsTableFilterComposer,
    $$LocalBlogsTableOrderingComposer,
    $$LocalBlogsTableAnnotationComposer,
    $$LocalBlogsTableCreateCompanionBuilder,
    $$LocalBlogsTableUpdateCompanionBuilder,
    (
      LocalBlog,
      drift.BaseReferences<_$AppDatabase, $LocalBlogsTable, LocalBlog>
    ),
    LocalBlog,
    drift.PrefetchHooks Function()>;
typedef $$LocalBlogRatingsTableCreateCompanionBuilder
    = LocalBlogRatingsCompanion Function({
  required String blogId,
  required String userId,
  required int rating,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalBlogRatingsTableUpdateCompanionBuilder
    = LocalBlogRatingsCompanion Function({
  drift.Value<String> blogId,
  drift.Value<String> userId,
  drift.Value<int> rating,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalBlogRatingsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogRatingsTable> {
  $$LocalBlogRatingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalBlogRatingsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogRatingsTable> {
  $$LocalBlogRatingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get blogId => $composableBuilder(
      column: $table.blogId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalBlogRatingsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogRatingsTable> {
  $$LocalBlogRatingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get blogId =>
      $composableBuilder(column: $table.blogId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalBlogRatingsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalBlogRatingsTable,
    LocalBlogRating,
    $$LocalBlogRatingsTableFilterComposer,
    $$LocalBlogRatingsTableOrderingComposer,
    $$LocalBlogRatingsTableAnnotationComposer,
    $$LocalBlogRatingsTableCreateCompanionBuilder,
    $$LocalBlogRatingsTableUpdateCompanionBuilder,
    (
      LocalBlogRating,
      drift
      .BaseReferences<_$AppDatabase, $LocalBlogRatingsTable, LocalBlogRating>
    ),
    LocalBlogRating,
    drift.PrefetchHooks Function()> {
  $$LocalBlogRatingsTableTableManager(
      _$AppDatabase db, $LocalBlogRatingsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalBlogRatingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalBlogRatingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalBlogRatingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> blogId = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<int> rating = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogRatingsCompanion(
            blogId: blogId,
            userId: userId,
            rating: rating,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String blogId,
            required String userId,
            required int rating,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogRatingsCompanion.insert(
            blogId: blogId,
            userId: userId,
            rating: rating,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalBlogRatingsTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalBlogRatingsTable,
        LocalBlogRating,
        $$LocalBlogRatingsTableFilterComposer,
        $$LocalBlogRatingsTableOrderingComposer,
        $$LocalBlogRatingsTableAnnotationComposer,
        $$LocalBlogRatingsTableCreateCompanionBuilder,
        $$LocalBlogRatingsTableUpdateCompanionBuilder,
        (
          LocalBlogRating,
          drift.BaseReferences<_$AppDatabase, $LocalBlogRatingsTable,
              LocalBlogRating>
        ),
        LocalBlogRating,
        drift.PrefetchHooks Function()>;
typedef $$LocalBlogLikesTableCreateCompanionBuilder = LocalBlogLikesCompanion
    Function({
  required String id,
  drift.Value<String?> blogId,
  drift.Value<String?> userId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalBlogLikesTableUpdateCompanionBuilder = LocalBlogLikesCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String?> blogId,
  drift.Value<String?> userId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalBlogLikesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogLikesTable> {
  $$LocalBlogLikesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalBlogLikesTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogLikesTable> {
  $$LocalBlogLikesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get blogId => $composableBuilder(
      column: $table.blogId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalBlogLikesTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogLikesTable> {
  $$LocalBlogLikesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get blogId =>
      $composableBuilder(column: $table.blogId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalBlogLikesTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalBlogLikesTable,
    LocalBlogLike,
    $$LocalBlogLikesTableFilterComposer,
    $$LocalBlogLikesTableOrderingComposer,
    $$LocalBlogLikesTableAnnotationComposer,
    $$LocalBlogLikesTableCreateCompanionBuilder,
    $$LocalBlogLikesTableUpdateCompanionBuilder,
    (
      LocalBlogLike,
      drift.BaseReferences<_$AppDatabase, $LocalBlogLikesTable, LocalBlogLike>
    ),
    LocalBlogLike,
    drift.PrefetchHooks Function()> {
  $$LocalBlogLikesTableTableManager(
      _$AppDatabase db, $LocalBlogLikesTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalBlogLikesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalBlogLikesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalBlogLikesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String?> blogId = const drift.Value.absent(),
            drift.Value<String?> userId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogLikesCompanion(
            id: id,
            blogId: blogId,
            userId: userId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            drift.Value<String?> blogId = const drift.Value.absent(),
            drift.Value<String?> userId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogLikesCompanion.insert(
            id: id,
            blogId: blogId,
            userId: userId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalBlogLikesTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalBlogLikesTable,
        LocalBlogLike,
        $$LocalBlogLikesTableFilterComposer,
        $$LocalBlogLikesTableOrderingComposer,
        $$LocalBlogLikesTableAnnotationComposer,
        $$LocalBlogLikesTableCreateCompanionBuilder,
        $$LocalBlogLikesTableUpdateCompanionBuilder,
        (
          LocalBlogLike,
          drift
          .BaseReferences<_$AppDatabase, $LocalBlogLikesTable, LocalBlogLike>
        ),
        LocalBlogLike,
        drift.PrefetchHooks Function()>;
typedef $$LocalJobsTableCreateCompanionBuilder = LocalJobsCompanion Function({
  required String id,
  required String userId,
  required String jobTitle,
  required String jobDesc,
  required String jobLocation,
  required String contact,
  required int slots,
  required double salary,
  required DateTime postDuration,
  required DateTime createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalJobsTableUpdateCompanionBuilder = LocalJobsCompanion Function({
  drift.Value<String> id,
  drift.Value<String> userId,
  drift.Value<String> jobTitle,
  drift.Value<String> jobDesc,
  drift.Value<String> jobLocation,
  drift.Value<String> contact,
  drift.Value<int> slots,
  drift.Value<double> salary,
  drift.Value<DateTime> postDuration,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalJobsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalJobsTable> {
  $$LocalJobsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get jobTitle => $composableBuilder(
      column: $table.jobTitle,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get jobDesc => $composableBuilder(
      column: $table.jobDesc, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get jobLocation => $composableBuilder(
      column: $table.jobLocation,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get slots => $composableBuilder(
      column: $table.slots, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get salary => $composableBuilder(
      column: $table.salary, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get postDuration => $composableBuilder(
      column: $table.postDuration,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalJobsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalJobsTable> {
  $$LocalJobsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get jobTitle => $composableBuilder(
      column: $table.jobTitle,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get jobDesc => $composableBuilder(
      column: $table.jobDesc,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get jobLocation => $composableBuilder(
      column: $table.jobLocation,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get slots => $composableBuilder(
      column: $table.slots, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get salary => $composableBuilder(
      column: $table.salary,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get postDuration => $composableBuilder(
      column: $table.postDuration,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalJobsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalJobsTable> {
  $$LocalJobsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get jobTitle =>
      $composableBuilder(column: $table.jobTitle, builder: (column) => column);

  drift.GeneratedColumn<String> get jobDesc =>
      $composableBuilder(column: $table.jobDesc, builder: (column) => column);

  drift.GeneratedColumn<String> get jobLocation => $composableBuilder(
      column: $table.jobLocation, builder: (column) => column);

  drift.GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  drift.GeneratedColumn<int> get slots =>
      $composableBuilder(column: $table.slots, builder: (column) => column);

  drift.GeneratedColumn<double> get salary =>
      $composableBuilder(column: $table.salary, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get postDuration => $composableBuilder(
      column: $table.postDuration, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalJobsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalJobsTable,
    LocalJob,
    $$LocalJobsTableFilterComposer,
    $$LocalJobsTableOrderingComposer,
    $$LocalJobsTableAnnotationComposer,
    $$LocalJobsTableCreateCompanionBuilder,
    $$LocalJobsTableUpdateCompanionBuilder,
    (LocalJob, drift.BaseReferences<_$AppDatabase, $LocalJobsTable, LocalJob>),
    LocalJob,
    drift.PrefetchHooks Function()> {
  $$LocalJobsTableTableManager(_$AppDatabase db, $LocalJobsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalJobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalJobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalJobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String> jobTitle = const drift.Value.absent(),
            drift.Value<String> jobDesc = const drift.Value.absent(),
            drift.Value<String> jobLocation = const drift.Value.absent(),
            drift.Value<String> contact = const drift.Value.absent(),
            drift.Value<int> slots = const drift.Value.absent(),
            drift.Value<double> salary = const drift.Value.absent(),
            drift.Value<DateTime> postDuration = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalJobsCompanion(
            id: id,
            userId: userId,
            jobTitle: jobTitle,
            jobDesc: jobDesc,
            jobLocation: jobLocation,
            contact: contact,
            slots: slots,
            salary: salary,
            postDuration: postDuration,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String jobTitle,
            required String jobDesc,
            required String jobLocation,
            required String contact,
            required int slots,
            required double salary,
            required DateTime postDuration,
            required DateTime createdAt,
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalJobsCompanion.insert(
            id: id,
            userId: userId,
            jobTitle: jobTitle,
            jobDesc: jobDesc,
            jobLocation: jobLocation,
            contact: contact,
            slots: slots,
            salary: salary,
            postDuration: postDuration,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalJobsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalJobsTable,
    LocalJob,
    $$LocalJobsTableFilterComposer,
    $$LocalJobsTableOrderingComposer,
    $$LocalJobsTableAnnotationComposer,
    $$LocalJobsTableCreateCompanionBuilder,
    $$LocalJobsTableUpdateCompanionBuilder,
    (LocalJob, drift.BaseReferences<_$AppDatabase, $LocalJobsTable, LocalJob>),
    LocalJob,
    drift.PrefetchHooks Function()>;
typedef $$LocalFollowsTableCreateCompanionBuilder = LocalFollowsCompanion
    Function({
  required String followerId,
  required String followedId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalFollowsTableUpdateCompanionBuilder = LocalFollowsCompanion
    Function({
  drift.Value<String> followerId,
  drift.Value<String> followedId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalFollowsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalFollowsTable> {
  $$LocalFollowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get followerId => $composableBuilder(
      column: $table.followerId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get followedId => $composableBuilder(
      column: $table.followedId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalFollowsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalFollowsTable> {
  $$LocalFollowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get followerId => $composableBuilder(
      column: $table.followerId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get followedId => $composableBuilder(
      column: $table.followedId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalFollowsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalFollowsTable> {
  $$LocalFollowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get followerId => $composableBuilder(
      column: $table.followerId, builder: (column) => column);

  drift.GeneratedColumn<String> get followedId => $composableBuilder(
      column: $table.followedId, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalFollowsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalFollowsTable,
    LocalFollow,
    $$LocalFollowsTableFilterComposer,
    $$LocalFollowsTableOrderingComposer,
    $$LocalFollowsTableAnnotationComposer,
    $$LocalFollowsTableCreateCompanionBuilder,
    $$LocalFollowsTableUpdateCompanionBuilder,
    (
      LocalFollow,
      drift.BaseReferences<_$AppDatabase, $LocalFollowsTable, LocalFollow>
    ),
    LocalFollow,
    drift.PrefetchHooks Function()> {
  $$LocalFollowsTableTableManager(_$AppDatabase db, $LocalFollowsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalFollowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalFollowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalFollowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> followerId = const drift.Value.absent(),
            drift.Value<String> followedId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalFollowsCompanion(
            followerId: followerId,
            followedId: followedId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String followerId,
            required String followedId,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalFollowsCompanion.insert(
            followerId: followerId,
            followedId: followedId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalFollowsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $LocalFollowsTable,
    LocalFollow,
    $$LocalFollowsTableFilterComposer,
    $$LocalFollowsTableOrderingComposer,
    $$LocalFollowsTableAnnotationComposer,
    $$LocalFollowsTableCreateCompanionBuilder,
    $$LocalFollowsTableUpdateCompanionBuilder,
    (
      LocalFollow,
      drift.BaseReferences<_$AppDatabase, $LocalFollowsTable, LocalFollow>
    ),
    LocalFollow,
    drift.PrefetchHooks Function()>;
typedef $$SessionsTableCreateCompanionBuilder = SessionsCompanion Function({
  required String id,
  required bool isLoggedIn,
  required DateTime createdAt,
  drift.Value<int> rowid,
});
typedef $$SessionsTableUpdateCompanionBuilder = SessionsCompanion Function({
  drift.Value<String> id,
  drift.Value<bool> isLoggedIn,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$SessionsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get isLoggedIn => $composableBuilder(
      column: $table.isLoggedIn,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$SessionsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get isLoggedIn => $composableBuilder(
      column: $table.isLoggedIn,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$SessionsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<bool> get isLoggedIn => $composableBuilder(
      column: $table.isLoggedIn, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SessionsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $SessionsTable,
    Session,
    $$SessionsTableFilterComposer,
    $$SessionsTableOrderingComposer,
    $$SessionsTableAnnotationComposer,
    $$SessionsTableCreateCompanionBuilder,
    $$SessionsTableUpdateCompanionBuilder,
    (Session, drift.BaseReferences<_$AppDatabase, $SessionsTable, Session>),
    Session,
    drift.PrefetchHooks Function()> {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<bool> isLoggedIn = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              SessionsCompanion(
            id: id,
            isLoggedIn: isLoggedIn,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required bool isLoggedIn,
            required DateTime createdAt,
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              SessionsCompanion.insert(
            id: id,
            isLoggedIn: isLoggedIn,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SessionsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $SessionsTable,
    Session,
    $$SessionsTableFilterComposer,
    $$SessionsTableOrderingComposer,
    $$SessionsTableAnnotationComposer,
    $$SessionsTableCreateCompanionBuilder,
    $$SessionsTableUpdateCompanionBuilder,
    (Session, drift.BaseReferences<_$AppDatabase, $SessionsTable, Session>),
    Session,
    drift.PrefetchHooks Function()>;
typedef $$ConversationsTableCreateCompanionBuilder = ConversationsCompanion
    Function({
  required String id,
  required String userId,
  required String username,
  drift.Value<String?> profilePic,
  drift.Value<String?> lastMessage,
  drift.Value<DateTime?> lastMessageTime,
  drift.Value<int> unreadCount,
  drift.Value<int> rowid,
});
typedef $$ConversationsTableUpdateCompanionBuilder = ConversationsCompanion
    Function({
  drift.Value<String> id,
  drift.Value<String> userId,
  drift.Value<String> username,
  drift.Value<String?> profilePic,
  drift.Value<String?> lastMessage,
  drift.Value<DateTime?> lastMessageTime,
  drift.Value<int> unreadCount,
  drift.Value<int> rowid,
});

class $$ConversationsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get username => $composableBuilder(
      column: $table.username,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get profilePic => $composableBuilder(
      column: $table.profilePic,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get lastMessage => $composableBuilder(
      column: $table.lastMessage,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get lastMessageTime => $composableBuilder(
      column: $table.lastMessageTime,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get unreadCount => $composableBuilder(
      column: $table.unreadCount,
      builder: (column) => drift.ColumnFilters(column));
}

class $$ConversationsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get profilePic => $composableBuilder(
      column: $table.profilePic,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get lastMessage => $composableBuilder(
      column: $table.lastMessage,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get lastMessageTime => $composableBuilder(
      column: $table.lastMessageTime,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get unreadCount => $composableBuilder(
      column: $table.unreadCount,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$ConversationsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  drift.GeneratedColumn<String> get profilePic => $composableBuilder(
      column: $table.profilePic, builder: (column) => column);

  drift.GeneratedColumn<String> get lastMessage => $composableBuilder(
      column: $table.lastMessage, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get lastMessageTime => $composableBuilder(
      column: $table.lastMessageTime, builder: (column) => column);

  drift.GeneratedColumn<int> get unreadCount => $composableBuilder(
      column: $table.unreadCount, builder: (column) => column);
}

class $$ConversationsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $ConversationsTable,
    Conversation,
    $$ConversationsTableFilterComposer,
    $$ConversationsTableOrderingComposer,
    $$ConversationsTableAnnotationComposer,
    $$ConversationsTableCreateCompanionBuilder,
    $$ConversationsTableUpdateCompanionBuilder,
    (
      Conversation,
      drift.BaseReferences<_$AppDatabase, $ConversationsTable, Conversation>
    ),
    Conversation,
    drift.PrefetchHooks Function()> {
  $$ConversationsTableTableManager(_$AppDatabase db, $ConversationsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConversationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConversationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConversationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String> username = const drift.Value.absent(),
            drift.Value<String?> profilePic = const drift.Value.absent(),
            drift.Value<String?> lastMessage = const drift.Value.absent(),
            drift.Value<DateTime?> lastMessageTime = const drift.Value.absent(),
            drift.Value<int> unreadCount = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              ConversationsCompanion(
            id: id,
            userId: userId,
            username: username,
            profilePic: profilePic,
            lastMessage: lastMessage,
            lastMessageTime: lastMessageTime,
            unreadCount: unreadCount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String username,
            drift.Value<String?> profilePic = const drift.Value.absent(),
            drift.Value<String?> lastMessage = const drift.Value.absent(),
            drift.Value<DateTime?> lastMessageTime = const drift.Value.absent(),
            drift.Value<int> unreadCount = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              ConversationsCompanion.insert(
            id: id,
            userId: userId,
            username: username,
            profilePic: profilePic,
            lastMessage: lastMessage,
            lastMessageTime: lastMessageTime,
            unreadCount: unreadCount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ConversationsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $ConversationsTable,
    Conversation,
    $$ConversationsTableFilterComposer,
    $$ConversationsTableOrderingComposer,
    $$ConversationsTableAnnotationComposer,
    $$ConversationsTableCreateCompanionBuilder,
    $$ConversationsTableUpdateCompanionBuilder,
    (
      Conversation,
      drift.BaseReferences<_$AppDatabase, $ConversationsTable, Conversation>
    ),
    Conversation,
    drift.PrefetchHooks Function()>;
typedef $$LocalBlogBookmarksTableCreateCompanionBuilder
    = LocalBlogBookmarksCompanion Function({
  drift.Value<String> id,
  drift.Value<String?> blogId,
  drift.Value<String?> userId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalBlogBookmarksTableUpdateCompanionBuilder
    = LocalBlogBookmarksCompanion Function({
  drift.Value<String> id,
  drift.Value<String?> blogId,
  drift.Value<String?> userId,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalBlogBookmarksTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogBookmarksTable> {
  $$LocalBlogBookmarksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalBlogBookmarksTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogBookmarksTable> {
  $$LocalBlogBookmarksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get blogId => $composableBuilder(
      column: $table.blogId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalBlogBookmarksTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogBookmarksTable> {
  $$LocalBlogBookmarksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get blogId =>
      $composableBuilder(column: $table.blogId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalBlogBookmarksTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalBlogBookmarksTable,
    LocalBlogBookmark,
    $$LocalBlogBookmarksTableFilterComposer,
    $$LocalBlogBookmarksTableOrderingComposer,
    $$LocalBlogBookmarksTableAnnotationComposer,
    $$LocalBlogBookmarksTableCreateCompanionBuilder,
    $$LocalBlogBookmarksTableUpdateCompanionBuilder,
    (
      LocalBlogBookmark,
      drift.BaseReferences<_$AppDatabase, $LocalBlogBookmarksTable,
          LocalBlogBookmark>
    ),
    LocalBlogBookmark,
    drift.PrefetchHooks Function()> {
  $$LocalBlogBookmarksTableTableManager(
      _$AppDatabase db, $LocalBlogBookmarksTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalBlogBookmarksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalBlogBookmarksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalBlogBookmarksTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String?> blogId = const drift.Value.absent(),
            drift.Value<String?> userId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogBookmarksCompanion(
            id: id,
            blogId: blogId,
            userId: userId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String?> blogId = const drift.Value.absent(),
            drift.Value<String?> userId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogBookmarksCompanion.insert(
            id: id,
            blogId: blogId,
            userId: userId,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalBlogBookmarksTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalBlogBookmarksTable,
        LocalBlogBookmark,
        $$LocalBlogBookmarksTableFilterComposer,
        $$LocalBlogBookmarksTableOrderingComposer,
        $$LocalBlogBookmarksTableAnnotationComposer,
        $$LocalBlogBookmarksTableCreateCompanionBuilder,
        $$LocalBlogBookmarksTableUpdateCompanionBuilder,
        (
          LocalBlogBookmark,
          drift.BaseReferences<_$AppDatabase, $LocalBlogBookmarksTable,
              LocalBlogBookmark>
        ),
        LocalBlogBookmark,
        drift.PrefetchHooks Function()>;
typedef $$LocalJobApplicationsTableCreateCompanionBuilder
    = LocalJobApplicationsCompanion Function({
  required String id,
  required String jobId,
  required String userId,
  drift.Value<String?> message,
  drift.Value<String?> cvUrl,
  drift.Value<String> status,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalJobApplicationsTableUpdateCompanionBuilder
    = LocalJobApplicationsCompanion Function({
  drift.Value<String> id,
  drift.Value<String> jobId,
  drift.Value<String> userId,
  drift.Value<String?> message,
  drift.Value<String?> cvUrl,
  drift.Value<String> status,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalJobApplicationsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalJobApplicationsTable> {
  $$LocalJobApplicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get jobId => $composableBuilder(
      column: $table.jobId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get cvUrl => $composableBuilder(
      column: $table.cvUrl, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalJobApplicationsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalJobApplicationsTable> {
  $$LocalJobApplicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get jobId => $composableBuilder(
      column: $table.jobId, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get cvUrl => $composableBuilder(
      column: $table.cvUrl, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalJobApplicationsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalJobApplicationsTable> {
  $$LocalJobApplicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  drift.GeneratedColumn<String> get cvUrl =>
      $composableBuilder(column: $table.cvUrl, builder: (column) => column);

  drift.GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalJobApplicationsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalJobApplicationsTable,
    LocalJobApplication,
    $$LocalJobApplicationsTableFilterComposer,
    $$LocalJobApplicationsTableOrderingComposer,
    $$LocalJobApplicationsTableAnnotationComposer,
    $$LocalJobApplicationsTableCreateCompanionBuilder,
    $$LocalJobApplicationsTableUpdateCompanionBuilder,
    (
      LocalJobApplication,
      drift.BaseReferences<_$AppDatabase, $LocalJobApplicationsTable,
          LocalJobApplication>
    ),
    LocalJobApplication,
    drift.PrefetchHooks Function()> {
  $$LocalJobApplicationsTableTableManager(
      _$AppDatabase db, $LocalJobApplicationsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalJobApplicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalJobApplicationsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalJobApplicationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> jobId = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String?> message = const drift.Value.absent(),
            drift.Value<String?> cvUrl = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalJobApplicationsCompanion(
            id: id,
            jobId: jobId,
            userId: userId,
            message: message,
            cvUrl: cvUrl,
            status: status,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String jobId,
            required String userId,
            drift.Value<String?> message = const drift.Value.absent(),
            drift.Value<String?> cvUrl = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalJobApplicationsCompanion.insert(
            id: id,
            jobId: jobId,
            userId: userId,
            message: message,
            cvUrl: cvUrl,
            status: status,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalJobApplicationsTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalJobApplicationsTable,
        LocalJobApplication,
        $$LocalJobApplicationsTableFilterComposer,
        $$LocalJobApplicationsTableOrderingComposer,
        $$LocalJobApplicationsTableAnnotationComposer,
        $$LocalJobApplicationsTableCreateCompanionBuilder,
        $$LocalJobApplicationsTableUpdateCompanionBuilder,
        (
          LocalJobApplication,
          drift.BaseReferences<_$AppDatabase, $LocalJobApplicationsTable,
              LocalJobApplication>
        ),
        LocalJobApplication,
        drift.PrefetchHooks Function()>;
typedef $$LocalBlogReportsTableCreateCompanionBuilder
    = LocalBlogReportsCompanion Function({
  required String id,
  required String blogId,
  required String userId,
  required String reason,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});
typedef $$LocalBlogReportsTableUpdateCompanionBuilder
    = LocalBlogReportsCompanion Function({
  drift.Value<String> id,
  drift.Value<String> blogId,
  drift.Value<String> userId,
  drift.Value<String> reason,
  drift.Value<DateTime> createdAt,
  drift.Value<int> rowid,
});

class $$LocalBlogReportsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogReportsTable> {
  $$LocalBlogReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));
}

class $$LocalBlogReportsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogReportsTable> {
  $$LocalBlogReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get blogId => $composableBuilder(
      column: $table.blogId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$LocalBlogReportsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $LocalBlogReportsTable> {
  $$LocalBlogReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get blogId =>
      $composableBuilder(column: $table.blogId, builder: (column) => column);

  drift.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  drift.GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalBlogReportsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $LocalBlogReportsTable,
    LocalBlogReport,
    $$LocalBlogReportsTableFilterComposer,
    $$LocalBlogReportsTableOrderingComposer,
    $$LocalBlogReportsTableAnnotationComposer,
    $$LocalBlogReportsTableCreateCompanionBuilder,
    $$LocalBlogReportsTableUpdateCompanionBuilder,
    (
      LocalBlogReport,
      drift
      .BaseReferences<_$AppDatabase, $LocalBlogReportsTable, LocalBlogReport>
    ),
    LocalBlogReport,
    drift.PrefetchHooks Function()> {
  $$LocalBlogReportsTableTableManager(
      _$AppDatabase db, $LocalBlogReportsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalBlogReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalBlogReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalBlogReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<String> id = const drift.Value.absent(),
            drift.Value<String> blogId = const drift.Value.absent(),
            drift.Value<String> userId = const drift.Value.absent(),
            drift.Value<String> reason = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogReportsCompanion(
            id: id,
            blogId: blogId,
            userId: userId,
            reason: reason,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String blogId,
            required String userId,
            required String reason,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              LocalBlogReportsCompanion.insert(
            id: id,
            blogId: blogId,
            userId: userId,
            reason: reason,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalBlogReportsTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDatabase,
        $LocalBlogReportsTable,
        LocalBlogReport,
        $$LocalBlogReportsTableFilterComposer,
        $$LocalBlogReportsTableOrderingComposer,
        $$LocalBlogReportsTableAnnotationComposer,
        $$LocalBlogReportsTableCreateCompanionBuilder,
        $$LocalBlogReportsTableUpdateCompanionBuilder,
        (
          LocalBlogReport,
          drift.BaseReferences<_$AppDatabase, $LocalBlogReportsTable,
              LocalBlogReport>
        ),
        LocalBlogReport,
        drift.PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalUsersTableTableManager get localUsers =>
      $$LocalUsersTableTableManager(_db, _db.localUsers);
  $$LocalChangesTableTableManager get localChanges =>
      $$LocalChangesTableTableManager(_db, _db.localChanges);
  $$LocalUpgradeRequestsTableTableManager get localUpgradeRequests =>
      $$LocalUpgradeRequestsTableTableManager(_db, _db.localUpgradeRequests);
  $$LocalNotificationsTableTableManager get localNotifications =>
      $$LocalNotificationsTableTableManager(_db, _db.localNotifications);
  $$LocalReportsTableTableManager get localReports =>
      $$LocalReportsTableTableManager(_db, _db.localReports);
  $$LocalServiceApplicationsTableTableManager get localServiceApplications =>
      $$LocalServiceApplicationsTableTableManager(
          _db, _db.localServiceApplications);
  $$LocalServiceRatingsTableTableManager get localServiceRatings =>
      $$LocalServiceRatingsTableTableManager(_db, _db.localServiceRatings);
  $$LocalServicesTableTableManager get localServices =>
      $$LocalServicesTableTableManager(_db, _db.localServices);
  $$ServiceRatingsTableTableManager get serviceRatings =>
      $$ServiceRatingsTableTableManager(_db, _db.serviceRatings);
  $$HireRequestsTableTableManager get hireRequests =>
      $$HireRequestsTableTableManager(_db, _db.hireRequests);
  $$LocalFavoritesTableTableManager get localFavorites =>
      $$LocalFavoritesTableTableManager(_db, _db.localFavorites);
  $$LocalCommentsTableTableManager get localComments =>
      $$LocalCommentsTableTableManager(_db, _db.localComments);
  $$LocalMessagesTableTableManager get localMessages =>
      $$LocalMessagesTableTableManager(_db, _db.localMessages);
  $$ServicesTableTableManager get services =>
      $$ServicesTableTableManager(_db, _db.services);
  $$LocalBlogsTableTableManager get localBlogs =>
      $$LocalBlogsTableTableManager(_db, _db.localBlogs);
  $$LocalBlogRatingsTableTableManager get localBlogRatings =>
      $$LocalBlogRatingsTableTableManager(_db, _db.localBlogRatings);
  $$LocalBlogLikesTableTableManager get localBlogLikes =>
      $$LocalBlogLikesTableTableManager(_db, _db.localBlogLikes);
  $$LocalJobsTableTableManager get localJobs =>
      $$LocalJobsTableTableManager(_db, _db.localJobs);
  $$LocalFollowsTableTableManager get localFollows =>
      $$LocalFollowsTableTableManager(_db, _db.localFollows);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$ConversationsTableTableManager get conversations =>
      $$ConversationsTableTableManager(_db, _db.conversations);
  $$LocalBlogBookmarksTableTableManager get localBlogBookmarks =>
      $$LocalBlogBookmarksTableTableManager(_db, _db.localBlogBookmarks);
  $$LocalJobApplicationsTableTableManager get localJobApplications =>
      $$LocalJobApplicationsTableTableManager(_db, _db.localJobApplications);
  $$LocalBlogReportsTableTableManager get localBlogReports =>
      $$LocalBlogReportsTableTableManager(_db, _db.localBlogReports);
}
