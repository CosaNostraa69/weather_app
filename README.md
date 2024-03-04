# Weather App

Ce projet est une application météo développée avec Flutter. Elle permet aux utilisateurs d'obtenir les prévisions météorologiques actuelles pour leur localisation ou pour une ville spécifique.

## Fonctionnalités

- Affichage de la météo actuelle basée sur la localisation de l'utilisateur.
- Recherche et affichage des conditions météorologiques pour une ville spécifique.
- Animation correspondant à la condition météorologique actuelle.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé Flutter sur votre système. Si ce n'est pas le cas, vous pouvez suivre les instructions d'installation sur le site officiel de Flutter : https://flutter.dev/docs/get-started/install

## Installation

Pour utiliser ce projet, suivez ces étapes :

1. Clonez le dépôt sur votre machine locale en utilisant :

    ```
    git clone git@github.com:CosaNostraa69/weather_app.git
    ```

2. Accédez au dossier du projet :

    ```
    cd weather_app
    ```

3. Installez les dépendances nécessaires :

    ```
    flutter pub get
    ```

4. Créez un fichier `.env` à la racine du projet et ajoutez votre clé API d'OpenWeatherMap :

    ```
    OPENWEATHERMAP_API_KEY=[Votre_Clé_API]
    ```

    Vous pouvez obtenir une clé API en vous inscrivant sur https://openweathermap.org/api

5. Exécutez l'application sur un émulateur ou un dispositif physique :

    ```
    flutter run
    ```

## Utilisation

Une fois l'application lancée, elle tentera de détecter votre localisation actuelle pour afficher la météo. Vous pouvez également rechercher la météo pour différentes villes en utilisant la fonctionnalité de recherche intégrée.

## Contribution

Les contributions à ce projet sont les bienvenues. Si vous souhaitez contribuer, veuillez forker le dépôt, apporter vos modifications et créer une pull request.

## Licence

Ce projet est distribué sous la licence MIT. Voir le fichier `LICENSE` pour plus d'informations.
