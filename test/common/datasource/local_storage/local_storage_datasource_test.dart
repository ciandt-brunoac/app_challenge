import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_challenge/common/data/datasources/local_storage/local_storage_datasource.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LocalStorageDatasource localStorageDatasource;
  late MockSharedPreferences mockSharedPreferences;
  const testKey = 'testKey';
  const testValue = 'testValue';

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localStorageDatasource =
        LocalStorageDatasource(sharedPreferences: mockSharedPreferences);
  });

  group('LocalStorageDatasource', () {
    test('should return data when there is one in local storage', () {
      // Arrange
      when(mockSharedPreferences.getString(testKey)).thenReturn(testValue);

      // Act
      final result = localStorageDatasource.getData(key: testKey);

      // Assert
      expect(result, testValue);
      verify(mockSharedPreferences.getString(testKey));
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should return empty string when there is no data in local storage',
        () {
      // Arrange
      when(mockSharedPreferences.getString(testKey)).thenReturn(null);

      // Act
      final result = localStorageDatasource.getData(key: testKey);

      // Assert
      expect(result, '');
      verify(mockSharedPreferences.getString(testKey));
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    // test('should call SharedPreferences to save the data', () async {
    //   when(mockSharedPreferences.setString(testKey, testValue))
    //       .thenAnswer((_) async => true);
    //   await localStorageDatasource.setData(key: testKey, value: testValue);

    //   verify(() => mockSharedPreferences.setString(testKey, testValue))
    //       .called(1);
    // });
  });
}
