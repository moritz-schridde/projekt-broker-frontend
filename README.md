# Trade Empire Frontend

Dieses Repository dient als Ablage für das Frontend des Projekts "Trade Empire" der Vorlesung "Projekt" an der DHBW Mannheim. Das Frontend wurde mit Flutter entwickelt.

## Entwickler:

- Philip Herold
- Nicklas Platz
- Michael Kaiser
- Levana Fallböhmer
- Christian Leingang
- Osama Aldyab
- Nikolay Vasilev
- Mert Beri

## Aufbau des Frontends:

Der Flutter-Quellcode befindet sich im Ordner "lib/".
Darin befinden sich die Unterordner "constants/frontend", "converter", "models", "provider", "screens", "services" und "widgets".

- "constants/frontend" beinhaltet konstante Werte, wie beispielsweise Farbwerte des UI-Themes.
- "converter" beinhaltet Model-Json-Umwandlung Klassen für spezielle Objekte.
- "models" enthält die Klassen, die die Strukturen verschiedener Objekte festlegt.
- "provider" beinhaltet die globalen State-Management-Klassen.
- "screens" enthält die verschiedenen Seiten der Flutter-App.
- "services" beinhaltet verschiedene Services, welche die Anbindung an Firebase und das Backend ermöglichen
- "widgets" beinhaltet alle globalen Widgets, die auf mehreren verschiedenen Seiten verwendet werden.

Und die Hauptseiten der Flutter-App sind:

- "main.dart" ist der Einstiegspunkt der Flutter-App.
- "root.dart" registriert und erstellt alle Provider, die zur Verwaltung des State-Managements der Flutter-App benötigt werden.
- "app.dart" enthält die Hauptklasse der Flutter-App. Hier wird u.a. überprüft ob ein ein Nutzer angemeldet ist und ob entsprechend der Login-Prozess oder die Hauptseite anzeigt wird.
- "app_router.dart" dient dazu, dass die Seiten der Flutter-App mit den richtigen URLs angeschlossen werden.
- In der Konfigurationsdatei "pubspec.yaml" werden die Bibliotheken und Assets, die im Frontend verwendet werden, angegeben.
- "firebase_options.dart" enthält die Firebase-Konfigurationen, die für die Anbindung an Firebase benötigt werden.

Der "Screens"-Ordner ist dabei in noch weitere Unterordner untergliedert. Diese folgen alle dem gleichen Grundaufbau und spiegeln die einzelnen Seiten in der App wieder. Jeder Ordner besteht aus der Hauptseite (benannt: "_seitenname_\_screen.dart"), sowie einem Widget-Ordner. Dieser enthält weiter Widgets und Provider, welche nur auf diesem Screen genutzt werden.

Weitere plattformspezifische Konfigurationsdateien für android/ios/web werden in den entsprechenden Ordnern "android/", "ios/" und "web/" abgelegt.*

Das lokale node.js Backend wird in dem Ordner "mock_backend/" gespeichert. Dieses verwendet einen express Webserver, welcher Endpunkte für die Flutter App bereitstellt. Die Daten werden in Memory gespeichert.


## Architektur
![Broker Architecture](https://user-images.githubusercontent.com/40596710/175899938-16f0bff4-b74d-465f-a436-cc49ce5d61ba.jpg)

Die Flutter-App wird zunächst über das Firebase Hosting der Google Cloud Platform lokal beim Client heruntergeladen. Danach authentifiziert sich der Nutzer über das Firebase Authentication-Verfahren und kann die App nutzen. Dabei erhält der Nutzer einen einzigartigen und individuellen bearer Token.
Die App kommuniziert mit dem Backend über bereitgestellte API-Points. Der Nutzer wird im Backend anhand des bearer Tokens, welcher bei jedem http Request im Header mitgesendet wird, identifiziert. Diese Authentifizierung erfolgt mittels OAuth2 und OpenID Connect.
