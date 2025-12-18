# marketcap-telecom-scraping

Script Python pour récupérer la capitalisation boursière des plus grandes entreprises de télécommunications depuis CompaniesMarketCap et générer un fichier Excel (.xlsx).

## Installation rapide

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Utilisation

```bash
python telecom_marketcap_scraper.py --output telecom_market_caps_eur_billion.xlsx
```

Options disponibles :

- `--max-pages` : nombre maximal de pages à parcourir (par défaut 20).
- `--timeout` : délai d'expiration HTTP en secondes (par défaut 30).
- `--output` : chemin du fichier Excel (.xlsx) de sortie.

Chaque exécution crée un classeur Excel contenant :

- une ligne d'entête `rang, nom, market_cap_(Mds_EUR), pays` ;
- une ligne indiquant l'horodatage de collecte en heure de Paris ;
- une ligne par entreprise, triée par rang.

## Planification avec cron

Pour lancer le script chaque heure :

```bash
0 * * * * /usr/bin/env bash -lc 'cd /chemin/vers/marketcap-telecom-scraping && source .venv/bin/activate && python telecom_marketcap_scraper.py --output data/telecom_market_caps.xlsx'
```

Adaptez le chemin d'installation de Python/venv si nécessaire.
