class Candidate {
  String? candidateId;
  String? firstname;
  String? lastName;
  String? age;
  String? gender;
  String? emailId;
  String? mobilenumber;
  String? password;
  String? city;
  String? schName;
  String? schCity;
  String? schPassedYear;
  String? schMarks;
  String? ugName;
  String? ugCity;
  String? ugSpecialization;
  String? ugPassedYear;
  String? ugMarks;
  String? pgName;
  String? pgCity;
  String? pgSpecialization;
  String? pgPassedYear;
  String? pgMarks;
  String? registeredTime;
  String? latestUpdatedTime;
  String? companyName;

  Candidate(
      {this.candidateId,
  this.firstname,
  this.lastName,
  this.age,
  this.gender,
  this.emailId,
  this.mobilenumber,
  this.password,
  this.city,
  this.schName,
  this.schCity,
  this.schPassedYear,
  this.schMarks,
  this.ugName,
  this.ugCity,
  this.ugSpecialization,
  this.ugPassedYear,
  this.ugMarks,
  this.pgName,
  this.pgCity,
  this.pgSpecialization,
  this.pgPassedYear,
  this.pgMarks,
  this.latestUpdatedTime,});

  factory Candidate.fromJson(Map<String?, dynamic> json) {
    return Candidate(
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
