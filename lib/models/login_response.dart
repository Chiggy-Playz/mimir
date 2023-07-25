import 'dart:convert';

class LoginResponse {
  User user;
  String userDefaultLibraryId;
  ServerSettings serverSettings;
  String source;

  LoginResponse({
    required this.user,
    required this.userDefaultLibraryId,
    required this.serverSettings,
    required this.source,
  });

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        user: User.fromMap(json["user"]),
        userDefaultLibraryId: json["userDefaultLibraryId"],
        serverSettings: ServerSettings.fromMap(json["serverSettings"]),
        source: json["Source"],
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "userDefaultLibraryId": userDefaultLibraryId,
        "serverSettings": serverSettings.toMap(),
        "Source": source,
      };
}

class ServerSettings {
  String id;
  bool scannerFindCovers;
  String scannerCoverProvider;
  bool scannerParseSubtitle;
  bool scannerPreferAudioMetadata;
  bool scannerPreferOpfMetadata;
  bool scannerPreferMatchedMetadata;
  bool scannerDisableWatcher;
  bool scannerPreferOverdriveMediaMarker;
  bool? scannerUseSingleThreadedProber;
  int? scannerMaxThreads;
  bool scannerUseTone;
  bool storeCoverWithItem;
  bool storeMetadataWithItem;
  String metadataFileFormat;
  int rateLimitLoginRequests;
  int rateLimitLoginWindow;
  bool backupSchedule;
  int backupsToKeep;
  int maxBackupSize;
  bool backupMetadataCovers;
  int loggerDailyLogsToKeep;
  int loggerScannerLogsToKeep;
  int homeBookshelfView;
  int bookshelfView;
  bool sortingIgnorePrefix;
  List<String> sortingPrefixes;
  bool chromecastEnabled;
  String dateFormat;
  String timeFormat;
  String language;
  int logLevel;
  String version;

  ServerSettings({
    required this.id,
    required this.scannerFindCovers,
    required this.scannerCoverProvider,
    required this.scannerParseSubtitle,
    required this.scannerPreferAudioMetadata,
    required this.scannerPreferOpfMetadata,
    required this.scannerPreferMatchedMetadata,
    required this.scannerDisableWatcher,
    required this.scannerPreferOverdriveMediaMarker,
    required this.scannerUseSingleThreadedProber,
    required this.scannerMaxThreads,
    required this.scannerUseTone,
    required this.storeCoverWithItem,
    required this.storeMetadataWithItem,
    required this.metadataFileFormat,
    required this.rateLimitLoginRequests,
    required this.rateLimitLoginWindow,
    required this.backupSchedule,
    required this.backupsToKeep,
    required this.maxBackupSize,
    required this.backupMetadataCovers,
    required this.loggerDailyLogsToKeep,
    required this.loggerScannerLogsToKeep,
    required this.homeBookshelfView,
    required this.bookshelfView,
    required this.sortingIgnorePrefix,
    required this.sortingPrefixes,
    required this.chromecastEnabled,
    required this.dateFormat,
    required this.timeFormat,
    required this.language,
    required this.logLevel,
    required this.version,
  });

