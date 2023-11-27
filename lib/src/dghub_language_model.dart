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
}
