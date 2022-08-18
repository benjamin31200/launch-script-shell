
# Développement d'un programme interprétant plusieurs script shell. Ecrit en shell bash s'éxécutant sur les systèmes GNU/Linux/WSL
***

Permet d'automatiser certaines commandes/actions répétitives au sein du terminal:
* Démarrer le serveur Mysql et lancer son projet du moment
* Créer des projets dans des répertoires spécifiques 
* Ajouter des dépendances
* Créer son dépot Github (local et distant)
* Lancer/sauvegarder/supprimer ses projets configurer rapidement

Majoritairement éxécutable en copier/coller(double clic gauche/double clic droit), le script est très intuitif et abordable.

Sur une dizaine de jours j'ai découvert le monde des interpréteurs de commande shell(bash), comprendre et appréhender comment fonctionne un système d'exploitation et comment l'optimiser et le rendre plus fluide grâce aux scripts éxécutables depuis un terminal.

## Sommaire
1. [Ressources requises pour le fontionnement](#prérequis)
2. [Lancement du Script](#lancement)
3. [Création d'un répertoire](#répertoire)
4. [Création d'un projet avec des dépendances préconfigurées](#full)
5. [Création du dépot distant git et liaison avec le dépot local](#git)
6. [Sources](#sources)

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
  <img src = "https://imagizer.imageshack.com/img922/9017/Y351Bk.gif" width = 800 height="450">
</p>

<h4 align="center">Le script démarre quand la commande personnalisé go est taper dans la console.</h4>

<h4 align="center">Commence par lancer le serveur Mysql.</h4>

<h4 align="center">Si un projet principal est configurer, possibilité de le lancer.</h4>

***
## Création d'un répertoire
<a name="répertoire"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img922/5500/bwoVzS.gif" width = 800 height="450">
</p>

<h4 align="center">Créer un dossier s'il n'existe pas et se déplace dedans.</h4>

<h4 align="center">Le chemin est sauvegarder à chaque itération.</h4>

***
## Création d'un projet avec des dépendances préconfigurées
<a name="full"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img924/9575/hS1MZw.gif" width = 800 height="450">
</p>

<h4 align="center">Créer un dossier s'il n'existe pas et se déplace dedans.</h4>

<h4 align="center">Le chemin est sauvegarder à chaque itération.</h4>

***
## Création du dépot distant git et liaison avec le dépot local
<a name="git"></a>
<p align = "center">
  <img src = "https://imagizer.imageshack.com/img924/2748/W4r9Tv.gif" width = 800 height="450">
</p>

<h4 align="center">L'authentification est assurée grâce à github CLI.</h4>

<h4 align="center">Choisir le nom ainsi que la visibilité du répository.</h4>


### Sources
<a name="sources"></a>
Sites regroupant la plupart des notions utiles aux scripts shell.

[Doc officiel ubuntu](https://doc.ubuntu-fr.org/tutoriel/script_shell)

[Guide avancé](https://abs.traduc.org/abs-fr/index.html)

