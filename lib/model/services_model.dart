class ServicesResponseModel {
  int id;
  String name;
  String providerName;
  int subscription;
  String image;
  int capacity;
  double fixed;
  double price;
  double minute;
  Null hour;
  int distance;
  String calculator;
  Null description;
  int status;

  ServicesResponseModel(
      {this.id,
        this.name,
        this.providerName,
        this.subscription,
        this.image,
        this.capacity,
        this.fixed,
        this.price,
        this.minute,
        this.hour,
        this.distance,
        this.calculator,
        this.description,
        this.status});

  ServicesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    providerName = json['provider_name'];
    subscription = json['subscription'];
    image = json['image'];
    capacity = json['capacity'];
    fixed = json['fixed'];
    price = json['price'];
    minute = json['minute'];
    hour = json['hour'];
    distance = json['distance'];
    calculator = json['calculator'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['provider_name'] = this.providerName;
    data['subscription'] = this.subscription;
    data['image'] = this.image;
    data['capacity'] = this.capacity;
    data['fixed'] = this.fixed;
    data['price'] = this.price;
    data['minute'] = this.minute;
    data['hour'] = this.hour;
    data['distance'] = this.distance;
    data['calculator'] = this.calculator;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}


