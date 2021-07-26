import 'package:equatable/equatable.dart';

class Location extends Equatable{

  const Location(this.id, this.name, this.address);

  final int id;
  final String name;
  final String address;

  @override
  List<Object?> get props => [id, name, address];

  static Location fromJson(dynamic json) {
    return Location(json['id'], json['name'], json['address']);
  }

  static Location clone(Location location){
    Location clone = new Location(location.id, location.name, location.address);
    return clone;
  }
}