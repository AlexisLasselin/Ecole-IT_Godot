# Atelier IT - Crée ton propre mini-jeu en pixel art

<details> <summary>Table des matières</summary>

- [Atelier IT - Crée ton propre mini-jeu en pixel art](#atelier-it---crée-ton-propre-mini-jeu-en-pixel-art)
  - [Présentation de l'atelier](#présentation-de-latelier)
  - [Objectifs de l'atelier](#objectifs-de-latelier)
  - [1. Introduction à Godot Engine](#1-introduction-à-godot-engine)
  - [2. Création du niveau en pixel art](#2-création-du-niveau-en-pixel-art)
    - [Ajout d'un TileMapLayer](#ajout-dun-tilemaplayer)
    - [Importation des tuiles](#importation-des-tuiles)
    - [Ajout de collisions aux tuiles](#ajout-de-collisions-aux-tuiles)
  - [3. Ajout d'un personnage jouable](#3-ajout-dun-personnage-jouable)
    - [Création du personnage](#création-du-personnage)
    - [Ajout des sprites et animations](#ajout-des-sprites-et-animations)
    - [Ajout des collisions au personnage](#ajout-des-collisions-au-personnage)
    - [Ajout d'une caméra au personnage](#ajout-dune-caméra-au-personnage)
    - [Ajout du personnage au niveau principal](#ajout-du-personnage-au-niveau-principal)
    - [Ajout d'un script de déplacement au personnage](#ajout-dun-script-de-déplacement-au-personnage)
  - [4. Ajout d'éléments interactifs](#4-ajout-déléments-interactifs)
    - [Création de la pièce](#création-de-la-pièce)
    - [Ajout de la pièce au niveau principal](#ajout-de-la-pièce-au-niveau-principal)
    - [Création du script de la pièce](#création-du-script-de-la-pièce)
    - [Création d'un gestionnaire de score](#création-dun-gestionnaire-de-score)
    - [Connexion du gestionnaire de score à la pièce](#connexion-du-gestionnaire-de-score-à-la-pièce)
    - [Ajout d'un affichage du score à l'écran](#ajout-dun-affichage-du-score-à-lécran)
  - [5. Exportation du jeu](#5-exportation-du-jeu)
  - [Félicitations !](#félicitations-)

</details>

## Présentation de l'atelier

Dans cet atelier, tu apprendras à créer ton propre jeu vidéo en pixel art grâce à Godot Engine, un moteur de jeu open source. Tu découvriras les bases de la programmation de jeux, la création de niveaux ainsi que l'animation de personnages en pixel art.

## Objectifs de l'atelier

- Comprendre les concepts de base du développement de jeux vidéo.
- Apprendre à utiliser Godot Engine pour créer un jeu.
- Concevoir son propre niveau en pixel art.
- Ajout d'un personnage jouable avec des animations simples.
- Création d'éléments interactifs (collecte d'objets, ennemis, etc.).
- Exporter le jeu pour l'avoir chez soi.

## 1. Introduction à Godot Engine

Pour faire un jeu, il existe deux méthodes principales :

- Tout coder de 0, des jeux comme Minecraft ou le premier Doom ont été faits comme ça.
- Utiliser un moteur de jeu, qui est un logiciel qui fournit des outils pour créer des jeux plus facilement et rapidement, tel que Godot Engine, Unity ou Unreal Engine.

C'est comme utiliser des briques LEGO pour construire une maison au lieu de sculpter chaque brique à la main.

Le moteur de jeu que nous allons utiliser dans cet atelier est **Godot Engine**. C'est un moteur open source, gratuit et très populaire pour créer des jeux 2D et 3D.

Alors, afin de gagner un peu de temps, le travail de cet atelier a déjà été prémaché dans un projet déjà existant. Vous le trouverez sur vos machines en ouvrant Godot Engine et en cliquant sur `Edition`

Vous serez alors accueillis par du menu d'édition de Godot Engine sur ce que l'on appelle une "scène". Une scène est un ensemble d'objets qui composent une partie de votre jeu, comme un niveau, un personnage ou un menu.
Dans notre cas, la scène ouverte est le niveau de jeu principal, pour l'instant vide, mais nous allons y ajouter des éléments pour créer notre mini-jeu en pixel art.

## 2. Création du niveau en pixel art

On va commencer par créer le niveau de notre jeu en utilisant des tuiles (tiles) en pixel art.

Cela va nous permettre de construire rapidement des environnements en assemblant des petites images carrées.

### Ajout d'un TileMapLayer

Pour ce faire, nous allons utiliser un "TileMapLayer", qui est un type de nœud dans Godot Engine spécialement conçu pour gérer des tuiles.
Cliquez donc sur le bouton `+` en haut à gauche et sélectionnez "TileMapLayer" dans la liste des nœuds disponibles.
Maintenant, à droite, vous verrez les propriétés du TileMapLayer. Nous allons devoir lui assigner un "TileSet", qui est une collection de tuiles que nous allons utiliser pour construire notre niveau.
Cliquez sur le champ "Tile Set" et sélectionnez "New TileSet", comme vous pouvez le voir, un quadrillage orange est apparu, mais il est très petit pour l'instant, c'est pourquoi je vous propose de modifier la taille des tuiles.
Pour cela, cliquez sur le bouton `Transform` et de modifier le paramètre `Scale` en le mettant à `2.575` pour agrandir les tuiles.
Ensuite, cliquez sur `TileSet`en bas pour ouvrir l'éditeur de TileSet.

### Importation des tuiles

Il faut désormais importer des tuiles. Pour cela, cliquez sur le bouton`+`puis`Atlas`, ouvrez `Sprites/world_tileset.png`et double-cliquez dessus, la popup va vous demander si vous souhaitez créer un atlas à partir de cette image, cliquez sur`Oui`.
Allez désormais dans `Tilemap`, cliquez sur le pinceau et vous pouvez commencer à peindre votre niveau en utilisant les tuiles disponibles, pour que cela apparaisse dans le jeu, il faudra juste peindre dans la zone visible de la caméra (le rectangle bleu).
Si à tout moment, vous souhaitez effacer des tuiles, faire un clic droit avec le pinceau sélectionné suffit, pas besoin de sélectionner une gomme.
Pour voir le résultat, il suffit de sauvegarder la scène avec `Ctrl + S` puis de cliquer sur le bouton `▶️` en haut à droite ou bien d'appuyer sur `F5` pour lancer le jeu.

Une fenêtre s'ouvre et vous pouvez voir le niveau que vous avez créé !

### Ajout de collisions aux tuiles

Cependant, si jamais on venait à ajouter un personnage jouable, celui-ci traverserait les tuiles, car elles n'ont pas de collisions.
Pour ajouter des collisions, retournez à droite, et on clique sur `TileSet` pour retourner dans l'éditeur de TileSet.

On peut changer la taille ou la forme des tuiles, mais ça ne nous interesse pas puisque nos tuiles sont déjà bien découpées.
Ce qui nous interesse, c'est d'ajouter des collisions. Pour cela, on sélectionne `Physics Layer` et on clique sur le bouton `Ajouter un élément`

On retourne sur l'onglet `TileSet` en bas et on va sur `Peindre`, on choisit notre peinture (par défaut `Calque physique 0`) et on clique sur les tuiles pour dessiner leurs collisions.
Si l'on avait plus de temps, on pourrait ajouter des collisions plus précises en dessinant des formes personnalisées, ou en faisant des collisions monodirectionnelles (par exemple, pour des plateformes que l'on peut sauter par en dessous), mais pour l'instant, ce n'est pas nécessaire.

## 3. Ajout d'un personnage jouable

Maintenant que notre niveau est prêt, nous allons ajouter un personnage jouable que l'on pourra déplacer dans le niveau.

### Création du personnage

Pour cela, nous allons créer une nouvelle scène pour notre personnage.
En haut, ouvrez un nouvel onglet en cliquant sur le bouton `+` puis cliquez sur `2D Scene` pour créer une nouvelle scène 2D.
On va la sauvegarder tout de suite avec `Ctrl + S` et on l'appelle `Player.tscn`.

### Ajout des sprites et animations

Maintenant, on ne veut pas une tilemap mais un personnage, donc on va ajouter un nœud `CharacterBody2D`, qui est un type de nœud spécialement conçu pour les personnages jouables.
La particularité de ce nœud est qu'il gère déjà des choses comme les mouvements avec les flèches directionnelles par exemple.
Maintenant, on va lui donner une apparence, on va donc faire un clic droit sur `CharacterBody2D` et on ajoute un nœud enfant `AnimatedSprite2D`, qui est un type de nœud qui permet d'afficher des animations en 2D
Maintenant, on va lui assigner une animation en pixel art. Pour cela, on clique sur le champ `SpriteFrames` et on sélectionne `New SpriteFrames` et la catégorie `SpriteFrames` apparaît en bas.
On clique dessus pour ouvrir l'éditeur d'animations.
Maintenant, on veut lui ajouter une animation d'attente. On clique sur le bouton `+` en bas à gauche et on l'appelle `idle`.
Ensuite, on va importer les images de l'animation. Pour cela, on clique sur le bouton en forme de grille à droite du bouton dossiers, on ouvre `Sprites/knight.png` et on valide.
Ceci est une feuille de sprites (spritesheet) qui contient plusieurs images d'animation du personnage.
Pour découper les images, correctement, on va modifier les paramètres `horizontal` et `vertical` en les mettant tous les deux à `8`. Ce qui formera un grille de 8x8 images avec nos personnages correctement découpés.
Ensuite, on sélectionne les images de la première ligne en cliquant et en faisant glisser la souris, puis on clique sur le bouton `Ajouter 4 images` en bas à gauche.

Si vous pressez `F`, vous allez vous centrer sur le personnage, vous pouvez aussi zoomer avec la molette de la souris.
Et comme vous pouvez le voir, il n'est pas très beau, Godot va essayer de lisser les pixels, ce qui n'est pas du tout l'effet recherché en pixel art, pour corriger cela, on va dans les paramètres du projet en cliquant sur `Projet` > `Paramètres du projet...`, puis on va dans l'onglet `Rendu` > `Textures` et on change le paramètre `Filtre de texture par défaut` en `Nearest`. Le rendu sera plus net et plus fidèle au pixel art.
Maintenant, si on revient en bas dans notre SpriteFrames, on peut cliquer sur le bouton `Lecture` pour voir l'animation de course de notre personnage, si besoin, on peut ajuster la vitesse de l'animation en modifiant le paramètre `FPS` en haut à gauche, mettons-le à `10` pour l'instant.

> Si des gens sont en avance, leur proposer d'ajouter d'autres animations (idle, death.) en utilisant la même méthode.

### Ajout des collisions au personnage

Maintenant, il faut ajouter des collisions à notre personnage pour qu'il puisse interagir avec le niveau. Pour cela, on retourne sur le nœud `CharacterBody2D`, on fait un clic droit et on ajoute un nœud enfant `CollisionShape2D`, qui est un type de nœud qui permet de définir une forme de collision pour un objet.
Dans les propriétés du `CollisionShape2D`, on clique sur le champ `Shape` et on sélectionne `New RectangleShape2D`, puis on clique dessus pour ouvrir ses propriétés.
On peut alors agrandir le rectangle pour qu'il englobe bien le personnage en bougeant le point rouge sur les côtés.

On sauvegarde la scène avec `Ctrl + S` et on est bon.

Maintenant, notre personnage est presque prêt, il ne reste plus qu'à lui mettre une caméra dessus et l'ajouter à notre niveau principal.

### Ajout d'une caméra au personnage

Pour cela, on fait un clic droit sur le nœud `CharacterBody2D` et on ajoute un nœud enfant `Camera2D`, qui est un type de nœud qui permet de suivre un objet dans le jeu.
Dans les propriétés de la caméra, on coche la case `Current` pour qu'elle soit active.
On peut également ajuster le zoom de la caméra en modifiant le paramètre `Zoom`, mettons-le à `2, 2` pour avoir une vue plus rapprochée du personnage.
On sauvegarde la scène avec `Ctrl + S` et on est bon.

Il est désormais temps d'ajouter notre personnage au niveau principal.

### Ajout du personnage au niveau principal

Pour cela, on retourne dans l'onglet de notre niveau principal, et si on regarde dans l'arborescence des fichiers en bas à gauche, on peut voir notre fichier `Player.tscn`.
Il suffit de le faire glisser dans l'arborescence de la scène, en le plaçant où l'on veut sur la carte, de préférence sur une tuile de sol.
On peut ajuster sa position en le sélectionnant et en utilisant les flèches directionnelles pour le déplacer.
On sauvegarde la scène avec `Ctrl + S` et on peut lancer le jeu avec `F5` pour voir le résultat.
Et là, on peut voir notre personnage dans le niveau, mais pour l'instant, il ne bouge pas et dehors de son animation d'attente.
Pour lui permettre de se déplacer, il va falloir ajouter un script à notre personnage.

### Ajout d'un script de déplacement au personnage

On revient sur notre scène `Player.tscn`, on sélectionne le nœud racine et on clique sur le bouton parchemin `Ajouter un script` en haut.
On peut changer son emplacement et son nom, pour le mettre dans un dossier `Scripts` par exemple, et on clique sur `Créer`.
Cela ouvre l'éditeur de script avec un script déjà prérempli puisqu'on a laissé le modèle du `CharacterBody2D`.
On sauvegarde et on relance le jeu avec `F5` pour voir le résultat.
Et là, on peut déplacer notre personnage avec les flèches directionnelles !

## 4. Ajout d'éléments interactifs

Maintenant que notre personnage peut se déplacer dans le niveau, on va ajouter des éléments interactifs, comme des objets à collecter ou des ennemis à éviter.

On va commencer par ajouter un objet à collecter, comme une pièce d'or.

### Création de la pièce

Pour cela, on crée une nouvelle scène en cliquant sur le bouton `+` en haut à gauche et on sélectionne `2D Scene`.
On sauvegarde la scène avec `Ctrl + S` et on l'appelle `Coin.tscn`.
On crée un nœud-mère `Area2D`, qui est un type de nœud qui permet de détecter les collisions avec d'autres objets.
On ajoute un nœud enfant `AnimatedSprite2D` pour la future animation de la pièce.
De même que pour le personnage, on crée un nouveau `SpriteFrames`, on ajoute une animation `default` et on importe les images de la pièce depuis `Sprites/`. Et le choix est à vous, pièce simple, gemme, etc. Le pack de sprites contient plusieurs options.
On va découper la spritesheet en mettant `vertical` à `1` et `horizontal` à `4` si l'on a choisi une gemme et `5` si l'on a choisi une pièce.
On sélectionne les images de la ligne et on clique sur `Ajouter 4 images` ou `5 images` selon le cas.
On lance l'animation pour voir le résultat et on ajuste le `FPS` si besoin.
Tadam ! Notre pièce est presque prête.

Avant de passer à l'étape suivante, on va rendre l'execution de l'animation automatique. Pour cela, on sélectionne le bouton `Autoplay` à gauche du bouton `Loop`.

Maintennant, il faut ajouter une collision à notre pièce pour qu'elle puisse détecter quand le personnage la touche.
On sélectionne le nœud `Area2D`, on fait un clic droit et on ajoute un nœud enfant `CollisionShape2D`, on prend la forme `CircleShape2D` ou `CapsuleShape2D` et on ajuste son rayon pour qu'il englobe bien la pièce.

On sauvegarde la scène avec `Ctrl + S` et on est bon.

### Ajout de la pièce au niveau principal

Désormais notre pièce est créée, il faut l'ajouter à notre niveau principal.

Pour cela, on retourne dans l'onglet de notre niveau principal, et on fait glisser le fichier `Coin.tscn` depuis l'arborescence des fichiers en bas à gauche vers l'endroit souhaité sur la carte.
On peut ajuster sa position en le sélectionnant et en utilisant les flèches directionnelles pour le déplacer au besoin.
On sauvegarde la scène avec `Ctrl + S` et on peut lancer le jeu avec `F5` pour voir le résultat.

Et voilà ! Nous avons ajouté une pièce à collecter dans notre niveau mais pour l'instant, elle n'interagit pas avec le personnage lorsqu'il la touche. Pour cela, il va falloir ajouter un script à notre pièce.

### Création du script de la pièce

On retourne dans la scène `Coin.tscn`, on sélectionne le nœud racine `Area2D` et on clique sur le bouton parchemin `Ajouter un script` en haut.

Là, on a pas le même modèle de script que pour le personnage, car `Area2D` n'a pas de fonctionnalités de déplacement intégrées.

On a uniquement 2 fonction
s prêtes à être utilisées : `_ready()` qui s'exécute lorsque la scène est chargée, et `_process(delta)` qui s'exécute à chaque frame du jeu, cependant, leur seul paramètre est `pass`, ce qui signifie qu'elles ne font rien pour l'instant.

Par exemple, on va afficher un message dans la console lorsque la pièce est chargée, pour cela, on va utiliser la fonction `print()`.

```gdscript
func _ready():
	print("Pièce chargée !")
```

On sauvegarde le script avec `Ctrl + S` et on relance le jeu avec `F5` pour voir le résultat, rien ne change dans le jeu, mais si on ouvre la console en bas (onglet `Sortie`), on peut voir le message "Pièce chargée !" s'afficher, s'il y a plusieurs pièces dans le niveau, le message s'affichera autant de fois qu'il y a de pièces.

Maintenant, on va faire en sorte que lorsque le personnage touche la pièce, il y ait une interaction, comme augmenter un score et faire disparaître la pièce.

Pour cela, à droite, on clique sur l'onglet `Noeud` pour voir les signaux disponibles pour `Area2D`, on double-clique sur le signal `body_entered(body: Node2D)` et on clique sur le bouton `Connecter`.

Une nouvelle fonction `_on_body_entered(body: Node2D)` est créée dans le script, cette fonction s'exécute lorsque un autre objet entre en collision avec la pièce.

Comme tout à l'heure, on va afficher un message dans la console pour vérifier que cela fonctionne.

```gdscript
func _on_body_entered(body: Node2D):
	print("Pièce collectée !")
```

On sauvegarde le script avec `Ctrl + S` et on relance le jeu avec `F5` pour voir le résultat.
Lorsque le personnage touche la pièce, on peut voir le message "Pièce collectée !" s'afficher dans la console.
Pour faire disparaître la pièce lorsqu'elle est collectée, on peut utiliser la fonction `queue_free()`, qui supprime l'objet du jeu.

```gdscript
func _on_body_entered(body: Node2D):
	print("Pièce collectée !")
	queue_free()
```

Désormais, le personnage peut collecter des pièces dans le niveau !

Mais il serait préférable d'avoir un score qui augmente à chaque pièce collectée.

### Création d'un gestionnaire de score

Pour créer un score, on a besoin de deux éléments : une variable pour stocker le score et une interface utilisateur pour afficher le score à l'écran.
On va commencer par créer un nouveau nœud `Node` dans notre niveau principal pour gérer le score.
On l'appelle `ScoreManager` et on va le mettre tout en haut de l'arborescence des nœuds-enfants, histoire qu'il soit le premier à être chargé au lancement du jeu.
On lui ajoute un script en cliquant sur le bouton parchemin `Ajouter un script` en haut.

Tout d'abord, on crée une variable `score` pour stocker le score, on l'initialise à `0`.

```gdscript
extends Node

var score = 0
```

Pour une fois, on ne va pas utiliser les outils de Godot mais créer notre fonction de score nous-même.

On crée une fonction `add_score()` qui ajoute des points au score.

```gdscript
extends Node

var score = 0

func add_score():
	score += 1
	print("Score : %d" % score)
```

### Connexion du gestionnaire de score à la pièce

Cependant, on n'utilise jamais cette fonction car elle n'est appelée nulle part.
Pour cela, on va retourner dans le script de la pièce `Coin.gd`, on pourrait juste importer le script, mais ce n'est pas une bonne pratique dans Godot car cela créerait une dépendance directe entre les deux scripts.

A la place, on va faire un clic droit sur le nœud `ScoreManager` et on valide le paramètre `Accéder en tant que nom unique` pour qu'il soit accessible depuis n'importe quel autre nœud du jeu. Si cela fonctionne, on verra un symbole `%` apparaître à côté de son nom dans l'arborescence des nœuds-enfants.

Maintenant, si l'on sélectionne le noeud `ScoreManager`, on peut le faire glisser dans le script de la pièce `Coin.gd` pour créer une variable qui référence le gestionnaire de score.

```gdscript
extends Area2D

@onready var score_manager = %ScoreManager
```

Un probblème qu'il serait possible de rencontrer est que le gestionnaire de score n'est pas dans la même scène que la pièce, donc il ne sera pas trouvé.

Désormais, on peut modifier la fonction `_on_body_entered()` pour appeler la fonction `add_score()` du gestionnaire de score lorsqu'une pièce est collectée.

```gdscript
func _on_body_entered(body: Node2D):
	score_manager.add_score()
	queue_free()
```

On sauvegarde le script avec `Ctrl + S` et on relance le jeu avec `F5` pour voir le résultat.
Lorsque le personnage touche la pièce, le score augmente et s'affiche dans la console.

Maintenant, une fois publié, le jeu n'est pas forcément inclus avec la console, donc il serait préférable d'afficher le score à l'écran.

### Ajout d'un affichage du score à l'écran

Pour cela, on va ajouter un noeud-enfant `Label` au nœud `ScoreManager`, qui est un type de nœud qui permet d'afficher du texte à l'écran.
On l'appelle `ScoreLabel` et on modifie son texte par défaut en `Score : 0`.
On peut le placer à la fin du niveau en le déplaçant.

Comme ce dernier est un nœud-enfant de `ScoreManager`, on peut le référencer dans le script de ce dernier, soit en le faisant glisser dans le script, soit tapant le code suivant :

```gdscript
@onready var score_label = $ScoreLabel
```

Maintenant, on peut modifier la fonction `add_score()` pour mettre à jour le texte du label à chaque fois que le score change.

```gdscript
func add_score():
	score += 1
	score_label.text = "You collected " + str(score) + " coins!"
```

On sauvegarde le script avec `Ctrl + S` et on relance le jeu avec `F5` pour voir le résultat.

Désormais, lorsque le personnage collecte une pièce, le texte changera pour afficher le score actuel à l'écran.

Et voilà ! Nous avons créé un mini-jeu en pixel art avec Godot Engine, comprenant un niveau, un personnage jouable et des éléments interactifs.

Maintenant, il est temps d'exporter le jeu pour l'avoir chez soi.

## 5. Exportation du jeu

Pour exporter le jeu, on va dans le menu `Projet` > `Exporter...`.

Si c'est la première fois que vous exportez un projet, il faudra ajouter une configuration d'exportation en cliquant sur le bouton `Ajouter...` et en sélectionnant la plateforme souhaitée (Windows pour plus de simplicité).

Ensuite, on clique sur le bouton `Exporter le projet` en bas, on choisit l'emplacement où enregistrer le fichier exécutable et on clique sur `Enregistrer` après avoir décoché l'export du debut.

On va avoir 2 fichiers : un fichier exécutable (.exe) et un fichier de données (.pck).

Vous pouvez maintenant utiliser le fichier exécutable pour lancer votre jeu sur n'importe quel ordinateur compatible !

> Attention
> Il est possible que votre antivirus détecte le fichier exécutable comme une menace, car il n'est pas signé numériquement. Il suffit de l'ajouter en exception pour pouvoir l'exécuter sans problème, ou alors, si vous êtes sous windows 11, de cliquer sur "Informations complémentaires" puis "Exécuter quand même".

Vous pouvez désormais sélectionner les deux fichiers et les compresser dans une archive ZIP pour les partager facilement avec vos amis ou les publier en ligne.

## Félicitations !

Vous avez créé votre propre mini-jeu en pixel art avec Godot Engine ! N'hésitez pas à continuer à explorer les fonctionnalités de Godot et à ajouter plus de contenu à votre jeu, comme des ennemis, des niveaux supplémentaires ou des effets sonores. Amusez-vous bien !
