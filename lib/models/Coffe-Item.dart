class CoffeeItem{
  String? rate;
  String? Image;
  String? title;
  String? subtitle;
  double? price;

  CoffeeItem({this.rate, this.Image, this.title, this.subtitle, this.price});

  CoffeeItem.fromJson(Map<String, dynamic> json){
    rate = json['rate'];
    Image = json['Image'];
    title = json['title'];
    subtitle = json['subtitle'];
    price = json['price'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['rate'] = this.rate;
    data['Image'] = this.Image;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['price'] = this.price;

    return data;

  }
}