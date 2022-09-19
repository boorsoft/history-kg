class ApiPerson {
  final num id;
  final String firstName;
  final String lastName;
  final String bio;
  final String image;
  final num subjectId;

  ApiPerson({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.image,
    required this.subjectId,
  });

  static List<ApiPerson> fromListApi(List<dynamic> map) {
    List<ApiPerson> persons = map
        .map(
          (person) => ApiPerson(
            id: person['id'],
            firstName: person['firstName'],
            lastName: person['lastName'],
            bio: person['bio'],
            image: person['image'],
            subjectId: person['subjectId'],
          ),
        )
        .toList();
    return persons;
  }

  static ApiPerson fromApi(Map<String, dynamic> map) {
    return ApiPerson(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      bio: map['bio'],
      image: map['image'],
      subjectId: map['subjectId'],
    );
  }
}
