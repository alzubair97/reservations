class ListModel {
  String? value;
  String? text;
  bool isSelect=false;

  ListModel({this.value,this.text,required this.isSelect});

  ListModel.fromJson(Map<String, dynamic> json) {
    value = json['value']??json['id'];
    text = json['text']??json['name'];
    isSelect=json['isSelect']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['text'] = text;
    data['isSelect'] = isSelect;
    return data;
  }
}