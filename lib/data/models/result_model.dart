import 'package:flutterforge/domain/entities/result_entity.dart';

class ResultModel {
  List<FData1>? data;
  Links? links;

  ResultModel({this.data, this.links});

  ResultModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FData1>[];
      json['data'].forEach((v) {
        data!.add(FData1.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class FData1 {
  String? id;
  String? type;
  Attributes? attributes;
  Relationships? relationships;

  FData1({this.id, this.type, this.attributes, this.relationships});

  FData1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? description;
  Life? life;
  Life? maleWeight;
  Life? femaleWeight;
  bool? hypoallergenic;

  Attributes(
      {this.name,
      this.description,
      this.life,
      this.maleWeight,
      this.femaleWeight,
      this.hypoallergenic});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    life = json['life'] != null ? Life.fromJson(json['life']) : null;
    maleWeight =
        json['male_weight'] != null ? Life.fromJson(json['male_weight']) : null;
    femaleWeight = json['female_weight'] != null
        ? Life.fromJson(json['female_weight'])
        : null;
    hypoallergenic = json['hypoallergenic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (life != null) {
      data['life'] = life!.toJson();
    }
    if (maleWeight != null) {
      data['male_weight'] = maleWeight!.toJson();
    }
    if (femaleWeight != null) {
      data['female_weight'] = femaleWeight!.toJson();
    }
    data['hypoallergenic'] = hypoallergenic;
    return data;
  }
}

class Life {
  int? max;
  int? min;

  Life({this.max, this.min});

  Life.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['min'] = min;
    return data;
  }
}

class Relationships {
  Group? group;

  Relationships({this.group});

  Relationships.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    return data;
  }
}

class Group {
  FData1? data;

  Group({this.data});

  Group.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? FData1.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BreedsData {
  String? id;
  String? type;

  BreedsData({this.id, this.type});

  BreedsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class Links {
  String? self;
  String? current;
  String? next;
  String? last;

  Links({this.self, this.current, this.next, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    current = json['current'];
    next = json['next'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['current'] = current;
    data['next'] = next;
    data['last'] = last;
    return data;
  }
}
