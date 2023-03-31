class Travailleur {
  final int id;
  final String nom;
  double sommeJournaliere; // La somme perçue par le travailleur par jour
  int tachesMaxParJour; // Le nombre maximal de tâches que le travailleur peut effectuer par jour
  List<Tache> taches; // La liste des tâches affectées à ce travailleur

  Travailleur({
    required this.id,
    required this.nom,
    required this.sommeJournaliere,
    required this.tachesMaxParJour,
    required this.taches,
  });
}

class Tache {
  final int id;
  final String description;
  String statut; // Le statut de la tâche : "En cours", "Terminé", "Non-terminé"
  final int travailleurId; // L'ID du travailleur à qui la tâche est affectée
  Travailleur
      travailleur; // Une référence à l'objet Travailleur correspondant à travailleurId

  Tache({
    required this.id,
    required this.description,
    required this.statut,
    required this.travailleurId,
    required this.travailleur,
  });
}
