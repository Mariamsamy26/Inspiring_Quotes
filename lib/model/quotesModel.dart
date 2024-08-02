
class QuotesModel {
  QuotesModel({
      this.count, 
      this.totalCount, 
      this.page, 
      this.totalPages, 
      this.lastItemIndex, 
      this.results,});

  QuotesModel.fromJson(dynamic json) {
    count = json['count'];
    totalCount = json['totalCount'];
    page = json['page'];
    totalPages = json['totalPages'];
    lastItemIndex = json['lastItemIndex'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  int? count;
  int? totalCount;
  int? page;
  int? totalPages;
  int? lastItemIndex;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['totalCount'] = totalCount;
    map['page'] = page;
    map['totalPages'] = totalPages;
    map['lastItemIndex'] = lastItemIndex;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "bfNpGC2NI"
/// author : "Thomas Edison"
/// content : "As a cure for worrying, work is better than whisky."
/// tags : ["Humorous"]
/// authorSlug : "thomas-edison"
/// length : 51
/// dateAdded : "2023-04-14"
/// dateModified : "2023-04-14"

class Results {
  Results({
      this.id, 
      this.author, 
      this.content, 
      this.tags, 
      this.authorSlug, 
      this.length, 
      this.dateAdded, 
      this.dateModified,});

  Results.fromJson(dynamic json) {
    id = json['_id'];
    author = json['author'];
    content = json['content'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    authorSlug = json['authorSlug'];
    length = json['length'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }
  String? id;
  String? author;
  String? content;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['author'] = author;
    map['content'] = content;
    map['tags'] = tags;
    map['authorSlug'] = authorSlug;
    map['length'] = length;
    map['dateAdded'] = dateAdded;
    map['dateModified'] = dateModified;
    return map;
  }

}