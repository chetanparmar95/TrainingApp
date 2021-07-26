import 'package:equatable/equatable.dart';
class TrainingFilterOptions extends Equatable{

  const TrainingFilterOptions(this.id, this.name);

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];

}