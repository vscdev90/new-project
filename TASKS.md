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

Project: **The Millionaire Mindset** — een informatieve Android-app met
principes/inzichten over de mindset die nodig is om succesvol te worden
(discipline, financiële geletterdheid, groei-mindset, veerkracht, etc.).
Geen backend, geen accounts — puur lokale content. Stack: Flutter, omdat
`flutter test` unit-/widget-tests kan draaien zonder Android SDK/emulator
(die in de automatische pipeline niet beschikbaar zijn). Een APK bouwen en op
een echt toestel/emulator testen doe je zelf lokaal in Android Studio; de
agents bouwen en testen de logica op CLI-niveau.

Alle 5 geplande taken zijn nu gebouwd (zie hieronder). Nieuwe taken kunnen
hier worden toegevoegd.

## In review
_(taken met een open pull request, wachtend op goedkeuring tijdens het
vrijdagoverleg om 18:00)_

- [x] 2. Content-model + dataset. Datamodel voor een "mindset-principe"
  (titel, korte omschrijving, categorie, tips) + lokale dataset met 25
  principes over 5 categorieën. **→ PR #3**
  (https://github.com/vscdev90/new-project/pull/3)
- [x] 3. Overzicht- en detailscherm. Homescreen met principes gegroepeerd
  per categorie + detailscherm, navigatie en widget tests.
  **→ PR #4 (bouwt op PR #3, eerst #3 mergen dan #4)**
  (https://github.com/vscdev90/new-project/pull/4)
- [x] 4. Zoeken + favorieten. Zoekfunctie (titel/categorie), favorieten via
  shared_preferences, "tip van de dag"-widget.
  **→ PR #5 (bouwt op PR #4, mergevolgorde #2→#3→#4→#5)**
  (https://github.com/vscdev90/new-project/pull/5)
- [x] 5. Afwerking. Licht/donker thema, responsive max-width layout,
  uitgebreide README (functionaliteit + run/test/build-instructies).
  **→ PR #6 (bouwt op PR #5, mergevolgorde #2→#3→#4→#5→#6)**
  (https://github.com/vscdev90/new-project/pull/6)

## Klaar
_(taken met een gemergede pull request)_

- [x] 1. Scaffolding. Zet een Flutter-project op (pubspec.yaml,
  `lib/`-structuur, flutter_test als testrunner, lint-config). Basis
  navigatie-shell en een lege homepage. **→ PR #2 (gemerged)**
  (https://github.com/vscdev90/new-project/pull/2)
