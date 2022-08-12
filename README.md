<p align = "center">
  <img src = "https://th.bing.com/th/id/OIP.bMPJwMQjUjRQi4lImi4iRwHaDH?w=300&h=146&c=7&r=0&o=5&pid=1.7" width = 400 height="200">
</p>

# Script shell s'éxécutant sous la version WSL2 Ubuntu
***
## Sommaire
1. [Instructions/Test](#general-info)
2. [Mise en place](#mise-en-place)
3. [Sources](#sources)
***
Réalisation d'un script shell pour la version du sous-système windows ubuntu WSL2.
Il permet d'automatiser certaines commandes répétitives au lancement du terminale.
***

### Instructions
<a name="general-info"></a>
#### Prérequis :
* [sous-système linux ubuntu](https://docs.microsoft.com/fr-fr/windows/wsl/install): Version 20.04
* [Mysql](https://harshityadav95.medium.com/installing-mysql-in-ubuntu-linux-windows-subsystem-for-linux-from-scratch-d5771a4a2496): Version Ver 8.0.30-0ubuntu0.20.04.2

#### Création du script :
**Depuis votre terminal ubuntu**
```
 mkdir script ; cd script ; touch script.sh ; code script.sh
```
**OU**
```
 mkdir script ; cd script ; touch script.sh ; nano script.sh
```
Copier coller le script dans le fichier et l'enregister

**OU**
```
 git clone git@github.com:benjamin31200/script_Shell.git ; cd script_shell ; nano script.sh
```

* Lire les commentaires marqués par un #.
* modifier la ligne 27 par le chemin de votre projet actuel.
* Tester.


**Lancement du script depuis la console pour des tests**
```
 bash ~/script.sh
```
***
### Faire en sorte que le script fonctionne à l'ouverture d'une fenêtre de terminal :
<a name="mise-en-place"></a>
**Copier/coller le script à la toute fin du fichier .bashrc sans altérer le reste du code**
```
 code ~/.bashrc
```
**OU**
```
 nano ~/.bashrc
```
**Enregistrer et relancer le terminal ou alors depuis une console windows powershell**
```
 wsl --shutdown
```
***
### Sources
<a name="sources"></a>
Les deux sites regroupant la plupart des notions utiles aux scripts shell.

[Doc officiel ubuntu](https://doc.ubuntu-fr.org/tutoriel/script_shell)

[Guide avancé](https://abs.traduc.org/abs-fr/index.html)
# dd
