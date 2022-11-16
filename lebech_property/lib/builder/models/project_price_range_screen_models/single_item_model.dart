class SingleItemModel {
  String type;
  String price;
  String area;
  bool active;

  SingleItemModel({
    required this.type,
    required this.price,
    required this.area,
    required this.active,
  });

  Map<String, dynamic> toJson() => {
    "type": type,
    "price": price,
    "area": area,
    "active": active,
  };

  Map<String, Map<String, dynamic>> toJsonMain(int i) => {
    "$i" : {
      "type": type,
      "price": price,
      "area": area,
      "active": active,
    }
  };

}
