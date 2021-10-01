enum Place { Studio, Gym, OutSide }

enum Gender { Men, Women, Other }

class Instructor {
  final Place place;
  final String imagePlace;
  final String businessName;
  final String location;
  final String specialty;
  final int phoneNumber;
  final String bio;
  final int age;
  final Gender gender;
  final String language;

  const Instructor({
    required this.place,
    required this.imagePlace,
    required this.businessName,
    required this.location,
    required this.specialty,
    required this.phoneNumber,
    required this.bio,
    required this.age,
    required this.gender,
    required this.language,
  });
}
