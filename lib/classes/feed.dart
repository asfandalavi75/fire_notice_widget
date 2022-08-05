import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Feed {
  Feed();
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "published")
  String? published;
  @JsonKey(name: "pub_date")
  String? pubDate;
  @JsonKey(name: "geo_rss_point")
  String? geoRssPoint;
  @JsonKey(name: "geo_lat", fromJson: _stringToDouble)
  double? geoLat;
  @JsonKey(name: "geo_long", fromJson: _stringToDouble)
  double? geoLong;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "guid")
  String? guid;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "county")
  String? county;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "is_delete")
  int? isDelete;
  @JsonKey(name: "title_trim")
  String? titleTrim;
  @JsonKey(name: "created_date")
  String? createdDate;
  @JsonKey(name: "updated_date")
  String? updatedDate;
  @JsonKey(name: "no_of_likes")
  int? noOfLikes;
  @JsonKey(name: "no_of_comments")
  int? noOfComments;
  @JsonKey(name: "no_of_shares")
  int? noOfShares;
  @JsonKey(name: "is_like")
  int? isLike;
  @JsonKey(name: "kount")
  int? kount;
  @JsonKey(name: "incident_id")
  int? incidentId;
  @JsonKey(name: "isMarkedSelected")
  bool? isMarkerSelected;
  @JsonKey(name: "distance")
  double? distance;
  @JsonKey(name: "EstimatedCostToDate", fromJson: _stringToDouble)
  double? estimatedCostToDate;
  @JsonKey(name: "DiscoveryAcres", fromJson: _stringToDouble)
  double? discoveryAcres;
  @JsonKey(name: "percentContained", fromJson: _stringToDouble)
  double? percentContained;
  @JsonKey(name: "origin")
  String? origin;
  @JsonKey(name: "overwatchImages")
  Map? overwatchImagesResponse;
  @JsonKey(name: "IncidentTypeCategory")
  String? incidentTypeCategory;
  @JsonKey(name: "recent_flag")
  int? recentFlag;
  @JsonKey(name: "stale")
  int? stale;
  @JsonKey(name: "POOLandownerKind")
  String? POOLandownerKind;
  @JsonKey(
    name: "FireMgmtComplexity",
  )
  String? FireMgmtComplexity;
  @JsonKey(
    name: "FireCause",
  )
  String? FireCause;
  static double _stringToDouble(String value) {
    double doubleVal;
    if (value != null) {
      doubleVal = double.parse(value);
    } else {
      doubleVal = 0.0;
    }
    return doubleVal;
  }

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
  bool matchingItem(String Key, dynamic value) {
    return this.toJson()[Key] == value;
  }
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'published': instance.published,
      'pub_date': instance.pubDate,
      'geo_rss_point': instance.geoRssPoint,
      'geo_lat': instance.geoLat,
      'geo_long': instance.geoLong,
      'link': instance.link,
      'guid': instance.guid,
      'description': instance.description,
      'city': instance.city,
      'county': instance.county,
      'state': instance.state,
      'country': instance.country,
      'is_delete': instance.isDelete,
      'title_trim': instance.titleTrim,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'no_of_likes': instance.noOfLikes,
      'no_of_comments': instance.noOfComments,
      'no_of_shares': instance.noOfShares,
      'is_like': instance.isLike,
      'kount': instance.kount,
      'incident_id': instance.incidentId,
      'isMarkedSelected': instance.isMarkerSelected,
      'distance': instance.distance,
      'origin': instance.origin,
      'POOLandownerKind': instance.POOLandownerKind,
      'FireMgmtComplexity': instance.FireMgmtComplexity,
      'FireCause': instance.FireCause,
      'EstimatedCostToDate': instance.estimatedCostToDate,
      'DiscoveryAcres': instance.discoveryAcres,
      'percentContained': instance.percentContained,
    };
Feed _$FeedFromJson(Map<String, dynamic> json) => Feed()
  ..id = json['id'] as int
  ..title = json['title'] as String
  ..published = json['published'] as String
  ..pubDate = json['pub_date'] as String
  ..geoRssPoint = json['geo_rss_point'] as String
  ..geoLat = Feed._stringToDouble(json['geo_lat'] as String)
  ..geoLong = Feed._stringToDouble(json['geo_long'] as String)
  ..link = json['link'] as String
  ..guid = json['guid'] as String
  ..description = json['description'] as String
  ..city = json['city'] as String
  ..county = json['county'] as String
  ..state = json['state'] as String
  ..country = json['country'] as String
  ..isDelete = json['is_delete'] as int
  ..titleTrim = json['title_trim'] as String
  ..createdDate = json['created_date'] as String
  ..updatedDate = json['updated_date'] as String
  ..incidentTypeCategory = json['IncidentTypeCategory'] as String
  ..noOfLikes = json['no_of_likes'] as int
  ..recentFlag = json['recent_flag'] as int
  ..stale = json['stale'] as int
  ..noOfComments = json['no_of_comments'] as int
  ..noOfShares = json['no_of_shares'] as int
  ..isLike = json['is_like'] as int
  ..kount = json['kount'] as int
  ..incidentId = json['incident_id'] as int
  ..isMarkerSelected = json['isMarkedSelected'] as bool
  ..distance = json['distance'] as double
  ..discoveryAcres = (json['DiscoveryAcres'] as num).toDouble()
  ..percentContained = (json['percentContained'] as num).toDouble()
  ..estimatedCostToDate = (json['EstimatedCostToDate'] as num).toDouble()
  ..origin = json['origin'] as String
  ..POOLandownerKind = json['POOLandownerKind'] as String
  ..FireMgmtComplexity = json['FireMgmtComplexity'] as String
  ..FireCause = json['FireCause'] as String;

//generates a feed for testing purposes
Feed generateFeedInst() {
  return Feed()
    ..id = 32
    ..title = 'Sheep Fire'
    ..published = ""
    ..pubDate = " 01-Aug-22"
    ..geoRssPoint = ""
    ..geoLat = 0.0
    ..geoLong = 0.0
    ..link = "link"
    ..guid = "guid"
    ..description = "description"
    ..city = "New Paltz"
    ..county = "Ulster"
    ..state = "NY"
    ..country = "USA"
    ..isDelete = 0
    ..titleTrim = "trim"
    ..createdDate = "01-Aug-22"
    ..updatedDate = "Updated 20 mins ago"
    ..incidentTypeCategory = "Bad"
    ..noOfLikes = 5
    ..recentFlag = 1
    ..stale = 50
    ..noOfComments = 2
    ..noOfShares = 1
    ..isLike = 2
    ..kount = 42
    ..incidentId = 1445122
    ..isMarkerSelected = true
    ..distance = 21
    ..discoveryAcres = 22.1
    ..percentContained = 65
    ..estimatedCostToDate = 4500040
    ..origin = "Poughkeepsie"
    ..POOLandownerKind = "Local"
    ..FireMgmtComplexity = "Very High"
    ..FireCause = "Gender Reveal";
}