  factory ServerSettings.fromJson(String str) =>
      ServerSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServerSettings.fromMap(Map<String, dynamic> json) => ServerSettings(
        id: json["id"],
        scannerFindCovers: json["scannerFindCovers"],
        scannerCoverProvider: json["scannerCoverProvider"],
        scannerParseSubtitle: json["scannerParseSubtitle"],
        scannerPreferAudioMetadata: json["scannerPreferAudioMetadata"],
        scannerPreferOpfMetadata: json["scannerPreferOpfMetadata"],
        scannerPreferMatchedMetadata: json["scannerPreferMatchedMetadata"],
        scannerDisableWatcher: json["scannerDisableWatcher"],
        scannerPreferOverdriveMediaMarker:
            json["scannerPreferOverdriveMediaMarker"],
        scannerUseSingleThreadedProber: json["scannerUseSingleThreadedProber"],
        scannerMaxThreads: json["scannerMaxThreads"],
        scannerUseTone: json["scannerUseTone"],
        storeCoverWithItem: json["storeCoverWithItem"],
        storeMetadataWithItem: json["storeMetadataWithItem"],
        metadataFileFormat: json["metadataFileFormat"],
        rateLimitLoginRequests: json["rateLimitLoginRequests"],
        rateLimitLoginWindow: json["rateLimitLoginWindow"],
        backupSchedule: json["backupSchedule"],
        backupsToKeep: json["backupsToKeep"],
        maxBackupSize: json["maxBackupSize"],
        backupMetadataCovers: json["backupMetadataCovers"],
        loggerDailyLogsToKeep: json["loggerDailyLogsToKeep"],
        loggerScannerLogsToKeep: json["loggerScannerLogsToKeep"],
        homeBookshelfView: json["homeBookshelfView"],
        bookshelfView: json["bookshelfView"],
        sortingIgnorePrefix: json["sortingIgnorePrefix"],
        sortingPrefixes:
            List<String>.from(json["sortingPrefixes"].map((x) => x)),
        chromecastEnabled: json["chromecastEnabled"],
        dateFormat: json["dateFormat"],
        timeFormat: json["timeFormat"],
        language: json["language"],
        logLevel: json["logLevel"],
        version: json["version"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "scannerFindCovers": scannerFindCovers,
        "scannerCoverProvider": scannerCoverProvider,
        "scannerParseSubtitle": scannerParseSubtitle,
        "scannerPreferAudioMetadata": scannerPreferAudioMetadata,
        "scannerPreferOpfMetadata": scannerPreferOpfMetadata,
        "scannerPreferMatchedMetadata": scannerPreferMatchedMetadata,
        "scannerDisableWatcher": scannerDisableWatcher,
        "scannerPreferOverdriveMediaMarker": scannerPreferOverdriveMediaMarker,
        "scannerUseSingleThreadedProber": scannerUseSingleThreadedProber,
        "scannerMaxThreads": scannerMaxThreads,
        "scannerUseTone": scannerUseTone,
        "storeCoverWithItem": storeCoverWithItem,
        "storeMetadataWithItem": storeMetadataWithItem,
        "metadataFileFormat": metadataFileFormat,
        "rateLimitLoginRequests": rateLimitLoginRequests,
        "rateLimitLoginWindow": rateLimitLoginWindow,
        "backupSchedule": backupSchedule,
        "backupsToKeep": backupsToKeep,
        "maxBackupSize": maxBackupSize,
        "backupMetadataCovers": backupMetadataCovers,
        "loggerDailyLogsToKeep": loggerDailyLogsToKeep,
        "loggerScannerLogsToKeep": loggerScannerLogsToKeep,
        "homeBookshelfView": homeBookshelfView,
        "bookshelfView": bookshelfView,
        "sortingIgnorePrefix": sortingIgnorePrefix,
        "sortingPrefixes": List<dynamic>.from(sortingPrefixes.map((x) => x)),
        "chromecastEnabled": chromecastEnabled,
        "dateFormat": dateFormat,
        "timeFormat": timeFormat,
        "language": language,
        "logLevel": logLevel,
        "version": version,
      };
}

class User {
  String id;
  String username;
  String type;
  String token;
  List<MediaProgress> mediaProgress;
  List<dynamic> seriesHideFromContinueListening;
  List<dynamic> bookmarks;
  bool isActive;
  bool isLocked;
  int lastSeen;
  int createdAt;
  Permissions permissions;
  List<dynamic> librariesAccessible;
  List<dynamic> itemTagsSelected;

