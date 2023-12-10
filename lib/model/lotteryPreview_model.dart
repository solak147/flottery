import 'dart:convert';

class LotteryPreivewModel {
  String name;
  String imageUrl;
  String imageHeight;
  String imageWidth;

  LotteryPreivewModel({
    required this.name,
    required this.imageUrl,
    required this.imageHeight,
    required this.imageWidth,
  });

  factory LotteryPreivewModel.fromJson(Map<String, dynamic> json) =>
      LotteryPreivewModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
        imageHeight: json["imageHeight"],
        imageWidth: json["imageWidth"],
      );

  static List<LotteryPreivewModel> previewModelFromJson(List lst) =>
      List<LotteryPreivewModel>.from(
          lst.map((x) => LotteryPreivewModel.fromJson(x)));
}
