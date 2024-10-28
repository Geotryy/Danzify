

class Todo {
  int telefone;
  String nome;

  Todo({
    required this.telefone,
    required this.nome,
  });

  Todo.FromJson(Map<String, Object?> json)
      : this(
          telefone: json['telefone']! as int,
          nome: json['nome']! as String,
        );
  Todo copyWith({int? telefone, String? nome}) {
    return Todo(
      telefone: telefone ?? this.telefone,
      nome: nome ?? this.nome,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'telefone': telefone,
      'nome': nome,
    };
  }
}
