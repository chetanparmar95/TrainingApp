import 'package:equatable/equatable.dart';
import 'package:my_training_app/models/models.dart';

class Training extends Equatable{

  final int id;
  final String name;
  final String status;
  final User speaker;
  final String speakerPicUrl;
  final String coverPic;
  final Location location;
  final String date;
  final String fromTime;
  final String toTime;
  final String oldPrice;
  final String newPrice;
  final String summary;


  const Training(
      this.id,
      this.name,
      this.status,
      this.speaker,
      this.speakerPicUrl,
      this.coverPic,
      this.location,
      this.date,
      this.fromTime,
      this.toTime,
      this.oldPrice,
      this.newPrice,
      this.summary);

  @override
  List<Object?> get props => [id, name, status, speaker, speakerPicUrl, coverPic, location,
    date, fromTime,toTime, oldPrice, newPrice, summary];

  static Training fromJson(dynamic json){
    return Training(json['id'], json['name'], json['status'], User.fromJson(json['speaker']),
        json['speakerPicUrl'], json['coverPic'], Location.fromJson(json['location']), json['date'], json['fromTime'],
        json['fromTime'], json['oldPrice'], json['newPrice'], json['summary']);
  }

}