import 'dart:math';

class Post {
  final int id;
  final User author;
  final String subject;
  final String body;
  final String image;
  final Categories category;
  final List<Comment> comments;

  Post(this.id, this.author, this.subject, this.body, this.image, this.category,
      this.comments);
}

class Comment {
  final User author;
  final String body;

  Comment({this.author, this.body});
}

class User {
  final int id;
  final String name;
  final String image;

  User({this.id, this.name, this.image});
}

final rand = Random();

final users = [
  User(
      id: 1, name: 'Emy Rich', image: 'assets/images/talknaija/profile-1.jpeg'),
  User(
      id: 2, name: 'Ego Mike', image: 'assets/images/talknaija/profile-2.jpeg'),
  User(
      id: 3,
      name: 'Ebuka Ebodel',
      image: 'assets/images/talknaija/profile-3.jpeg'),
  User(
      id: 4,
      name: 'Ekweme Chika',
      image: 'assets/images/talknaija/profile-4.jpeg'),
  User(
      id: 5,
      name: 'Adigun Tolani',
      image: 'assets/images/talknaija/profile-5.jpeg'),
  User(
      id: 6,
      name: 'Sule Aidoko',
      image: 'assets/images/talknaija/profile-6.jpeg'),
  User(
      id: 7,
      name: 'Ogonna Nwadike',
      image: 'assets/images/talknaija/profile-7.jpeg'),
  User(
      id: 8,
      name: 'Anslem Nwadike',
      image: 'assets/images/talknaija/profile-8.jpeg'),
  User(
      id: 9,
      name: 'Joseph Gana',
      image: 'assets/images/talknaija/profile-9.jpg'),
  User(
      id: 10,
      name: 'Shola Bankole',
      image: 'assets/images/talknaija/profile-10.jpg'),
  User(
      id: 11,
      name: 'Gideon Fidelis',
      image: 'assets/images/talknaija/profile-11.jpg'),
  User(
      id: 12,
      name: 'Emmanuel Yakubu',
      image: 'assets/images/talknaija/profile-12.jpg'),
  User(
      id: 13,
      name: 'Peace Yohanna',
      image: 'assets/images/talknaija/profile-13.jpg'),
  User(
      id: 14,
      name: 'Adigun Shola',
      image: 'assets/images/talknaija/profile-14.jpg'),
  User(
      id: 15,
      name: 'Abdulraham',
      image: 'assets/images/talknaija/profile-15.jpg'),
  User(
      id: 16,
      name: 'Clement Steven',
      image: 'assets/images/talknaija/profile-16.jpg'),
  User(
      id: 17,
      name: 'Emmanuel Ojawa',
      image: 'assets/images/talknaija/profile-17.jpg'),
  User(
      id: 18,
      name: 'Clement Oji',
      image: 'assets/images/talknaija/profile-18.jpg'),
  User(
      id: 19,
      name: 'Amanda Chuka',
      image: 'assets/images/talknaija/profile-19.jpg'),
  User(
      id: 20,
      name: 'Steven Ogbu',
      image: 'assets/images/talknaija/profile-20.jpg'),
  User(
      id: 21,
      name: 'Hope Okpachu',
      image: 'assets/images/talknaija/profile-21.jpg'),
  User(
      id: 22,
      name: 'Emmanuella Aidoko',
      image: 'assets/images/talknaija/profile-22.jpg'),
  User(
      id: 23,
      name: 'Samuel Enalegu',
      image: 'assets/images/talknaija/profile-23.jpg'),
  User(
      id: 24,
      name: 'Vivian Alfred',
      image: 'assets/images/talknaija/profile-24.jpg'),
  User(
      id: 25,
      name: 'Alade Ayomide',
      image: 'assets/images/talknaija/profile-25.jpg'),
];

enum Categories {
  security,
  immigration,
  education,
  transportation,
  electricity,
  unemployment,
  sports,
  construction,
  politics,
  entertainment,
  diaspora
}

