import 'package:flutter_bloc/flutter_bloc.dart';


class ButtonCubit extends Cubit<bool> {
  ButtonCubit() : super(false);
  
  void enableBTN(){
    emit(true);
  }

  void resetBTN(){
    emit(false);
  }
}
