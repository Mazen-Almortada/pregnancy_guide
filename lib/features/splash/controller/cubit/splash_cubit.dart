import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pregnancy_guide/core/services/database_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  final DatabaseService _databaseService = DatabaseService();
  Future<void> checkFirstTimeUse() async {
    final isFirstTime =
        await _databaseService.getBoolValue("first_time") ?? true;
    if (isFirstTime) {
      emit(FirstTimeOpenApp());
    } else {
      emit(NotFirstTime());
    }
  }
}
