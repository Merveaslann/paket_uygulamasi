class Order {
  final String title;
  final String owner;
  final date;
  final String from;
  final String to;
  final String size;
  final double weight;
  final String description;

  Order(this.title, this.owner, this.date, this.from, this.to, this.size, this.weight, this.description);

  Order.fromMap(Map<String, dynamic> map) : this (
    map["title"], map["owner"], map["date"], map["from"], map["to"], map["size"], map["weight"], map["description"]
  );

  Map<String, dynamic> toMap(){
    return {
      "title": title,
      "owner": owner,
      "date": date,
      "from": from,
      "to": to,
      "size": size,
      "weight": weight,
      "description": description
    };
  }
}

