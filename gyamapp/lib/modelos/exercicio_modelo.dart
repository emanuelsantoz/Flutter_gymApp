class ExercicioModelo {
  String id;
  String name;
  String treino;
  String comoFazer;

  String? UrlImagem;

  // Passando no construtor
  ExercicioModelo({
    required this.id,
    required this.comoFazer,
    required this.name,
    required this.treino,
  });

  // Construtor que veio da internet, e convertendo na classe
  ExercicioModelo.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        comoFazer = map["comoFazer"],
        treino = map["treino"],
        UrlImagem = map["UrlImagem"];

//Convertendo para Map 
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": name,
      "treino": treino,
      "comoFazer": comoFazer,
      "urlImagem": UrlImagem,
    };
  }
}
