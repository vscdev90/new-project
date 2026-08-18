# The Millionaire Mindset

Informatieve Android-app met principes/inzichten over de mindset die nodig is
om succesvol te worden. Geen backend, geen accounts — puur lokale content.

## Stack

Gekozen voor **Flutter**, omdat `flutter test` unit-/widget-tests kan draaien
zonder een Android-emulator — handig voor een geautomatiseerde pipeline die
geen emulator ter beschikking heeft. Een APK bouwen en op een echt
toestel/emulator testen doe je zelf lokaal in Android Studio.

## Testen in deze omgeving

**Let op:** de Flutter SDK is niet geïnstalleerd in de omgeving waarin de
geautomatiseerde developer-/review-/test-agents draaien. Daardoor kon
`flutter pub get` en `flutter test` niet daadwerkelijk uitgevoerd worden bij
het opzetten van deze scaffolding — de projectbestanden zijn met de hand
opgezet volgens de standaard Flutter-projectstructuur. Om de teststap in de
pipeline echt te laten werken, moet de Flutter SDK alsnog in de omgeving
geïnstalleerd worden (bv. via een sessie-opstartscript).

## Lokaal draaien

```
flutter pub get
flutter run
flutter test
```
