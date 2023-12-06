part 'dghub_language_model.g.dart';

class DGHubLanguageModel {
  String id;
  String name;
  String code;
  Map<String, String>? data;

  DGHubLanguageModel({
    required this.id,
    required this.name,
    required this.code,
    this.data,
  });
  factory DGHubLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$DGHubLanguageModelFromJson(json);
  Map<String, dynamic> toJson() => _$DGHubLanguageModelToJson(this);
}
