
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier{
  int currentIndex = 0;
  var controller = PageController(initialPage: 0);
  
  setCurrentIndex(int index) {
    currentIndex = index;
    if(controller.hasClients){
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }
} 