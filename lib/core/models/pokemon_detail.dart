class PokemonDetail {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;

  PokemonDetail(
      {this.id,
        this.num,
        this.name,
        this.img,
        this.type,
        });

  PokemonDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;

    return data;
  }
}