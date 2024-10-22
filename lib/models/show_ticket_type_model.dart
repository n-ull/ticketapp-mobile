class ShowTicketType {
  final int id;
  final String title;
  final int price;
  final int stock;

  ShowTicketType(
      {required this.id,
      required this.title,
      required this.price,
      required this.stock});

  factory ShowTicketType.fromJson(Map<String, dynamic> json) {
    return ShowTicketType(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      stock: json['stock'],
    );
  }
}
