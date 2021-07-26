import 'package:equatable/equatable.dart';

class User extends Equatable{

  const User(this.id, this.name);

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];

  static User fromJson(dynamic json) {
    return User(json['id'], json['name']);
  }
}