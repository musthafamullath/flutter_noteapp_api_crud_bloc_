import 'package:bloc/bloc.dart';

class CheckboxCubit extends Cubit<bool> {
  CheckboxCubit() : super(false);
  void isChecked(){
    emit(!state);
  }
  void resetChecked(){
    emit(false);
  }
}
