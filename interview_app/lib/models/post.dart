class Post {
  String? employerId;
  String? positionId;
  String? positionName;
  String? date;
  String? location;
  String? address;
  String? qualification;
  String? salary;
  String? noOfPositions;
  String? fileName;
  String? registeredTime;
  String? latestUpdatedTime;
  String? companyName;

  Post(
      {this.employerId,
   this.positionId,
   this.positionName,
   this.date,
   this.location,
   this.address,
   this.qualification,
   this.salary,
   this.noOfPositions,
   this.fileName,
   this.registeredTime,
   this.latestUpdatedTime,
   this.companyName});

  factory Post.fromJson(Map<String?, dynamic> json) {
    return Post(
    
   positionName: json['Positionname'],
   date: json['Date'],
   location: json['Location'],
   address: json['Address'],
   qualification: json['Qualification'],
   salary: json['Salary'].toString(),
   noOfPositions: json['Noofpositions'].toString(),
   fileName: json['filename'],
   registeredTime: json['registeredtime'].toString().substring(0, 10),
   latestUpdatedTime: json['latestupdatedtime'].toString(),
   companyName: json['companyname'],
   employerId: json['Employerid'].toString(),
   positionId: json['Positionid'].toString());
  }
}
