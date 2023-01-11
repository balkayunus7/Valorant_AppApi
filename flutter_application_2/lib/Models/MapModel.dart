class MapModel {
  String? uuid;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;
  double? xMultiplier;
  double? yMultiplier;
  double? xScalarToAdd;
  double? yScalarToAdd;
  List<Callouts>? callouts;

  MapModel(
      {this.uuid,
      this.displayName,
      this.coordinates,
      this.displayIcon,
      this.listViewIcon,
      this.splash,
      this.assetPath,
      this.mapUrl,
      this.xMultiplier,
      this.yMultiplier,
      this.xScalarToAdd,
      this.yScalarToAdd,
      this.callouts});

  MapModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    splash = json['splash'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    xMultiplier = json['xMultiplier'];
    yMultiplier = json['yMultiplier'];
    xScalarToAdd = json['xScalarToAdd'];
    yScalarToAdd = json['yScalarToAdd'];
    if (json['callouts'] != null) {
      callouts = <Callouts>[];
      json['callouts'].forEach((v) {
        callouts!.add(new Callouts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['coordinates'] = this.coordinates;
    data['displayIcon'] = this.displayIcon;
    data['listViewIcon'] = this.listViewIcon;
    data['splash'] = this.splash;
    data['assetPath'] = this.assetPath;
    data['mapUrl'] = this.mapUrl;
    data['xMultiplier'] = this.xMultiplier;
    data['yMultiplier'] = this.yMultiplier;
    data['xScalarToAdd'] = this.xScalarToAdd;
    data['yScalarToAdd'] = this.yScalarToAdd;
    if (this.callouts != null) {
      data['callouts'] = this.callouts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Callouts {
  String? regionName;
  String? superRegionName;
  Location? location;

  Callouts({this.regionName, this.superRegionName, this.location});

  Callouts.fromJson(Map<String, dynamic> json) {
    regionName = json['regionName'];
    superRegionName = json['superRegionName'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regionName'] = this.regionName;
    data['superRegionName'] = this.superRegionName;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  double? x;
  double? y;

  Location({this.x, this.y});

  Location.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
