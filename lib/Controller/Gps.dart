class GpsModel {
  double Lat;
  double Long;
  String region;
  String name;
  String id;

  GpsModel(
      {required this.Lat,
      required this.id,
      required this.Long,
      required this.region,
      required this.name});
}

List<GpsModel> Gps = [
  GpsModel(
      id: "1",
      Lat: 30.087026790087624,
      Long: 31.298811589094075,
      region: "Cairo",
      name: "محطة بنزين التعاون"),
  GpsModel(
      id: "3",
      Lat: 30.06995931944675,
      Long: 31.3000354777219,
      region: "Cairo",
      name: "محطة بنزين وطنية"),
  GpsModel(
      id: "2",
      Lat: 27.44092824682802,
      Long: 31.121046327628992,
      region: "Asyout",
      name: "محطة بنزين موبيل"),
  GpsModel(
      id: "4",
      Lat: 30.016987183363646,
      Long: 31.250374433912878,
      region: "Cairo",
      name: "محطة موبيل قاهره"),
  GpsModel(
      id: "5",
      Lat: 31.215834018490938,
      Long: 29.94455695386451,
      region: "Alex",
      name: "محطة بنزين موبيل - سموحة اسكندريه"),
  GpsModel(
      id: "6",
      Lat: 31.091688924343547,
      Long: 31.389545839869484,
      region: "Mansoura",
      name: "Gas Station"),
  GpsModel(
      id: "7",
      Lat: 29.993754942080653,
      Long: 31.21501207496507,
      region: "Giza",
      name: "بنزينه مصر للبترول جيزه"),
  GpsModel(
      id: "8",
      Lat: 30.015978986791048,
      Long: 31.209518911276305,
      region: "Giza",
      name: "بنزينة مصر جيزه"),
  GpsModel(
      id: "9",

      Lat:31.03445007837461,
      Long:  31.381700505817058,
      region: "Mansoura",
      name: "بنزينة موبيل"),
  GpsModel(
      id: "10",
      Lat: 25.70574688683783,
      Long: 32.64935437909002,
      region: "Luxor",
      name: "التعاون للبترول الاقصر"),
  GpsModel(
      id: "11",
      Lat: 31.199457757384987,
      Long: 29.91422902248057,
      region: "Alex",
      name: "بنزينة مصر للبترول - اسكندريه"),

  GpsModel(
      id: "12",
      Lat: 29.332072887271615,
      Long: 30.833488480691738,
      region: "Fayoum",
      name: "محطة وقود غازتك"),
];