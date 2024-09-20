class Horoscope {
  String? date;
  String? horoscope;

  Horoscope({this.date, this.horoscope});

  Horoscope.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    horoscope = json['horoscope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['horoscope'] = this.horoscope;
    return data;
  }
}