import 'package:equatable/equatable.dart';
import 'package:my_training_app/models/models.dart';

abstract class HighlightsState extends Equatable {
  const HighlightsState();

  @override
  List<Object> get props => [];
}

class HighlightsEmpty extends HighlightsState {}

class HighlightsLoading extends HighlightsState {}

class HighlightsLoaded extends HighlightsState {
  final List<Training> highlights;

  const HighlightsLoaded({required this.highlights});

  @override
  List<Object> get props => [highlights];
}

class HighlightsError extends HighlightsState {}