class TrucksModel{
  int? id;
  String? truckName;
  String? gov;
  int? frequency;
  int? monetary;
  num? score;
  num recency;

  TrucksModel({
    this.truckName,
    this.id,
    this.gov,
    this.frequency,
    this.monetary,
    this.score,
    required this.recency
  });
}