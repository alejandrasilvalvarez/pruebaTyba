class Character {
  final num id;
  final String name, status, species, type, gender, image;
  final List<dynamic> chapters;

  Character(
      {this.id = 0,
      this.name = 'Next to be discover character',
      this.status = 'Maybe alive',
      this.species = 'Unkown for now',
      this.type = 'The pokedex have zero information about this',
      this.gender = 'Non-binary',
      this.image = 'https://rickandmortyapi.com/api/character/avatar/19.jpeg',
      this.chapters = const ['']});

  factory Character.fromJson(final json) {
    return Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        image: json["image"],
        gender: json["gender"],
        chapters: json["episode"]);
  }
}
