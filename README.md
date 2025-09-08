# Piu Piu project — Data Analysis

**Objectif business.** Analyser le marché du jeu vidéo pour identifier le **sweet spot** (plateforme - genre - localisation - monétisation) et bâtir un **argumentaire investisseurs** pour un prochain jeu à fort potentiel.

**Impact (résultats – résumé).**
- **Tendance plateformes**
- **Genres & géos gagnants**
- **Monétisation & CA prévisionnel**

**Livrables.** Dashboard (Looker Studio), SQL/Python, étude de cas.

## 🔗 Liens
- **Dashboard (intégration)** : https://lookerstudio.google.com/embed/reporting/64f4f0d0-0df3-46b7-8be9-b57a98db3213/page/p_x405yj6vvd  
- **Étude de cas** : https://excalidraw.com/#room=064026c203014082aa65,D4wDchTG9POdLB-n3bjlAw  
- **Portfolio** : https://samyomb.github.io

## ⚙️ Stack
SQL • Python (pandas) • Looker Studio • Git

## 🧪 Données
- **Sources (1977–2023)**  
  - Profils joueurs (multi-plateformes) — Kaggle : https://www.kaggle.com/datasets/artyomkruglov/gaming-profiles-2025-steam-playstation-xbox 
  - Consoles les plus vendues — Kaggle : https://www.kaggle.com/datasets/tayyarhussain/best-selling-game-consoles-of-all-time  
  - Autres métriques jeux — Zenodo : https://zenodo.org/records/10797761  
- **Qualité & préparation** : nettoyage (`NA`, doublons), normalisation des **genres**, **pays/régions** et **dates**, jointures.

## 🧭 Méthode
- **Préparation** : jointures, agrégations, champs calculés 
- **Viz & design** :  
  - 1) *Overview* (tendance plateformes — bar chart)  
  - 2) *Genres × Régions* (Line chart & heatmap) (filtres & drill-down)  
  - 3) *Monétisation* (prix moyen par joueur, genre & région + CA prévisionnel)  

## 📈 Résultats (détail)
- **R1 — Compétition des plateformes (1977–2023)**  
  - *Mesures* : **ventes de jeux** par année, **ventes de consoles** par année, **télechargement de jeu mobile**.  
  - *Constat* : Mobile en forte croissance; Guerre des consoles; .  
  - *Évidence* : Graphique “Overview → Platform share (stacked)”.

- **R2 — Genres & zones prioritaires**  
  - *Mesures* : **croissance YoY**, **taux de rétention** (si dispo), **panier moyen** par **genre × région**.  
  - *Constat* : <ex. Action/RPG surperforme en APAC ; Casual en NA>.  
  - *Action* : cibler **genre G** en **région R** pour le Go-To-Market.

- **R3 — Monétisation & panier moyen**  
  - *Mesures* : **ARPU**, **ARPPU**, **AOV** par **genre / pays / région**.  
  - *Constat* : <ex. ARPPU du genre G en région R = **Z€**, +XX % vs global>.  
  - *Action* : modèle **F2P + IAP** ou **premium** selon différentiel ARPPU.

- **R4 — CA prévisionnel**  
  - *Méthode* : **TAM → SAM → SOM** (bottom-up)  
    1) TAM = joueurs potentiels du segment (source marché)  
    2) SAM = sous-ensemble atteignable (plateforme + région)  
    3) SOM = parts réalistes (conversion prévue × rétention)  
  - *Résultat* : Scénario **bas / médian / haut** : **ZZZ / ZZZ / ZZZ k€**.  
  - *Hypothèses* : taux conversion X %, ARPPU Y €, coût UA Z €.

## 🔎 Limites
- Possibles **biais d’échantillonnage** (sources hétérogènes), classes de **genres** non uniformes.  
- Forecast sensible aux **hypothèses UA/monétisation**.

## 🗂️ Structure
