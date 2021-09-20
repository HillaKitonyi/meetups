import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_validators.freezed.dart';

@freezed
abstract class ValueFailure<T> implements _$ValueFailure<T> {
  const ValueFailure._();
  const factory ValueFailure.invalidEmail(T failedVal) = _InvalidEmail<T>;
  const factory ValueFailure.shortPassword(T failedVal) = _ShortPassword<T>;
  const factory ValueFailure.empty(T failedVal) = _Empty<T>;
  const factory ValueFailure.exceededLength(T failedVal, int maxLength) = _ExceededLength<T>;

  String get message => when(
        invalidEmail: (_) => 'That email is invalid.',
        shortPassword: (_) => 'Short password. It should be 6+ characters.',
        empty: (_) => 'This field is required.',
        exceededLength: (_, maxLength) =>
            'This text exceeded maximum length of $maxLength characters',
      );
}

Either<ValueFailure<String>, String> validateEmail(String input) {
  final emailRegExp = RegExp(
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",
  );
  return emailRegExp.hasMatch(input) ? right(input) : left(ValueFailure.invalidEmail(input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  return input.length > 5 ? right(input) : left(ValueFailure.shortPassword(input));
}

Either<ValueFailure<String>, String> validateNotEmpty(String input) {
  return input.isEmpty ? left(ValueFailure.empty(input)) : right(input);
}

Either<ValueFailure<String>, String> validateMaxLength(String input, int max) {
  return input.length <= max ? right(input) : left(ValueFailure.exceededLength(input, max));
}
