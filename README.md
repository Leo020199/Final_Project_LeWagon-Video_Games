# Projet PIU PIU — Analyse de marché du jeu vidéo
**🎯 Ouvrir le dashboard :** [https://lookerstudio.google.com/embed/reporting/64f4f0d0-0df3-46b7-8be9-b57a98db3213/page/p_x405yj6vvd ](https://lookerstudio.google.com/embed/reporting/64f4f0d0-0df3-46b7-8be9-b57a98db3213/page/p_6vqzv75vvd)


**Objectif business :** Identifier le **sweet spot** (plateforme × genre × localisation × politique prix) pour cibler la stratégie produit et construire un **argumentaire investisseurs** pour le developpement d'un jeu vidéo à fort potentiel.

---

## 📚 Sources de données

- **Gaming profiles (Playstation, Xbox, Steam)** — Kaggle  
  https://www.kaggle.com/datasets/artyomkruglov/gaming-profiles-2025-steam-playstation-xbox  
  - Dataset de **140 000 joueurs**
  - **68 000 jeux** référencés
  - Données de **2003-2025** 

- **Released games per plateform (1993-2024)** — Zenodo  
  https://zenodo.org/records/10797761

- **Best-selling game consoles (all-time)** — Kaggle  
  https://www.kaggle.com/datasets/tayyarhussain/best-selling-game-consoles-of-all-time

- **Best 500 video games launch prices** — IA generated

---

## 🔭 Introduction sur le monde du jeu vidéo (vue globale)
- **CA mondial 2024** : 184 Md $.
- **Répartition du CA par plateforme** : Mobile 51 %, Console 28,6 %, PC 20,4 %.
- **Catalogue jeux (1993–2023)** : ~100 000 jeux référencés.


## 🎮 Plateformes & volumes (1993–2023)
- **Nombre de jeux sortis par plateforme** : PC/Steam volume plus important (écosystème ouvert, long tail plus dense).
- **Jeux mobiles** : cible très variée et volume de téléchargements beaucoup plus important (milliards de téléchargements).
- **Jeux Nintendo** : majoritairement développés par Nintendo et licences propres au constructeur.
- **Guerres des consoles** : chute de ventes de Xbox, remontée en force de Nintendo

![Dashboard – Overview](lookerstudio/screenshot-overview.png)

---

## 🧾 Données & périmètres (échantillons)

- **Localisation / achats** : ~**15 667 000** jeux **achetés** (sélection centrée sur 3 genres : **Aventure**, **RPG**, **Shooter**).

## 🏷️ Recommandation sur le genre
- Comparaison du **nombre de jeux référencés par genre** VS **nombre de joueurs moyen d'un jeu par genre** pour déterminer le genre de jeu à recommander
- **Genres Shooter, Combat, Racing, Sports** : monopole de grands développeurs
- **Nos recommandation de genres** : Aventure, RPG, Shooter (genres moins 


## 🌍 Localisation (échantillon achats ≈ 15 667 000)
- **Répartition par région (3 genres : Aventure, RPG, Shooter)** :  
  **Europe 45,9 %**, **Amérique 36,9 %**, **Asie 14,2 %**, **Autres/indéterminé ~3,0 %**.
- **Zones commerciales ciblées** :  
  **Europe** (Royaume-Uni, Allemagne, Russie, Espagne, France) · **Amérique** (États-Unis, Canada, Brésil, Argentine).
- **Langues prévues** : **6** — allemand, russe, espagnol, français, anglais, portugais.

![Dashboard – Localisation](lookerstudio/screenshot-localisation.png)

## 💶 Pricing & monétisation (2003–2024)
**Périmètre** : Top 100 et **Top 30** des meilleurs jeux **PlayStation** & **Steam** (objectif : **s’inscrire dans le Top 30**).

- **Répartition des jeux par mode** : **Multijoueur 57,1 %**, **Solo 42,9 %**.  
- **Répartition du CA par mode** : **Multijoueur 67,2 %**, **Solo 32,8 %**.
- **Prix moyen par plateforme** : **PlayStation ~65 €**, **Steam ~40 €**  
  → Différentiel **+25 €** (≈ **+62,5 %** vs Steam).
- **Prix moyen par genre** : **RPG 69,99 €**, **Aventure 63 €**, **Shooter 53 €**  
  → RPG vs Aventure : **+6,99 €** (≈ **+11,1 %**) ; RPG vs Shooter : **+16,99 €** (≈ **+32,1 %**).
- **Prix moyen par région** : suivi dans le **dashboard**.
- **Panier moyen par joueur (genre & région)** : suivi dans le **dashboard**.
- **CA moyen par jeu et par genre** : suivi dans le **dashboard**.

**Positionnement prix Piu Piu** : **64,99 €**  
**Plateformes ciblées** : **Steam** (lancement) **+ portage PlayStation**.

![Dashboard – Pricing](lookerstudio/screenshot-pricing.png)

## 🧩 Contenu
- Indices de contenu (proportions) :  
  **Sang 0,28** (≈ **28 %**) · **Violence 0,27** (≈ **27 %**) ·  
  **Alcool ~0,05** · **Sexe ~0,05** · **Drogue ~0,05** · **Humour ~0,05** (≈ **5 %** chacun).  
Ces valeurs servent à **anticiper la classification** (PEGI/ESRB) et la **cible marketing**.

![Dashboard – Contenu](lookerstudio/screenshot-contenu.png)

## 🧠 Synthèse “sweet spot” (décisions)
- **Plateformes** : **Steam** pour l’accès/itération + **portage PlayStation** pour capter la base premium (différentiel prix).  
- **Genres** : **Aventure/RPG/Shooter** (Aventure le plus référencé ; RPG = pricing plus élevé ; Shooter le plus apprécié).  
- **Mode** : **Multijoueur** prioritaire (57,1 % des titres ; 67,2 % du CA dans l’échantillon).  
- **Localisation** : cibler **Europe** (RU/DE/RU/ES/FR) & **Amérique** (US/CA/BR/AR) ; **6 langues** (DE, RU, ES, FR, EN, PT).  
- **Prix** : **64,99 €**


## 📊 KPI de suivi (dans le dashboard)
- Répartition **Multi vs Solo** (titres & CA) – top 30 visé.  
- **Prix moyens** par **plateforme/genre/région**.  
- **Panier moyen** par joueur (genre, région).  
- **CA moyen** par jeu (genre).  
- Volumes **sorties par plateforme** & **par genre** (1993–2023).  
- Indicateurs **localisation** (répartition région/pays).


## 🗂️ Structure du repo (suggestion)
