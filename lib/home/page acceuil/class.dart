

class Etudiant {
  String matricule;
  String nom;
  String imagephoto;
  String filiere;
  List<String> matiere;
  List<int> notes;

  Etudiant(this.matricule, this.nom, this.imagephoto, this.filiere,
      this.matiere, this.notes);
}

class Notes {
  String nommatieres;
  List<String> moyenne;
  Notes(this.nommatieres, this.moyenne);
}


