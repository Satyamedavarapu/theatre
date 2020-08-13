import 'package:rxdart/rxdart.dart';

class HomeScreenBloc {
  static HomeScreenBloc _instance;

  HomeScreenBloc();

  static HomeScreenBloc getInstance() {
    if (_instance == null) _instance = HomeScreenBloc();
    return _instance;
  }

  final presentStreamController = new BehaviorSubject<int>();

  Stream<int> get presentStream => presentStreamController.stream;

  void onStreamChange(int event) {
    presentStreamController.add(event);
  }

  Stream<int> getStream() {
    return presentStream;
  }
}
