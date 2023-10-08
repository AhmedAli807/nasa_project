class InfoFactory{
  String ?name;
  String?phone;

  InfoFactory({
    this.name,
    this.phone,
  });
  InfoFactory.fromJson(Map<String,dynamic>json){
    name=json['name'];
    phone=json['phone'];
  }
  Map<String,dynamic>toJson(data){
    data['name']=name;
    data['phone']=phone;
    return data;
  }
}