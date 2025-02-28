class PostModel{
  int? userId ;
  int? id;
  String? title;
  String? body;

  PostModel(this.userId,this.id,this.title,this.body);

  PostModel.fromJson(Map<String,dynamic> json){
    id = json["id"];
    userId = json["userId"];
    title = json["title"];
    body = json["body"];
  }

}