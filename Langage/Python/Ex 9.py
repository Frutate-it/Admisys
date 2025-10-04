# Entrée du nombre d'étudiants
x = int(input("Entrez le nombre d'étudiants : "))

# Initialisation
notes = []
somme = 0

# Lecture des notes
for i in range(x):  # i va de 0 à x-1
    note = float(input(f"Entrez la note de l'étudiant {i+1} : "))
    notes.append(note)
    somme += note

# Calcul de la moyenne
moyenne = somme / x

# Compter le nombre de notes supérieures à la moyenne
c = 0
for i in range(x):
    if notes[i] > moyenne:
        c += 1

# Affichage du résultat
print(f"Nombre de notes supérieures à la moyenne ({moyenne:.2f}) : {c}")
