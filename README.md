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

- "constants/frontend" beinhaltet allgemeine Vorgaben, wie beispielsweise das UI-Theme.
- "converter" beinhaltet eine Datei zum Identifizieren der gewünschten Icons.
- "models" enthält die Klassen, die die Strukturen verschiedener Objekte festlegt.
- "provider" beinhaltet die State-Management-Klassen.
- "screens" enthält die verschiedenen Seiten der Flutter-App.
- "services" beinhaltet verschiedene Services, die die Anbindung an Firebase und das Backend ermöglichen
- "widgets" beinhaltet alle Widgets, die auf mehreren verschiedenen Seiten verwendet werden.

Und die Hauptseiten der Flutter-App sind:

- "app.dart" enthält die Hauptklasse der Flutter-App, worin u.a. festgelegt wird, ob die App den Login-Prozess oder die Hauptseite für angemeldete Nutzer anzeigt.
- "app_router.dart" dient dazu, dass die Seiten der Flutter-App mit den richtigen URLs angeschlossen werden.
- "firebase_options.dart" enthält die Firebase-Optionen, die für die Anbindung an Firebase benötigt werden.
- "main.dart" ist der Einstiegspunkt der Flutter-App.
- "root.dart" enthält alle Provider, die zur Verwaltung des State-Managements der Flutter-App benötigt werden.

Der "Screens"-Ordner ist dabei in noch weitere Unterordner untergliedert. Diese folgen alle dem gleichen Grundaufbau und spiegeln die einzelnen Seiten in der App wieder. Jeder Ordner besteht aus der Hauptseite (benannt: "_seitenname_\_screen.dart"), sowie einem Widget-Ordner. Dieser enthält weiter Widgets und Provider, welche nur auf diesem Screen genutzt werden.

Die generierten Dateien für android/ios/web werden in den entsprechenden Ordnern "android/", "ios/" und "web/" abgelegt.

Das Mock-Backend wird in dem Ordner "mock_backend/" gespeichert.

In der Datei "pubspec.yaml" werden die Bibliotheken, die im Frontend verwendet werden, angegeben.

## Architektur
![Broker Architecture](https://user-images.githubusercontent.com/40596710/175899938-16f0bff4-b74d-465f-a436-cc49ce5d61ba.jpg)

Die Flutter-App wird zunächst über das Firebase Hosting der Google Cloud Platform lokal beim Client heruntergeladen. Danach authentifiziert sich der Nutzer über das Firebase Authentication-Verfahren und kann die App nutzen.
Die App kommuniziert mit dem Backend über bereitgestellte API-Points.
