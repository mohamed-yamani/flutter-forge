import 'package:equatable/equatable.dart';
import 'package:flutterforge/data/models/result_model.dart';

class ResultEntity extends Equatable {
  List<FData1>? data;
  Links? links;

  ResultEntity({
    this.data,
    this.links,
  });

  @override
  List<Object?> get props => [data, links];

  ResultEntity copyWith({
    List<FData1>? data,
    Links? links,
  }) {
    return ResultEntity(
      data: data ?? this.data,
      links: links ?? this.links,
    );
  }

  @override
  bool get stringify => true;
}
