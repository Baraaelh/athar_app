import 'package:flutter_bloc/flutter_bloc.dart';

/// Holds the selected bottom-navigation tab index.
class MainShellCubit extends Cubit<int> {
  MainShellCubit() : super(0);

  void selectTab(int index) {
    if (index != state) emit(index);
  }
}
