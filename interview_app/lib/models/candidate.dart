class Candidate {
  String? candidateId;
  String? firstName;
  String? lastName;
  String? age;
  String? gender;
  String? emailId;
  String? mobileNumber;
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

  Candidate({
    this.candidateId,
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.emailId,
    this.mobileNumber,
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
    this.registeredTime,
    this.latestUpdatedTime,
  });

  factory Candidate.fromJson(Map<String?, dynamic> json) {
    return Candidate(
        candidateId: json['candidateid'].toString(),
        firstName: json['firstname'].toString(),
        lastName: json['lastname'].toString(),
        age: json['age'].toString().toString(),
        gender: json['gender'].toString(),
        emailId: json['emailid'].toString(),
        mobileNumber: json['mobilenumber'].toString().toString(),
        password: json['password'].toString().toString(),
        city: json['city'].toString(),
        schName: json['schname'].toString(),
        schCity: json['schcity'].toString(),
        schPassedYear: json['schpassedyear'].toString(),
        schMarks: json['schmarks'].toString(),
        ugName: json['ugname'].toString(),
        ugCity: json['ugcity'].toString(),
        ugSpecialization: json['ugspecialization'].toString(),
        ugPassedYear: json['ugpassedyear'].toString(),
        ugMarks: json['ugmarks'].toString(),
        pgName: json['pgname'].toString(),
        pgCity: json['pgcity'].toString(),
        pgSpecialization: json['pgspecialization'].toString(),
        pgPassedYear: json['pgpassedyear'].toString(),
        pgMarks: json['pgmarks'].toString(),
        registeredTime: json['registeredtime'].toString().substring(0 , 10),
        latestUpdatedTime: json['latestupdatedtime'].toString(),);
  }
}
