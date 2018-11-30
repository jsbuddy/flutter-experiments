class Course {
//  int id;
  String title;
  DateTime lastStudied;
  List<Question> questions;
  Course(this.title, this.lastStudied);
}

class Question {
  String q;
  String a;
  Question(this.a, this.q);
}

final courses = [
  Course('Introduction to computer science', DateTime.now()),
  Course('Internet Programming', DateTime.now()),
  Course('Computer modelling and simulation', DateTime.now()),
];