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
- [ ] Project scaffolding opzetten. De tech-stack is nog niet definitief
  gekozen door de gebruiker; kies voorlopig Node.js + TypeScript als basis
  (package.json, tsconfig, een simpele `src/`-structuur, een testrunner zoals
  vitest, en een lint/build script). Leg de keuze en het "waarom" kort vast in
  README.md, zodat dit tijdens het eerste vrijdag-overleg makkelijk herzien
  kan worden.

## In review
_(taken met een open pull request, wachtend op goedkeuring tijdens het
vrijdagoverleg om 18:00)_

## Klaar
_(taken met een gemergede pull request)_
