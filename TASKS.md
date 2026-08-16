# Taken

Dit bestand is de takenlijst voor de geautomatiseerde developer-workflow van dit
project. Zie `WORKFLOW.md` voor hoe de agents dit bestand gebruiken.

Formaat: elke taak is een regel onder een van onderstaande secties.

- Voeg nieuwe taken toe onder **Open** (bovenaan = hoogste prioriteit).
- De dagelijkse developer-agent pakt de bovenste taak onder **Open**, bouwt,
  reviewt en test 'm, en verplaatst 'm naar **In review** zodra de bijbehorende
  pull request open staat.
- Tijdens het wekelijkse overleg (vrijdag 18:00) worden openstaande PR's
  besproken en, na jouw goedkeuring, gemerged. Gemergede taken verhuizen dan
  naar **Klaar**.

## Open

Project: **portefeuille-rebalance-app** — een tool waarmee de gebruiker zijn
beleggingsportefeuille (handmatig ingevoerde holdings, geen koppeling met
brokers/accounts) kan invoeren en laten rebalancen naar een doelallocatie.
Onderstaande 5 taken bouwen dit stap voor stap op (1 taak per dag,
maandag t/m vrijdag).

- [ ] 1. Scaffolding + datamodel. Zet een Next.js + TypeScript project op
  (package.json, tsconfig, `src/`-structuur, vitest als testrunner, lint/build
  script). Definieer het datamodel voor een "Holding" (naam, huidige waarde,
  doelpercentage). Leg de gekozen stack kort vast in README.md.
- [ ] 2. Portfolio-invoer UI. Bouw een formulier/overzicht waarmee de
  gebruiker holdings kan toevoegen, bewerken en verwijderen (naam, huidige
  waarde, doel-allocatie %). Sla de portefeuille lokaal op (bv. localStorage).
  Valideer dat de doelpercentages samen 100% vormen, met duidelijke
  foutmelding als dat niet klopt.
- [ ] 3. Rebalance-berekening (kernlogica). Implementeer de rekenlogica:
  totale portefeuillewaarde, huidige allocatie % per holding, en het bedrag
  dat gekocht/verkocht moet worden per holding om de doelallocatie te
  bereiken. Schrijf unit tests, inclusief edge cases (waarde 0, afronding,
  percentages die niet optellen tot 100%).
- [ ] 4. Resultaten-overzicht + visualisatie. Toon de rebalance-uitkomst in
  een tabel (huidig % vs doel % vs koop/verkoop-bedrag) en voeg een simpele
  taart- of staafdiagram-visualisatie toe van huidige vs. doelallocatie.
- [ ] 5. Afwerking. Voeg export/import van de portefeuille toe (JSON of CSV),
  verbeter foutafhandeling en responsive styling, en schrijf een korte
  gebruiksuitleg in README.md.

## In review
_(taken met een open pull request, wachtend op goedkeuring tijdens het
vrijdagoverleg om 18:00)_

## Klaar
_(taken met een gemergede pull request)_
