import 'dart:async';

class Dish {
  String type;
  Dish(this.type);
  String toString() {
    return "$type";
  }
}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final con = new StreamController();
  final order = new Order("Omlet");
  final chef = new StreamTransformer.fromHandlers(
    handleData: (dishType, sink) {
      if(dishType == "Omlet") {
        sink.add(new Dish(dishType));
      } else {
        sink.addError("Unsupported Type");
      }
    }
  );
  con.sink.add(order);
  con.stream
    .map((order) => order.type)
    .transform(chef)
    .listen(
    (dish) => print("You dish is $dish"),
    onError: (error) => print(error)
  );
}
