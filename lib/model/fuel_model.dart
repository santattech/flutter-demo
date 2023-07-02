class FuelModel {
  final int? code;
  final String status;
  final String? message;
  final List<Data> data;

  FuelModel(
      {this.code, required this.status, this.message, required this.data});

  factory FuelModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();

    return FuelModel(
        code: parsedJson['code'],
        status: parsedJson['status'],
        message: parsedJson['message'],
        data: dataList);
  }
}

class Data {
  final int id;
  final int? odometerValue;
  final String? fillingDate;
  final double cost;
  final double quantity;

  Data({
    required this.id,
    this.odometerValue,
    this.fillingDate,
    required this.cost,
    required this.quantity,
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      id: parsedJson['id'],
      odometerValue: parsedJson['odometerValue'],
      fillingDate: parsedJson['fillingDate'],
      cost: parsedJson['cost'],
      quantity: parsedJson['quantity'],
    );
  }
}
