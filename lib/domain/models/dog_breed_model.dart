// To parse this JSON data, do
//
//     final dogBreed = dogBreedFromJson(jsonString);

import 'dart:convert';

List<DogBreed> dogBreedFromJson(String str) => List<DogBreed>.from(json.decode(str).map((x) => DogBreed.fromJson(x)));

String dogBreedToJson(List<DogBreed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DogBreed {
    final Eight weight;
    final Eight height;
    final int id;
    final String name;
    final String? bredFor;
    final String? breedGroup;
    final String lifeSpan;
    final String? temperament;
    final String? origin;
    final String referenceImageId;
    final String? countryCode;
    final String? description;
    final String? history;

    DogBreed({
        required this.weight,
        required this.height,
        required this.id,
        required this.name,
        this.bredFor,
        this.breedGroup,
        required this.lifeSpan,
        this.temperament,
        this.origin,
        required this.referenceImageId,
        this.countryCode,
        this.description,
        this.history,
    });

    DogBreed copyWith({
        Eight? weight,
        Eight? height,
        int? id,
        String? name,
        String? bredFor,
        String? breedGroup,
        String? lifeSpan,
        String? temperament,
        String? origin,
        String? referenceImageId,
        String? countryCode,
        String? description,
        String? history,
    }) => 
        DogBreed(
            weight: weight ?? this.weight,
            height: height ?? this.height,
            id: id ?? this.id,
            name: name ?? this.name,
            bredFor: bredFor ?? this.bredFor,
            breedGroup: breedGroup ?? this.breedGroup,
            lifeSpan: lifeSpan ?? this.lifeSpan,
            temperament: temperament ?? this.temperament,
            origin: origin ?? this.origin,
            referenceImageId: referenceImageId ?? this.referenceImageId,
            countryCode: countryCode ?? this.countryCode,
            description: description ?? this.description,
            history: history ?? this.history,
        );

    factory DogBreed.fromJson(Map<String, dynamic> json) => DogBreed(
        weight: Eight.fromJson(json["weight"]),
        height: Eight.fromJson(json["height"]),
        id: json["id"],
        name: json["name"],
        bredFor: json["bred_for"],
        breedGroup: json["breed_group"],
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        origin: json["origin"],
        referenceImageId: json["reference_image_id"],
        countryCode: json["country_code"],
        description: json["description"],
        history: json["history"],
    );

    Map<String, dynamic> toJson() => {
        "weight": weight.toJson(),
        "height": height.toJson(),
        "id": id,
        "name": name,
        "bred_for": bredFor,
        "breed_group": breedGroup,
        "life_span": lifeSpan,
        "temperament": temperament,
        "origin": origin,
        "reference_image_id": referenceImageId,
        "country_code": countryCode,
        "description": description,
        "history": history,
    };
}

class Eight {
    final String imperial;
    final String metric;

    Eight({
        required this.imperial,
        required this.metric,
    });

    Eight copyWith({
        String? imperial,
        String? metric,
    }) => 
        Eight(
            imperial: imperial ?? this.imperial,
            metric: metric ?? this.metric,
        );

    factory Eight.fromJson(Map<String, dynamic> json) => Eight(
        imperial: json["imperial"],
        metric: json["metric"],
    );

    Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
