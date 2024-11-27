import 'dart:async';

enum TabEvent { tabChanged }

class TabBloc {
  int _currentIndex = 0;
  final _tabController = StreamController<int>();

  Stream<int> get currentIndex => _tabController.stream;

  void dispose() {
    _tabController.close();
  }

  void mapEventToState(TabEvent event, int tabIndex) {
    if (event == TabEvent.tabChanged) {
      _currentIndex = tabIndex; // Update currentIndex with the provided tabIndex
      _tabController.sink.add(_currentIndex);
    }
  }
}

