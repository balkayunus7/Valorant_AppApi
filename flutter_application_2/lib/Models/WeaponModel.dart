class WeaponModel {
  String? uuid;
  String? displayName;
  String? category;
  String? defaultSkinUuid;
  String? displayIcon;
  String? killStreamIcon;
  String? assetPath;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skins>? skins;

  WeaponModel(
      {this.uuid,
      this.displayName,
      this.category,
      this.defaultSkinUuid,
      this.displayIcon,
      this.killStreamIcon,
      this.assetPath,
      this.weaponStats,
      this.shopData,
      this.skins});

  WeaponModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    category = json['category'];
    defaultSkinUuid = json['defaultSkinUuid'];
    displayIcon = json['displayIcon'];
    killStreamIcon = json['killStreamIcon'];
    assetPath = json['assetPath'];
    weaponStats = json['weaponStats'] != null
        ? new WeaponStats.fromJson(json['weaponStats'])
        : null;
    shopData = json['shopData'] != null
        ? new ShopData.fromJson(json['shopData'])
        : null;
    if (json['skins'] != null) {
      skins = <Skins>[];
      json['skins'].forEach((v) {
        skins!.add(new Skins.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['category'] = this.category;
    data['defaultSkinUuid'] = this.defaultSkinUuid;
    data['displayIcon'] = this.displayIcon;
    data['killStreamIcon'] = this.killStreamIcon;
    data['assetPath'] = this.assetPath;
    if (this.weaponStats != null) {
      data['weaponStats'] = this.weaponStats!.toJson();
    }
    if (this.shopData != null) {
      data['shopData'] = this.shopData!.toJson();
    }
    if (this.skins != null) {
      data['skins'] = this.skins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeaponStats {
  int? fireRate;
  int? magazineSize;
  double? runSpeedMultiplier;
  double? equipTimeSeconds;
  int? reloadTimeSeconds;
  double? firstBulletAccuracy;
  int? shotgunPelletCount;
  String? wallPenetration;
  String? feature;
  Null? fireMode;
  String? altFireType;
  AdsStats? adsStats;
  Null? altShotgunStats;
  Null? airBurstStats;
  List<DamageRanges>? damageRanges;

  WeaponStats(
      {this.fireRate,
      this.magazineSize,
      this.runSpeedMultiplier,
      this.equipTimeSeconds,
      this.reloadTimeSeconds,
      this.firstBulletAccuracy,
      this.shotgunPelletCount,
      this.wallPenetration,
      this.feature,
      this.fireMode,
      this.altFireType,
      this.adsStats,
      this.altShotgunStats,
      this.airBurstStats,
      this.damageRanges});

  WeaponStats.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    equipTimeSeconds = json['equipTimeSeconds'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    shotgunPelletCount = json['shotgunPelletCount'];
    wallPenetration = json['wallPenetration'];
    feature = json['feature'];
    fireMode = json['fireMode'];
    altFireType = json['altFireType'];
    adsStats = json['adsStats'] != null
        ? new AdsStats.fromJson(json['adsStats'])
        : null;
    altShotgunStats = json['altShotgunStats'];
    airBurstStats = json['airBurstStats'];
    if (json['damageRanges'] != null) {
      damageRanges = <DamageRanges>[];
      json['damageRanges'].forEach((v) {
        damageRanges!.add(new DamageRanges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fireRate'] = this.fireRate;
    data['magazineSize'] = this.magazineSize;
    data['runSpeedMultiplier'] = this.runSpeedMultiplier;
    data['equipTimeSeconds'] = this.equipTimeSeconds;
    data['reloadTimeSeconds'] = this.reloadTimeSeconds;
    data['firstBulletAccuracy'] = this.firstBulletAccuracy;
    data['shotgunPelletCount'] = this.shotgunPelletCount;
    data['wallPenetration'] = this.wallPenetration;
    data['feature'] = this.feature;
    data['fireMode'] = this.fireMode;
    data['altFireType'] = this.altFireType;
    if (this.adsStats != null) {
      data['adsStats'] = this.adsStats!.toJson();
    }
    data['altShotgunStats'] = this.altShotgunStats;
    data['airBurstStats'] = this.airBurstStats;
    if (this.damageRanges != null) {
      data['damageRanges'] = this.damageRanges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdsStats {
  double? zoomMultiplier;
  double? fireRate;
  double? runSpeedMultiplier;
  int? burstCount;
  double? firstBulletAccuracy;

  AdsStats(
      {this.zoomMultiplier,
      this.fireRate,
      this.runSpeedMultiplier,
      this.burstCount,
      this.firstBulletAccuracy});

  AdsStats.fromJson(Map<String, dynamic> json) {
    zoomMultiplier = json['zoomMultiplier'];
    fireRate = json['fireRate'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    burstCount = json['burstCount'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zoomMultiplier'] = this.zoomMultiplier;
    data['fireRate'] = this.fireRate;
    data['runSpeedMultiplier'] = this.runSpeedMultiplier;
    data['burstCount'] = this.burstCount;
    data['firstBulletAccuracy'] = this.firstBulletAccuracy;
    return data;
  }
}

class DamageRanges {
  int? rangeStartMeters;
  int? rangeEndMeters;
  double? headDamage;
  int? bodyDamage;
  double? legDamage;

  DamageRanges(
      {this.rangeStartMeters,
      this.rangeEndMeters,
      this.headDamage,
      this.bodyDamage,
      this.legDamage});

  DamageRanges.fromJson(Map<String, dynamic> json) {
    rangeStartMeters = json['rangeStartMeters'];
    rangeEndMeters = json['rangeEndMeters'];
    headDamage = json['headDamage'];
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rangeStartMeters'] = this.rangeStartMeters;
    data['rangeEndMeters'] = this.rangeEndMeters;
    data['headDamage'] = this.headDamage;
    data['bodyDamage'] = this.bodyDamage;
    data['legDamage'] = this.legDamage;
    return data;
  }
}

class ShopData {
  int? cost;
  String? category;
  String? categoryText;
  GridPosition? gridPosition;
  bool? canBeTrashed;
  Null? image;
  String? newImage;
  Null? newImage2;
  String? assetPath;

  ShopData(
      {this.cost,
      this.category,
      this.categoryText,
      this.gridPosition,
      this.canBeTrashed,
      this.image,
      this.newImage,
      this.newImage2,
      this.assetPath});

  ShopData.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    category = json['category'];
    categoryText = json['categoryText'];
    gridPosition = json['gridPosition'] != null
        ? new GridPosition.fromJson(json['gridPosition'])
        : null;
    canBeTrashed = json['canBeTrashed'];
    image = json['image'];
    newImage = json['newImage'];
    newImage2 = json['newImage2'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cost'] = this.cost;
    data['category'] = this.category;
    data['categoryText'] = this.categoryText;
    if (this.gridPosition != null) {
      data['gridPosition'] = this.gridPosition!.toJson();
    }
    data['canBeTrashed'] = this.canBeTrashed;
    data['image'] = this.image;
    data['newImage'] = this.newImage;
    data['newImage2'] = this.newImage2;
    data['assetPath'] = this.assetPath;
    return data;
  }
}

class GridPosition {
  int? row;
  int? column;

  GridPosition({this.row, this.column});

  GridPosition.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['column'] = this.column;
    return data;
  }
}

class Skins {
  String? uuid;
  String? displayName;
  String? themeUuid;
  String? contentTierUuid;
  String? displayIcon;
  Null? wallpaper;
  String? assetPath;
  List<Chromas>? chromas;
  List<Levels>? levels;

  Skins(
      {this.uuid,
      this.displayName,
      this.themeUuid,
      this.contentTierUuid,
      this.displayIcon,
      this.wallpaper,
      this.assetPath,
      this.chromas,
      this.levels});

  Skins.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    themeUuid = json['themeUuid'];
    contentTierUuid = json['contentTierUuid'];
    displayIcon = json['displayIcon'];
    wallpaper = json['wallpaper'];
    assetPath = json['assetPath'];
    if (json['chromas'] != null) {
      chromas = <Chromas>[];
      json['chromas'].forEach((v) {
        chromas!.add(new Chromas.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(new Levels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['themeUuid'] = this.themeUuid;
    data['contentTierUuid'] = this.contentTierUuid;
    data['displayIcon'] = this.displayIcon;
    data['wallpaper'] = this.wallpaper;
    data['assetPath'] = this.assetPath;
    if (this.chromas != null) {
      data['chromas'] = this.chromas!.map((v) => v.toJson()).toList();
    }
    if (this.levels != null) {
      data['levels'] = this.levels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chromas {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? fullRender;
  String? swatch;
  String? streamedVideo;
  String? assetPath;

  Chromas(
      {this.uuid,
      this.displayName,
      this.displayIcon,
      this.fullRender,
      this.swatch,
      this.streamedVideo,
      this.assetPath});

  Chromas.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    fullRender = json['fullRender'];
    swatch = json['swatch'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['displayIcon'] = this.displayIcon;
    data['fullRender'] = this.fullRender;
    data['swatch'] = this.swatch;
    data['streamedVideo'] = this.streamedVideo;
    data['assetPath'] = this.assetPath;
    return data;
  }
}

class Levels {
  String? uuid;
  String? displayName;
  String? levelItem;
  String? displayIcon;
  String? streamedVideo;
  String? assetPath;

  Levels(
      {this.uuid,
      this.displayName,
      this.levelItem,
      this.displayIcon,
      this.streamedVideo,
      this.assetPath});

  Levels.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    levelItem = json['levelItem'];
    displayIcon = json['displayIcon'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['levelItem'] = this.levelItem;
    data['displayIcon'] = this.displayIcon;
    data['streamedVideo'] = this.streamedVideo;
    data['assetPath'] = this.assetPath;
    return data;
  }
}
