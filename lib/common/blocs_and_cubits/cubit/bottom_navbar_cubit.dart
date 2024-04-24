import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarCubit extends Cubit<int>{
  BottomNavBarCubit():super(0);


  int currentIndex=0;

  void changeIndex(int newIndex){
    if(state!=newIndex){
      emit(currentIndex=newIndex);

    }
  }
}