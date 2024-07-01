import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final String code;
  final String value;

  const LanguageEntity({
    required this.value,
    required this.code,
  });

  @override
  List<Object?> get props => [value, code];
}
