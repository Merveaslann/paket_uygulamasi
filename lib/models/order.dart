class Order {
  final String title;
  final String owner;
  final String? owner_readable;
  final date;
  final String from;
  final String to;
  final int weight;
  final String description;

  Order(this.title, this.owner, this.owner_readable, this.date, this.from, this.to, this.weight, this.description);

  Order.fromMap(Map<String, dynamic> map) : this (
    map["title"], map["owner"], map["owner_readable"], map["date"], map["from"], map["to"], map["weight"], map["description"]
  );

  Map<String, dynamic> toMap(){
    return {
      "title": title,
      "owner": owner,
      "owner_readable": owner_readable,
      "date": date,
      "from": from,
      "to": to,
      "weight": weight,
      "description": description
    };
  }
}

