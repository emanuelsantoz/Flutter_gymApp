class Sentimento{
  String id;
  String data;
  String sentimento;

  // Construtor padrão de inicialização da classe
  Sentimento({
    required this.id,
    required this.data,
    required this.sentimento
  });

  //Construtor que server para pegar dados de apis ou banco de dados
  Sentimento.fromMap(Map<String, dynamic> map) 
  :id = map["id"],
  data = map["data"],
  sentimento = map["sentimento"];

  //Construtor que server para enviar dados de apis ou banco de dados
  //Convertando par map
  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "data": data,
      "sentimento": sentimento,
    };
  }
}