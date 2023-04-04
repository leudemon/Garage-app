class Orders {
  String order;
  List <String> ordersList =['pie', 'pizza', 'pop corn', 'apple pie', 'peenutss'];

  Orders({required this.order});
  addOrder(order){
    ordersList.add(order);
  }
  removeOrder(order){
    ordersList.remove(order);
  }
}
