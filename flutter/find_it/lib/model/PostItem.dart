
import 'package:find_it/utils.dart';

class PostItem {
  String _idX;
  DateTime _datetime;
  String _description;
  String _foundby;
  String _locdeposited;
  String _locfound;
  List _types;
  String _owner;
  String _claimedby;
  List _claimers;
  String _admin;

  PostItem(
      {DateTime datetime,
        String description,
        String foundby,
        String locdeposited,
        String locfound,
        List types,
        String owner,
        String claimedby,
        List claimers,
      String idX,
        String admin}) {
    this._datetime = datetime;
    this._description = description;
    this._foundby = foundby;
    this._locdeposited = locdeposited;
    this._locfound = locfound;
    this._types = types;
    this._owner = owner;
    this._claimedby = claimedby;
    this._claimers = claimers;
    this._idX=idX;
    this._admin=admin;
  }

  String get admin => _admin;

  set admin(String value) {
    _admin = value;
  }

  String get idX => _idX;

  set idX(String value) {
    _idX = value;
  }

  DateTime get datetime => _datetime;
  set datetime(DateTime datetime) => _datetime = datetime;
  String get description => _description;
  set description(String description) => _description = description;
  String get foundby => _foundby;
  set foundby(String foundby) => _foundby = foundby;
  String get locdeposited => _locdeposited;
  set locdeposited(String locdeposited) => _locdeposited = locdeposited;
  String get locfound => _locfound;
  set locfound(String locfound) => _locfound = locfound;
  List get types => _types;
  set types(List types) => _types = types;
  String get owner => _owner;
  set owner(String owner) => _owner = owner;
  String get claimedby => _claimedby;
  set claimedby(String claimedby) => _claimedby = claimedby;
  List get claimers => _claimers;
  set claimers(List claimers) => _claimers = claimers;

  static PostItem fromJson(Map<String, dynamic> json) {

    return PostItem(
      datetime: Utils.toDateTime(json['datetime']),
      description: json['description'],
      foundby: json['foundby'],
      locdeposited: json['locdeposited'],
      locfound: json['locfound'],
      types: json['types'],
      owner: json['owner'],
      claimedby: json['claimedby'],
      claimers: json['claimers'],
      idX: json['id'],
      admin: json['admin']
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = Utils.fromDateTimeToJson(this._datetime);
    data['description'] = this._description;
    data['foundby'] = this._foundby;
    data['locdeposited'] = this._locdeposited;
    data['locfound'] = this._locfound;
    data['types'] = this._types;
    data['owner'] = this._owner;
    data['claimedby'] = this._claimedby;
    data['claimers'] = this._claimers;
    data['admin']=this._admin;
    return data;
  }
}