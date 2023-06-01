class PokemonDataResponseModel {
  List<Abilities>? abilities;
  int? baseExperience;
  List<Forms>? forms;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Moves>? moves;
  String? name;
  int? order;
  Ability? species;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;
  String? error;

  PokemonDataResponseModel.withError(String errorMessage) {
    error = errorMessage;
  }

  PokemonDataResponseModel(
      {this.abilities,
      this.baseExperience,
      this.forms,
      this.height,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.moves,
      this.name,
      this.order,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  PokemonDataResponseModel.fromJson(Map<String, dynamic> json) {
    abilities = json['abilities'] != null
        ? (json['abilities'] as List).map((i) => Abilities.fromJson(i)).toList()
        : List<Abilities>.empty();

    baseExperience = json['base_experience'];
    forms = json['forms'] != null
        ? (json['forms'] as List).map((i) => Forms.fromJson(i)).toList()
        : List<Forms>.empty();
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    moves = json['moves'] != null
        ? (json['moves'] as List).map((i) => Moves.fromJson(i)).toList()
        : List<Moves>.empty();
    name = json['name'];
    order = json['order'];
    species =
        json['species'] != null ? Ability.fromJson(json['species']) : null;
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    stats = json['stats'] != null
        ? (json['stats'] as List).map((i) => Stats.fromJson(i)).toList()
        : List<Stats>.empty();
    types = json['types'] != null
        ? (json['types'] as List).map((i) => Types.fromJson(i)).toList()
        : List<Types>.empty();

    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = abilities?.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = baseExperience;
    if (forms != null) {
      data['forms'] = forms?.map((v) => v.toJson()).toList();
    }
    data['height'] = height;
    data['id'] = id;
    data['is_default'] = isDefault;
    data['location_area_encounters'] = locationAreaEncounters;
    if (moves != null) {
      data['moves'] = moves?.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['order'] = order;

    if (species != null) {
      data['species'] = species?.toJson();
    }
    if (sprites != null) {
      data['sprites'] = sprites?.toJson();
    }
    if (stats != null) {
      data['stats'] = stats?.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types?.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? Ability.fromJson(json['ability']) : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ability != null) {
      data['ability'] = ability?.toJson();
    }
    data['is_hidden'] = isHidden;
    data['slot'] = slot;
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class GameIndices {
  int? gameIndex;
  Ability? version;

  GameIndices({this.gameIndex, this.version});

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version =
        json['version'] != null ? Ability.fromJson(json['version']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_index'] = gameIndex;
    if (version != null) {
      data['version'] = version?.toJson();
    }
    return data;
  }
}

class Moves {
  Ability? move;

  Moves({
    this.move,
  });

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? Ability.fromJson(json['move']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (move != null) {
      data['move'] = move?.toJson();
    }
    return data;
  }
}

class Sprites {
  Other? other;

  Sprites({
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (other != null) {
      data['other'] = other?.toJson();
    }

    return data;
  }
}

class Other {
  Home? home;
  OfficialArtwork? officialArtwork;

  Other({this.home, this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    officialArtwork = json['official-artwork'] != null
        ? OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (home != null) {
      data['home'] = home?.toJson();
    }
    if (officialArtwork != null) {
      data['official-artwork'] = officialArtwork?.toJson();
    }
    return data;
  }
}

class Home {
  String? frontDefault;
  String? frontShiny;

  Home({
    this.frontDefault,
    this.frontShiny,
  });

  Home.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;

    data['front_shiny'] = frontShiny;

    return data;
  }
}

class OfficialArtwork {
  String? frontDefault;
  String? frontShiny;

  OfficialArtwork({this.frontDefault, this.frontShiny});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Ability? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? Ability.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat?.toJson();
    }
    return data;
  }
}

class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type?.toJson();
    }
    return data;
  }
}

class Forms {
  String? name;
  String? url;

  Forms({this.name, this.url});

  Forms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
