class FuelModel {
  final List<Data> data;

  FuelModel({required this.data});

  factory FuelModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();

    return FuelModel(data: dataList);
  }
}

class Data {
  final String id;
  final String type;
  final Attributes attributes;

  Data({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    var attrJson = Attributes.fromJson(parsedJson['attributes']);

    return Data(
      id: parsedJson['id'],
      type: parsedJson['type'],
      attributes: attrJson,
    );
  }
}

class Attributes {
  final int odometer;
  final String entryDate;
  final String? quantity;
  final String price;
  final String totalPrice;

  Attributes({
    required this.odometer,
    required this.entryDate,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  factory Attributes.fromJson(Map<String, dynamic> parsedJson) {
    return Attributes(
      odometer: parsedJson['odometer'],
      entryDate: parsedJson['entryDate'],
      price: parsedJson['price'],
      quantity: parsedJson['quantity'],
      totalPrice: parsedJson['totalPrice'],
    );
  }
}