  User({
    required this.id,
    required this.username,
    required this.type,
    required this.token,
    required this.mediaProgress,
    required this.seriesHideFromContinueListening,
    required this.bookmarks,
    required this.isActive,
    required this.isLocked,
    required this.lastSeen,
    required this.createdAt,
    required this.permissions,
    required this.librariesAccessible,
    required this.itemTagsSelected,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        type: json["type"],
        token: json["token"],
        mediaProgress: List<MediaProgress>.from(
            json["mediaProgress"].map((x) => MediaProgress.fromMap(x))),
        seriesHideFromContinueListening: List<dynamic>.from(
            json["seriesHideFromContinueListening"].map((x) => x)),
        bookmarks: List<dynamic>.from(json["bookmarks"].map((x) => x)),
        isActive: json["isActive"],
        isLocked: json["isLocked"],
        lastSeen: json["lastSeen"],
        createdAt: json["createdAt"],
        permissions: Permissions.fromMap(json["permissions"]),
        librariesAccessible:
            List<dynamic>.from(json["librariesAccessible"].map((x) => x)),
        itemTagsSelected:
            List<dynamic>.from(json["itemTagsSelected"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "type": type,
        "token": token,
        "mediaProgress":
            List<dynamic>.from(mediaProgress.map((x) => x.toMap())),
        "seriesHideFromContinueListening":
            List<dynamic>.from(seriesHideFromContinueListening.map((x) => x)),
        "bookmarks": List<dynamic>.from(bookmarks.map((x) => x)),
        "isActive": isActive,
        "isLocked": isLocked,
        "lastSeen": lastSeen,
        "createdAt": createdAt,
        "permissions": permissions.toMap(),
        "librariesAccessible":
            List<dynamic>.from(librariesAccessible.map((x) => x)),
        "itemTagsSelected": List<dynamic>.from(itemTagsSelected.map((x) => x)),
      };
}

class MediaProgress {
  String id;
  String libraryItemId;
  String? episodeId;
  double duration;
  double progress;
  double currentTime;
  bool isFinished;
  bool hideFromContinueListening;
  int lastUpdate;
  int startedAt;
  dynamic finishedAt;

  MediaProgress({
    required this.id,
    required this.libraryItemId,
    required this.episodeId,
    required this.duration,
    required this.progress,
    required this.currentTime,
    required this.isFinished,
    required this.hideFromContinueListening,
    required this.lastUpdate,
    required this.startedAt,
    this.finishedAt,
  });

  factory MediaProgress.fromJson(String str) =>
      MediaProgress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaProgress.fromMap(Map<String, dynamic> json) => MediaProgress(
        id: json["id"],
        libraryItemId: json["libraryItemId"],
        episodeId: json["episodeId"],
        duration: json["duration"]?.toDouble(),
        progress: json["progress"]?.toDouble(),
        currentTime: json["currentTime"]?.toDouble(),
        isFinished: json["isFinished"],
        hideFromContinueListening: json["hideFromContinueListening"],
        lastUpdate: json["lastUpdate"],
        startedAt: json["startedAt"],
        finishedAt: json["finishedAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "libraryItemId": libraryItemId,
        "episodeId": episodeId,
        "duration": duration,
        "progress": progress,
        "currentTime": currentTime,
        "isFinished": isFinished,
        "hideFromContinueListening": hideFromContinueListening,
        "lastUpdate": lastUpdate,
        "startedAt": startedAt,
        "finishedAt": finishedAt,
      };
}

class Permissions {
  bool download;
  bool update;
  bool delete;
  bool upload;
  bool accessAllLibraries;
  bool accessAllTags;
  bool accessExplicitContent;

  Permissions({
    required this.download,
    required this.update,
    required this.delete,
    required this.upload,
    required this.accessAllLibraries,
    required this.accessAllTags,
    required this.accessExplicitContent,
  });

  factory Permissions.fromJson(String str) =>
      Permissions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Permissions.fromMap(Map<String, dynamic> json) => Permissions(
        download: json["download"],
        update: json["update"],
        delete: json["delete"],
        upload: json["upload"],
        accessAllLibraries: json["accessAllLibraries"],
        accessAllTags: json["accessAllTags"],
        accessExplicitContent: json["accessExplicitContent"],
      );

  Map<String, dynamic> toMap() => {
        "download": download,
        "update": update,
        "delete": delete,
        "upload": upload,
        "accessAllLibraries": accessAllLibraries,
        "accessAllTags": accessAllTags,
        "accessExplicitContent": accessExplicitContent,
      };
}
