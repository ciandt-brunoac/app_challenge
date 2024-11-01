// Mocks generated by Mockito 5.4.4 from annotations
// in app_challenge/test/features/home/presenter/home_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:app_challenge/core/config/graphql_service.dart' as _i7;
import 'package:app_challenge/features/home/domain/entities/profile_entity.dart'
    as _i10;
import 'package:app_challenge/features/home/domain/usecases/get_home_profile_usecase.dart'
    as _i8;
import 'package:app_challenge/features/home/presenter/controllers/home_cubit.dart'
    as _i4;
import 'package:app_challenge/features/home/presenter/controllers/home_state.dart'
    as _i2;
import 'package:either_dart/either.dart' as _i9;
import 'package:flutter_bloc/flutter_bloc.dart' as _i6;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHomeState_0 extends _i1.SmartFake implements _i2.HomeState {
  _FakeHomeState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGraphQLClient_1 extends _i1.SmartFake implements _i3.GraphQLClient {
  _FakeGraphQLClient_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeCubit extends _i1.Mock implements _i4.HomeCubit {
  MockHomeCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeHomeState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.HomeState);

  @override
  _i5.Stream<_i2.HomeState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<_i2.HomeState>.empty(),
      ) as _i5.Stream<_i2.HomeState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i5.Future<void> getHomeData() => (super.noSuchMethod(
        Invocation.method(
          #getHomeData,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> initGraphqlService() => (super.noSuchMethod(
        Invocation.method(
          #initGraphqlService,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void emit(_i2.HomeState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i6.Change<_i2.HomeState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [GraphQlService].
///
/// See the documentation for Mockito's code generation for more information.
class MockGraphQlService extends _i1.Mock implements _i7.GraphQlService {
  MockGraphQlService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GraphQLClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeGraphQLClient_1(
          this,
          Invocation.getter(#client),
        ),
      ) as _i3.GraphQLClient);

  @override
  set client(_i3.GraphQLClient? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [GetHomeProfileUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetHomeProfileUsecase extends _i1.Mock
    implements _i8.GetHomeProfileUsecase {
  MockGetHomeProfileUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i9.Either<Exception, _i10.ProfileEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i5.Future<_i9.Either<Exception, _i10.ProfileEntity>>.value(
                _i11.dummyValue<_i9.Either<Exception, _i10.ProfileEntity>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i9.Either<Exception, _i10.ProfileEntity>>);
}
