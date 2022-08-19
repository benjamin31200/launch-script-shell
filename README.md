
# Développement d'un programme interprétant plusieurs script shell bash.
***

Automatise certaines commandes/actions répétitives au sein du terminal:
* Démarrer le serveur Mysql et lancer son projet principal
* Créer des projets dans des répertoires spécifiques 
* Ajouter des dépendances
* Créer son dépot Github (local et distant)
* Lancer/sauvegarder/supprimer ses projets configurés

Majoritairement exécutable en copier/coller(double clic gauche/double clic droit), le script est très intuitif et abordable.

Sur une dizaine de jours j'ai découvert le monde des interpréteurs de commande shell(bash).

Un intérêt latent durant l'écriture des scripts est apparu à la suite de l'approfondissement des différentes documentations recueillis sur internet, ma vision intrinsèque des systèmes d'exploitation, et plus précisément celui concernant linux à franchi une barrière et un cap sur le fonctionnement interne grâce aux nombreuses commandes existantes, marié à la programmation on peut clairement comprendre comment certaines personnes malveillantes peuvent annihiler des pc avec des scripts malveillants. 

Cela dit, l'intérêt non latent pour le coup reposait essentiellement sur une recherche pragmatique et éducative afin d'améliorer ma logique algorithmique avec une très belle partie sur la section lié à l'ajout de dépendance présélectionnable pour constituer son projet, une journée complète et quelques lignes plus tard:

<p align = "center">
  <img src="https://i.ibb.co/k8XXxjt/loop-script.png" alt="loop-script" witborder="0">
</p>

## Sommaire
1. [Ressources requises pour le fontionnement](#prérequis)
2. [Lancement du Script](#lancement)
3. [Création d'un projet](#projet)
4. [Création d'un projet avec des dépendances préconfigurées](#full)
5. [Projet préconfiguré React](#react)
6. [Création du dépot distant git et liaison avec le dépot local](#git)
7. [Configuration du package.json](#json)
8. [Enregistrement d'un projet](#save)
9. [Démarrage d'un projet](#launch)
17. [Sources](#sources)

***

## Ressources requises pour le fontionnement
<a name="prérequis"></a>
* Sous-système linux windows (WSL) ou un système d'exploitation open source de type Unix (GNU/Linux). 
* Visual studio code.
* Mysql
* GitHub / GitHub CLI

***

## Lancement du Script

<a name="lancement"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img922/9017/Y351Bk.gif" width = 900 height="500">
</p>

<h4 align="center">Le script démarre quand la commande personnalisée "go" est tapée dans la console.</h4>

<h4 align="center">Commence par lancer le serveur Mysql.</h4>

<h4 align="center">Si un projet principal est configuré, possibilité de le lancer.</h4>

***
## Création d'un projet
<a name="projet"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img922/5500/bwoVzS.gif" width = 900 height="500">
</p>

<h4 align="center">Créer un dossier s'il n'existe pas et se déplace dedans.</h4>

<h4 align="center">Le chemin est sauvegardé à chaque itération.</h4>

***
## Création d'un projet avec des dépendances préconfigurées
<a name="full"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img924/9575/hS1MZw.gif" width = 900 height="500">
</p>

<h4 align="center">Sélection de l'option d'ajout de dépendances.</h4>

<h4 align="center">Ici, une préconfiguration "full" est prise permettant d'installer directement des projets liés à des librairies.</h4>

***
## Projet préconfiguré React
<a name="react"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img924/4207/7H05vx.gif" width = 900 height="500">
</p>

<h4 align="center">Sélection de l'option d'ajout de dépendances.</h4>

<h4 align="center">Ici, une préconfiguration "full" est prise permettant d'installer directement des projets liés à des librairies.</h4>

***
## Création du dépot distant git et liaison avec le dépot local
<a name="git"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img924/2748/W4r9Tv.gif" width = 900 height="500">
</p>

<h4 align="center">L'authentification est assurée grâce à github CLI.</h4>

<h4 align="center">Choisir le nom ainsi que la visibilité du répository.</h4>

<h4 align="center">Grâce aux commandes internes de github CLI, la liaison local/distant est instantanée.</h4>

***
## Configuration du package.json
<a name="json"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img923/917/HjKsfR.gif" width = 900 height="500">
</p>

<h4 align="center">utilisation de la commande npm init pour configurer le package.json.</h4>

<h4 align="center">les liens git sont automatiquement rajoutés.</h4>

***
## Enregistrement d'un projet
<a name="save"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img922/9342/jDQGlB.gif" width = 900 height="500">
</p>

<h4 align="center">Enregistrement dans un fichier distinct de chemin d'accès complet au projet.</h4>

<h4 align="center">Enregistrement du nom du projet.</h4>

<h4 align="center">Ici chaque enregistrement s'effectue sur des deux fichiers, que j'utilise en quelque sorte comme une sauvegarde des données. Grâce à une boucle, des tableaux sont constitués en itérant sur les numéros de lignes</h4>

<p align = "center">
  <img src = "https://i.ibb.co/qBdZv5W/tableau-projet.png" width = 701 height="200">
</p>

***
## Démarrage d'un projet
<a name="launch"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img922/6818/vXybaP.gif" width = 900 height="500">
</p>

<h4 align="center">Depuis le menu il est possible de lancer un projet spécifique, en copiant collant le chemin complet.</h4>

<h4 align="center">Le projet se lance directement dans l'éditeur de code configuré, ici VScode.</h4>

### Sources
<a name="sources"></a>
Sites regroupant la plupart des notions utiles aux scripts shell.

[Doc officiel ubuntu](https://doc.ubuntu-fr.org/tutoriel/script_shell)

[Guide avancé](https://abs.traduc.org/abs-fr/index.html)

