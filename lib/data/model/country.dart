
class Country {
  final String county;
  final List<City> cities;

  Country({required this.county, required this.cities});
}

class City {
  final String name;

  City({required this.name});
}
