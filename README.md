# The Millionaire Mindset

Informatieve Android-app met principes/inzichten over de mindset die nodig is
om succesvol te worden. Geen backend, geen accounts — puur lokale content.

## Functionaliteit

- **Overzicht**: 25 mindset-principes, gegroepeerd per categorie (discipline,
  geld, groei-mindset, veerkracht, netwerken).
- **Detail**: tik op een principe voor de volledige omschrijving en concrete
  tips.
- **Zoeken**: filter principes op titel of categorie via het zoekveld
  bovenaan.
- **Favorieten**: markeer principes met het hart-icoon; favorieten worden
  lokaal opgeslagen (blijven bewaard tussen app-starts).
- **Tip van de dag**: een uitgelicht principe dat per kalenderdag wisselt.
- **Licht/donker thema**: volgt automatisch de systeeminstelling van het
  toestel.

## Stack

Gekozen voor **Flutter**, omdat `flutter test` unit-/widget-tests kan draaien
zonder een Android-emulator — handig voor een geautomatiseerde pipeline die
geen emulator ter beschikking heeft. Een APK bouwen en op een echt
toestel/emulator testen doe je zelf lokaal in Android Studio.

## Testen in deze omgeving

**Let op:** de Flutter SDK is niet geïnstalleerd in de omgeving waarin de
geautomatiseerde developer-/review-/test-agents draaien. Daardoor konden
`flutter pub get` en `flutter test` niet daadwerkelijk uitgevoerd worden bij
het bouwen van deze app — alle bestanden zijn met de hand geschreven volgens
de standaard Flutter-conventies en door een aparte review-subagent
gecontroleerd. Om de teststap in de pipeline echt te laten werken, moet de
Flutter SDK alsnog in de omgeving geïnstalleerd worden (bv. via een
sessie-opstartscript).

## Lokaal draaien

Vereist: de [Flutter SDK](https://docs.flutter.dev/get-started/install) en
óf een Android-emulator (via Android Studio) óf een aangesloten
Android-toestel met USB-debugging aan.

```
flutter pub get
flutter run
```

Tests draaien (unit- + widget tests, geen emulator nodig):

```
flutter test
```

Een installeerbare APK bouwen:

```
flutter build apk
```

De APK staat daarna in `build/app/outputs/flutter-apk/app-release.apk` en kan
handmatig op een toestel geïnstalleerd worden, of via
`flutter install` naar een verbonden/emulator-toestel gestuurd worden.
