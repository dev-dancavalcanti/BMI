class PersonModel {
  late List<Person> person;
  PersonModel({required this.person});

  PersonModel.fromJson(Map<String, dynamic> json) {
    if (json['person'] != null) {
      person = <Person>[];
      json['person'].forEach((v) {
        person.add(Person.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['person'] = person.map((v) => v.toJson()).toList();
    return data;
  }
}

class Person {
  final String? body;
  final String? bmi;
  final String name;
  final double altura;
  final int peso;
  final int? idade;
  final bool? genero;

  Person({
    this.body,
    this.bmi,
    required this.name,
    required this.altura,
    required this.peso,
    this.idade,
    this.genero,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        body: json["body"],
        bmi: json["bmi"],
        name: json['name'],
        altura: json["altura"],
        peso: json["peso"],
        genero: json["genero"],
        idade: json["idade"],
      );

  Map<String, dynamic> toJson() => {
        "bmi": bmi,
        "body": body,
        "name": name,
        "altura": altura,
        "peso": peso,
        "genero": genero,
        "idade": idade,
      };

  Person copyWith({
    String? body,
    String? bmi,
    String? name,
    double? altura,
    int? peso,
    int? idade,
    bool? genero,
  }) {
    return Person(
      name: name ?? this.name,
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
      idade: idade ?? this.idade,
      genero: genero ?? this.genero,
      bmi: bmi ?? this.bmi,
      body: body ?? this.body,
    );
  }

  double getImc() {
    return peso / (altura * altura);
  }
}
