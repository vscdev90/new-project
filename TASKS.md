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
agents bouwen en testen de logica op CLI-niveau. 5 taken, 1 per dag,
maandag t/m vrijdag.

- [ ] 2. Content-model + dataset. Definieer een datamodel voor een
  "mindset-principe" (titel, korte omschrijving, categorie, uitgebreide
  tekst/tips). Maak een lokale dataset met circa 20-30 principes verdeeld
  over meerdere categorieën (bv. discipline, geld, groei-mindset,
  veerkracht, netwerken). Unit tests voor het laden/parsen van de data.
- [ ] 3. Overzicht- en detailscherm. Bouw een homescreen met de principes
  gegroepeerd per categorie, en een detailscherm dat een principe volledig
  toont. Navigatie ertussen werkend, met widget tests voor beide schermen.
- [ ] 4. Zoeken + favorieten. Voeg een zoekfunctie toe (op titel/categorie)
  en de mogelijkheid om principes te markeren als favoriet, lokaal
  opgeslagen (bv. met shared_preferences). Voeg een "tip van de dag"-widget
  toe op het homescreen die een willekeurig/dagelijks principe uitlicht.
- [ ] 5. Afwerking. Stel een duidelijk visueel thema in (kleuren, typografie,
  licht/donker-modus), zorg voor nette responsive/toegankelijke styling
  (leesbare tekstgroottes), en schrijf in README.md een korte gebruiks- en
  buildhandleiding (inclusief hoe de app lokaal op een emulator/toestel te
  draaien).

## In review
_(taken met een open pull request, wachtend op goedkeuring tijdens het
vrijdagoverleg om 18:00)_

- [x] 1. Scaffolding. Zet een Flutter-project op (pubspec.yaml,
  `lib/`-structuur, flutter_test als testrunner, lint-config). Basis
  navigatie-shell en een lege homepage. **→ PR #2**
  (https://github.com/vscdev90/new-project/pull/2)

## Klaar
_(taken met een gemergede pull request)_
