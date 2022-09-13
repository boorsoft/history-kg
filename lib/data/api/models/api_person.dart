class ApiPerson {
  final String id;
  final String firstName;
  final String lastName;
  final String bio;
  final String image;
  final String subjectId;

  ApiPerson({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.image,
    required this.subjectId,
  });

  ApiPerson.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        bio = map['bio'],
        image = map['image'],
        subjectId = map['subjectId'];
}
