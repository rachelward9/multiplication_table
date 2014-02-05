library main_view;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('main-view')
class MainView extends PolymerElement {

  static const int ROW_MAX = 10;
  static const int COL_MAX = 10;
  static const int ROW_MIN = 0;
  static const int COL_MIN = 0;
  
  List<List> tableList = toObservable([]);
  
  // non-visual initialization can be done here
  MainView.created() : super.created();

  // other initialization can be done here
  @override void enteredView() {
    super.enteredView();
    print("MainView::enteredView()");
    multiplication();
  }
  
  void multiplication() {
    
//    Creating row header
    tableList.add(toObservable([]));
    tableList[0].add("X");
    
    for (int col = COL_MIN; col <= COL_MAX; col++) {
      tableList[0].add(col);
    }
    
    for (int row = ROW_MIN; row <= ROW_MAX; row++) {
      tableList.add(toObservable([]));
      tableList[row + 1].add(row);
      
      for (int col = COL_MIN; col <= COL_MAX; col++) {
        tableList[row + 1].add(row * col);
      }
    }
  }

  // this lets the global CSS bleed through into the Shadow DOM of this element
  bool get applyAuthorStyles => true;
}

