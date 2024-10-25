abstract class NewsEvent {}

class SearchNewsEvents extends NewsEvent {
  final String query;
  SearchNewsEvents({required this.query});
}
