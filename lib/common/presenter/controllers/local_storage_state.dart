import 'package:equatable/equatable.dart';

class LocalStorageState extends Equatable {
  final LoginStatus status;

  const LocalStorageState({
    this.status = LoginStatus.initial,
  });

  LocalStorageState copyWith({
    LoginStatus? status,
  }) {
    return LocalStorageState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}

enum LoginStatus { initial, loading, success, failure }
