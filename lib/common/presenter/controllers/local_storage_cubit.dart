import 'package:app_challenge/common/domain/usecases/get_local_storage_usecase.dart';
import 'package:app_challenge/common/domain/usecases/post_local_storage_usecase.dart';
import 'package:app_challenge/common/presenter/controllers/local_storage_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalStorageCubit extends Cubit<LocalStorageState> {
  late final GetLocalStorageUsecase _getLocalStorageUsecase;
  late final PostLocalStorageUseCase _postLocalStorageUseCase;

  LocalStorageCubit({
    required GetLocalStorageUsecase getLocalStorageUsecase,
    required PostLocalStorageUseCase postLocalStorageUseCase,
  })  : _getLocalStorageUsecase = getLocalStorageUsecase,
        _postLocalStorageUseCase = postLocalStorageUseCase,
        super(const LocalStorageState(status: LoginStatus.initial));

  Future<void> saveData({required String key, required String value}) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final Either<Exception, bool> result =
        await _postLocalStorageUseCase.call(key: key, value: value);

    result.fold(
      (left) {
        emit(state.copyWith(status: LoginStatus.failure));
      },
      (right) {
        emit(state.copyWith(status: LoginStatus.success));
      },
    );
  }

  Future<void> getData({required String key}) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final Either<Exception, String> result =
        await _getLocalStorageUsecase.call(key: key);

    result.fold(
      (left) {
        emit(state.copyWith(status: LoginStatus.failure));
      },
      (right) {
        emit(state.copyWith(status: LoginStatus.success));
      },
    );
  }
}