final posts = [
  Post(
    1,
    users[rand.nextInt(users.length)],
    'Killing in South Africa',
    'What is d federal government doin abt d kilin of nigerianz in south Africa.we dnt feel safe anymre,the attack on us is getting worse by d day',
    'assets/images/talknaija/killing2.jpg',
    Categories.diaspora,
    <Comment>[
      Comment(
          author: users[rand.nextInt(users.length)],
          body:
              'Just last week a friend of mine was brutally assaulted for no reason on the street of Johannesburg.'),
      Comment(
          author: users[rand.nextInt(users.length)],
          body:
              'Your frnd was lucky fr nt been killed.i knw a family frnd of mine in south Africa who was shot to death on his way to work'),
    ],
  ),
  Post(
      2,
      users[rand.nextInt(users.length)],
      'Killing',
      'Just last week a friend of mine was brutally assaulted for no reason on the street of Johannesburg.',
      'assets/images/talknaija/killing2.jpg',
      Categories.diaspora, <Comment>[]),
  Post(
      3,
      users[rand.nextInt(users.length)],
      'America Deporting Nigerians',
      'Nigerians in America are being deported illegaly. Pls let the government fight for us',
      'assets/images/talknaija/work.jpg',
      Categories.immigration, <Comment>[]),
  Post(
      4,
      users[rand.nextInt(users.length)],
      'Nigerian / Benin Republic Crisis',
      'Am a student in Benin republic. The way the people of this country treat us is bad and d police collect moni from us fr no reason.pls do sumtin',
      'assets/images/talknaija/security-2.jpg',
      Categories.education, <Comment>[
    Comment(
        author: users[rand.nextInt(users.length)],
        body:
            'Thank you. The Nigerian embassy in Cotonou is doing nothing abt it.I school in Benin republic too'),
  ]),
  Post(
      5,
      users[rand.nextInt(users.length)],
      'Unsafe Roads',
      'The kaduna-Abuja express Road is no longer safe fr travellers.it has become a Site for kidnapping n killings',
      'assets/images/talknaija/road2.jpg',
      Categories.transportation, <Comment>[
    Comment(
        author: users[rand.nextInt(users.length)],
        body:
            'Last week abt 7 piple were killed and 5 abducted by gun men till date nothing has been heared of them')
  ]),

  Post(
      6,
      users[rand.nextInt(users.length)],
      'Unmaintained Road',
      'The road linking Abuja and lokoja is terrible no maintenance work has been done on it Many lives have been lost.',
      'assets/images/talknaija/transportation-1.jpg',
      Categories.transportation, <Comment>[]),
  Post(
      24,
      users[rand.nextInt(users.length)],
      'More Roads',
      'There is no road leading to ugele local community in Delta state',
      'assets/images/talknaija/transportation-2.jpg',
      Categories.transportation, <Comment>[]),
  Post(
      7,
      users[rand.nextInt(users.length)],
      'Fulani Killing Nigerians',
      'The Fulani herdsmen killing innocent Nigerians.what is the Government doing abt it?',
      'assets/images/talknaija/killing.jpg',
      Categories.security, <Comment>[
    Comment(
        author: users[rand.nextInt(users.length)],
        body:
            "I don't think those are fulani herdsmen at all,this piple migrated from Mali,chad n Niger into Nigeria, the government should do more in protecting the Maiduguri border")
  ]),

  Post(
      22,
      users[rand.nextInt(users.length)],
      'Robbery',
      'I live in Nyanya Marraba in Abuja and we are robbed almost every week.',
      'assets/images/talknaija/security-1.jpg',
      Categories.security, <Comment>[]),
  Post(
      23,
      users[rand.nextInt(users.length)],
      'Robbery & Kidnapping',
      'In Odiako LGA in Rivers state,there is no police outpost and this has led to a lot of robberies and kidnaps',
      'assets/images/talknaija/security-2.jpg',
      Categories.security, <Comment>[]),

  Post(
      8,
      users[rand.nextInt(users.length)],
      'Electricity Issues',
      'The electricity in Nigeria is appaling.especially in Bwari Area cOuncil Abuja.some parts of Bwari haven\'t seen light in ova 2 months.',
      'assets/images/talknaija/electricity.jpg',
      Categories.electricity, <Comment>[
    Comment(
      author: users[rand.nextInt(users.length)],
      body:
          'Some parts of Apapa Marine beach havent seen light in more than 3 months',
    )
  ]),

// ---->
  Post(
      9,
      users[rand.nextInt(users.length)],
      'No Light in Bwari',
      'We have not seen light in bwari Area council Abuja for over a week yet we are forced to pay bills for it.',
      'assets/images/talknaija/electricity2.jpg',
      Categories.electricity, <Comment>[]),
  Post(
      15,
      users[rand.nextInt(users.length)],
      'Total Blackout in Gimga',
      'For over a month now Gimga local government in Jos have not seen light.Total black out',
      'assets/images/talknaija/electricity3.jpg',
      Categories.electricity, <Comment>[]),
// <----

  Post(
      10,
      users[rand.nextInt(users.length)],
      'No light for football match',
      'Whenever their is football match we don\'t see light.Why?',
      'assets/images/talknaija/electricity4.jpg',
      Categories.electricity, <Comment>[
    Comment(
        author: users[rand.nextInt(users.length)],
        body:
            'I think d NEPA piple re benefiting from it.they pay them to take d Light'),
  ]),
  Post(
      11,
      users[rand.nextInt(users.length)],
      'Custom and Immigration Officers are thieves',
      'The custom and immigration officers in seme badagary are thieves, all they do is extort Nigerians',
      'assets/images/talknaija/electricity5.jpg',
      Categories.immigration, <Comment>[
    Comment(
        author: users[rand.nextInt(users.length)],
        body:
            'They ask you fr your passport in your own country,they then ask you to pay money'),
    Comment(
        author: users[rand.nextInt(users.length)],
        body: 'There are no proper check made on people crossing the border.'),
    Comment(
        author: users[rand.nextInt(users.length)],
        body: 'In fact you can pass with anything from Cotonou to Nigeria')
  ]),
  Post(
      12,
      users[rand.nextInt(users.length)],
      'We are Jobless',
      'After graduating no work,you sit at home till you get tired in Nigeria.You are on your own in Nigeria',
      'assets/images/talknaija/unemployment.jpg',
      Categories.unemployment, <Comment>[
    Comment(
        author: users[rand.nextInt(users.length)],
        body: 'I graduated 3years ago,still looking for work.& you say piple shldnt cross to Italy from Libya')
  ]),
  Post(
      14,
      users[rand.nextInt(users.length)],
      'No Job',
      'Every Year we see more and more graduates with no job opportunities waiting for them.what is government doing? Do we even have a government in Nigeria?',
      'assets/images/talknaija/no-vacancy.jpg',
      Categories.unemployment, <Comment>[
    Comment(
        author: users[rand.nextInt(users.length)],
        body:
            'No federal Government work,nothing at all..government work in Nigeria you have to pay to get one')
  ]),
  Post(
      16,
      users[rand.nextInt(users.length)],
      'We need more Sport',
      'Football is the only popular sport in Nigeria 🇳🇬.Almost every kid want to be a footballer because that\'s all they know.But there are so many sports out there dieng for recognition in Nigeria as well-Cycling,Hockey,Volleyball,athletics,boxing etc The Government can help spread the games by hosting this events in the country.',
      'assets/images/talknaija/sport.jpg',
      Categories.sports, <Comment>[]),
  Post(
      17,
      users[rand.nextInt(users.length)],
      'We need sport facilities in schools',
      'The federal government need to support more grass root activities.Government schools in Nigeria lack basic sporting facilities so this kids have no means of learning other sports.Catch them young',
      'assets/images/talknaija/sport.jpg',
      Categories.sports, <Comment>[]),
  Post(
      18,
      users[rand.nextInt(users.length)],
      'More work in the sports sector',
      'I believe more needs to be done in our sports sector.more young Nigerians are running out of the country to seek opportunities.we need to treat other sports in Nigeria with the same Love & respect we treat football',
      'assets/images/talknaija/sport2.jpg',
      Categories.sports, <Comment>[]),
  Post(
      19,
      users[rand.nextInt(users.length)],
      'More work in the sports sector',
      'The federal government need to support more grass root activities.Government schools in Nigeria lack basic sporting facilities so this kids have no means of learning other sports.Catch them young',
      'assets/images/talknaija/sport2.jpg',
      Categories.sports, <Comment>[
    Comment(
      author: users[rand.nextInt(users.length)],
      body:
          'The raw talents in Nigeria can be found in grass roots but unfortunately the politics in NFL won\'t let them scout for talents.',
    ),
    Comment(
      author: users[rand.nextInt(users.length)],
      body:
          'I remember growing up talents were seen & discovered at an early age from school sports & activities but today it\'s a different story we don\'t have such games.we have completely lost it',
    )
  ]),

  Post(
      20,
      users[rand.nextInt(users.length)],
      'Sport in rural communities',
      'We need more work on our grass roots sports talents are wasting in rural communities,no activities or competitions for them to be discovered.',
      'assets/images/talknaija/sports-1.jpg',
      Categories.sports, <Comment>[]),
  Post(
      21,
      users[rand.nextInt(users.length)],
      'Lack of sport facilities',
      'Public schools today in Nigeria lack sport facilities,I wonder how sport will grow in this country.',
      'assets/images/talknaija/sports-2.jpg',
      Categories.sports, <Comment>[]),
];

class PostModel {
  static getPosts(category) {
    return posts.where((test) {
      return test.category == category;
    }).toList();
  }

  static addPost(Post post) {
    posts.add(post);
  }
}
