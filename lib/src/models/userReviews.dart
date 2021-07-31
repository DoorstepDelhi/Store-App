class UserReviews {
  int user;
  UserDetail userDetail;
  int product;
  int rating;
  String review;
  List<String> files;
  String createdAt;

  UserReviews(
      {this.user,
      this.userDetail,
      this.product,
      this.rating,
      this.review,
      this.files,
      this.createdAt});

  UserReviews.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    userDetail = json['user_detail'] != null
        ? new UserDetail.fromJson(json['user_detail'])
        : null;
    product = json['product'];
    rating = json['rating'];
    review = json['review'];
    files = json['files'].cast<String>();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    if (this.userDetail != null) {
      data['user_detail'] = this.userDetail.toJson();
    }
    data['product'] = this.product;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['files'] = this.files;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class UserDetail {
  int id;
  String firstName;
  String lastName;
  String profilePic;

  UserDetail({this.id, this.firstName, this.lastName, this.profilePic});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}
