class NoteModel{

  int? _id;
  int?_priority;
  String? _title;
  String ?_des;
  String? _date;

  NoteModel.withId(this._id,this._date,this._priority,this._title,[this._des]);
  NoteModel(this._date,this._priority,this._title,[this._des]);

  int? get id=>_id;
  int? get priority=>_priority;
  String? get title=>_title;
  String? get des=>_des;
  String? get date=>_date;

  set title(String? newTitle){
    if(newTitle!.length<=255){
      this._title=newTitle;
    }
  }
  set des(String? newDes){
    if(newDes!.length<=255){
      this._title=newDes;
    }
  }
  set date(String? newDate){
      this._title=newDate;
  }
  set priority(int? newPriority){
    if(newPriority!>=1 && newPriority<=2){
      this._priority=newPriority;
    }
  }

  //convert note object to map object
Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    if(id!=null){
      map["id"]=_id;
    }
    map["title"]=_title;
    map["des"]=_des;
    map["priority"]=_priority;
    map["date"]=_date;
    return map;
}

// extract map object to note object
  NoteModel.fromMapObject(Map<String,dynamic> map){
    this._id=map["id"];
    this._title=map["title"];
    this._des=map["des"];
    this._date=map["date"];
  }



}