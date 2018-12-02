class Course {
  int id;
  String title;
  DateTime lastStudied;
  List<Quiz> quizzes;
  Course(this.id, this.title, this.lastStudied);
}

class Quiz {
  int id;
  String q;
  String a;
//  int courseId;
  Quiz(this.id, this.a, this.q);
}

void check(){
  print('s');
}

final courses = [
  Course(1, 'Introduction to computer science', DateTime.now()),
  Course(2, 'Internet Programming', DateTime.now()),
  Course(3, 'Computer modelling and simulation', DateTime.now()),
];

final quizzes = [
  Quiz(1, 'Who is Ali', 'Ali is a Boy'),
  Quiz(2, 'Who is Simbi', 'Simbi is a Girl'),
  Quiz(3, 'Who is Paul', 'Paul is a Boy'),
];