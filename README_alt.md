# Minecraft-Softwarearchitektur
Gruppenarbeit Wirtschaftsinformatiker

# Architektur-Dokumentation

## 1. Einführung und Ziele

### Beschreibung der Anwendung
Minecraft ist eine Open-World-Sandbox-Anwendung, in der Benutzer eine virtuelle Welt aus Blöcken erkunden, gestalten und verändern können.
Das System kombiniert Elemente von Simulation, Kreativität, Überleben und Mehrspieler-Interaktion.
Minecraft ist in Java (für die Java Edition) bzw. in C++ (für die Bedrock Edition) entwickelt und läuft plattformübergreifend auf Windows, macOS, Linux, Konsolen und Mobilgeräten.

### Zweck
Ziel der Anwendung ist es, den Benutzerinnen und Benutzern eine interaktive, offene Umgebung zu bieten, in der sie eigene Welten erschaffen, Ressourcen sammeln, Gegenstände herstellen und gemeinsam mit anderen Spielern interagieren können.
Minecraft fördert damit Kreativität, Problemlösung und Zusammenarbeit.

### Zielgruppe
- Privatnutzer und Spieler jeder Altersgruppe
- Lehrpersonen und Schulen, die Minecraft im Unterricht zur Förderung von Teamarbeit, Logik und räumlichem Denken einsetzen
- Entwicklerinnen und Entwickler, die durch Modding-APIs eigene Erweiterungen oder Server-Plugins implementieren

### Hauptnutzen
- Kreative Freiheit: Nutzer gestalten Landschaften, Gebäude und Systeme nach eigenen Ideen.
- Technische Erweiterbarkeit: Offene Schnittstellen ermöglichen Modifikationen, Plugins und eigene Server.
- Soziale Interaktion: Multiplayer-Server fördern gemeinsames Spielen und kollaborative Projekte.
- Lernpotenzial: Minecraft Education Edition unterstützt den Einsatz im Unterricht.

## 2. Randbedingungen

### Technische Randbedingungen
- Programmiersprachen:
  - Java für die Minecraft Java Edition (Desktop)
  - C++ für die Minecraft Bedrock Edition (Cross-Platform)
- Architektur:
  Client-Server-Modell mit persistenter Welt. Der Client visualisiert die Spielwelt, während der Server die Spielregeln, Physik und Interaktionen zentral verwaltet.
- Datenhaltung:
  Welt- und Spielerdaten werden in Chunks (16×16 Block-Segmente) gespeichert, üblicherweise als NBT-Dateien (Named Binary Tag).
- Plattformen:
  Windows, macOS, Linux, iOS, Android, Xbox, PlayStation, Nintendo Switch.
- Netzwerk:
  Kommunikation über TCP/IP. Multiplayer-Server können öffentlich oder privat gehostet werden.
- APIs / Modding:
  Zugriff über Minecraft Forge, Fabric oder Bedrock Add-ons, um neue Spielmechaniken oder Objekte hinzuzufügen.

### Organisatorische Randbedingungen
- Entwicklung durch Mojang Studios (gehört zu Microsoft).
- Versionsverwaltung und Updates werden zentral über Minecraft Launcher bzw. Microsoft Store / Xbox Services verteilt.
- Community-getriebene Erweiterungen (Mods, Texture Packs, Server) sind essenzieller Bestandteil der Weiterentwicklung.
- Lizenzmodell: Proprietäre Software mit optionalen Community-Inhalten unter eigenen Nutzungsbedingungen.

### Rechtliche Randbedingungen
- Urheberrechtlich geschützt (Copyright © Mojang Studios / Microsoft).
- Nutzung nur gemäß Endbenutzer-Lizenzvertrag (EULA).
- Server dürfen betrieben werden, solange sie die Minecraft Server Guidelines einhalten (kein Pay-to-Win, keine unerlaubte Markenverwendung).

## 3. Kontextabgrenzung
### Ziel des Kontextdiagramms
Das Kontextdiagramm zeigt die äußeren Akteure, Systeme und Schnittstellen, die mit Minecraft interagieren.
Es dient dazu, die Abgrenzung zwischen dem System (Minecraft selbst) und der Umgebung (Nutzer, Plattformen, externe Dienste) klar darzustellen.

### Beschreibung des Systemkontexts
#### Systemgrenze
Das betrachtete System ist die Minecraft-Anwendung (Client und Server).
Innerhalb dieser Grenze liegen:
- Spiellogik
- Weltgenerierung und Rendering
- Kommunikationsschnittstellen zwischen Client und Server
- Persistente Datenspeicherung (Welt- und Spielerdaten)
Außerhalb der Grenze befinden sich alle externen Akteure und Systeme, die mit Minecraft interagieren.
---
#### Externe Akteure und Systeme
| Akteur / System                                  | Beschreibung                                                                     | Interaktion mit Minecraft                                                                         |
| ------------------------------------------------ | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| **Spieler (Client)**                             | Endbenutzer, die Minecraft auf PC, Konsole oder Mobilgerät spielen.              | Interagieren mit der Spielwelt über Tastatur, Maus oder Controller; senden Befehle an den Server. |
| **Multiplayer-Server**                           | Server, auf dem die Spielwelt und Spielregeln zentral laufen.                    | Empfängt Spieleraktionen, synchronisiert Zustände und verwaltet Spielregeln.                      |
| **Minecraft Launcher / Plattform**               | Offizielle Distributionsplattform für das Spiel (Login, Updates, Lizenzprüfung). | Startet die Anwendung, prüft Benutzeridentität und lädt Updates.                                  |
| **Microsoft Account / Xbox Live Services**       | Authentifizierungs- und Cloud-Dienst.                                            | Ermöglicht Login, Freundeslisten, Multiplayer- und Marketplace-Funktionen.                        |
| **Modding-Plattformen (Forge, Fabric, Add-ons)** | Frameworks und Tools für die Community-Erweiterungen.                            | Stellen Schnittstellen bereit, um Spielinhalte und Logik zu verändern.                            |
| **Ressourcenserver / Marketplace**               | Offizielle Quelle für Skins, Welten, Add-ons.                                    | Download und Lizenzprüfung von Inhalten.                                                          |
| **Bildungsplattform (Minecraft Education)**      | Variante für Schulen und Unterricht.                                             | Interagiert mit Lernplattformen und Lehrerkonten.                                                 |

---
#### Kontextdiagramm der Anwendung

![Kontextdiagramm](diagrams/kontext.png)

---

#### Beschreibung der Umgebung

Minecraft befindet sich in einem ökosystemartigen Umfeld aus Clients, Servern und Community-Plattformen.  
Die wesentlichen Kommunikationsflüsse sind:

1. Spieler ↔ Server: Aktionen und Ereignisse werden in Echtzeit über TCP/IP synchronisiert.

2. Client ↔ Launcher: Authentifizierung, Versionsverwaltung, Startparameter.

3. Server ↔ Datenhaltung: Speicherung der Welt (Chunks, Spielerinventar, Fortschritt).

4. Server ↔ Modding-Schnittstellen: Integration von Community-Erweiterungen.

5. Client ↔ Microsoft Services: Online-Login, Multiplayer, Cloud-Speicherung, Marketplace-Zugriff.


#### Visuelle Struktur (für späteres Diagramm)  
Wenn ihr das Diagramm erstellt, sollte es ungefähr so aufgebaut sein:

```text
      +-------------------------+ 
      | Microsoft/Xbox Services |
      +-----------+-------------+
                  |
                  v
     +---------------------------------+
     |       Minecraft Launcher        |
     +---------------------------------+
                  |
                  v
   +--------------------------------------+
   |           Minecraft Client           |
   +--------------------------------------+
          |                    |
          | Multiplayer (TCP/IP)|
          v                    v
   +--------------------------------------+
   |          Minecraft Server            |
   +--------------------------------------+
          |                    |
          | Modding API        | Datenhaltung
          v                    v
   +-------------+     +-------------------+
   | Forge/Fabric|     | NBT Save Files    |
   +-------------+     +-------------------+

```






## 4. Lösungsstrategie
### Architekturgrundidee

Minecraft verfolgt eine Client-Server-Architektur, die es erlaubt, sowohl Einzelspieler- als auch Mehrspielersitzungen zu betreiben.  
Dabei gilt das Prinzip:
- Der Server bestimmt die Spielrealität, der Client visualisiert sie.

Diese klare Trennung ermöglicht:
- Multiplayer über Netzwerk (lokal oder online)
- Modulare Erweiterungen durch Plugins oder Mods
- Stabilen Betrieb, auch wenn einzelne Clients abstürzen

### Zentrale Architekturentscheidungen
| Bereich                    | Entscheidung                                                        | Begründung                                                                                                       |
| -------------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| **Architekturtyp**         | Client-Server-Modell                                                | Trennung von Spiellogik (Server) und Darstellung (Client) ermöglicht Multiplayer, Sicherheit und Skalierbarkeit. |
| **Programmiersprache**     | Java (Java Edition) / C++ (Bedrock Edition)                         | Plattformunabhängigkeit (Java) und Performance auf Konsolen (C++).                                               |
| **Rendering-Engine**       | Eigenentwicklung auf Basis von OpenGL (Java) bzw. DirectX (Bedrock) | Volle Kontrolle über Blockrendering, Beleuchtung und Partikeleffekte.                                            |
| **Persistenz**             | NBT-Dateiformat (Named Binary Tag)                                  | Effiziente, strukturierte Speicherung der Spielwelten (Chunks, Entities, Items).                                 |
| **Netzwerkprotokoll**      | TCP/IP mit eigenem Binärprotokoll                                   | Zuverlässige Übertragung von Spieleraktionen und Weltzuständen.                                                  |
| **Modding-Fähigkeit**      | Offene Schnittstellen (Forge, Fabric, Bedrock Add-ons)              | Förderung der Community-Entwicklung, Anpassbarkeit der Spielmechanik.                                            |
| **Plattformunterstützung** | Multi-Plattform über verschiedene Editionen                         | Breite Zielgruppe: PC, Konsole, Mobile, Education.                                                               |




### Entwurfsprinzipien
1. Trennung von Logik und Darstellung  
   Spiellogik läuft auf dem Server, Darstellung (3D-Welt, UI) im Client.
2. Ereignisgesteuertes System  
   Spielereignisse (Bewegung, Blockabbau, Crafting) lösen serverseitige Aktionen aus.
3. Chunk-basierte Weltstruktur  
   Die Welt ist in 16×16×256 Blöcke unterteilt, wodurch effizientes Laden und Speichern möglich ist.
4. Erweiterbarkeit durch Plugins und Mods  
   Kernsystem bietet stabile Schnittstellen, auf die Mods aufsetzen können.
5. Skalierbarkeit durch dedizierte Server  
   Server können für kleine Gruppen (LAN) oder große Communities (z. B. Hypixel) betrieben werden.

### Sicherheits- und Integritätsprinzipien
- Serverseitige Autorität: Der Server prüft alle Aktionen (z. B. keine unzulässigen Bewegungen oder Items).
- Sandbox-Isolation: Mods und Add-ons laufen in definierten Umgebungen, um Stabilität und Sicherheit zu gewährleisten.
- Authentifizierung: Spieleridentität wird über Microsoft/Xbox-Accounts verifiziert.

### Erweiterbarkeit und Anpassbarkeit
Minecraft ist von Beginn an so konzipiert, dass Community-Erweiterungen möglich sind:
- Neue Blöcke, Biome, Mobs oder Spielmechaniken
- Serverseitige Skripte (Command Blocks, Datapacks)
- Clientseitige Texturen, Shader und UI-Modifikationen  
Dadurch bleibt das System langfristig erweiterbar und anpassbar, ohne den Kern neu entwickeln zu müssen.

## 5. Bausteinsicht
### Ziel der Bausteinsicht
Die Bausteinsicht zeigt den inneren Aufbau der Anwendung Minecraft.
Sie beschreibt die wichtigsten Module, Komponenten und ihre Verantwortlichkeiten innerhalb der Systemgrenze.
Dadurch wird sichtbar, wie das System in logische Teile gegliedert ist und wie diese miteinander interagieren.

### Übersicht der Hauptkomponenten
Minecraft besteht aus fünf zentralen Bausteinen, die zusammen das Gesamtsystem bilden:  


| Komponente                   | Beschreibung                                               | Hauptverantwortung                                                                                                                                                                    |
| ---------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1. Client**                | Darstellung und Benutzerinteraktion                        | - Darstellung der 3D-Welt<br>- Eingabe von Tastatur, Maus, Controller<br>- Menüführung und Benutzeroberfläche<br>- Kommunikation mit dem Server über Netzwerkprotokolle               |
| **2. Server**                | Spiellogik und Weltverwaltung                              | - Verarbeitung von Spieleraktionen<br>- Synchronisierung der Weltzustände<br>- Verwaltung von Regeln, Physik und Entities<br>- Verwaltung von Spieler- und Weltzuständen              |
| **3. Datenhaltung**          | Speicherung und Verwaltung persistenter Spielinformationen | - Speicherung der Welt (Chunks)<br>- Speicherung von Spielständen, Inventaren und Konfigurationen<br>- Verwendung des NBT-Dateiformats<br>- Verwaltung von Backups und Ladeprozessen  |
| **4. Netzwerkkommunikation** | Verbindung zwischen Client und Server                      | - Realisiert das Client-Server-Protokoll<br>- Überträgt Zustände, Bewegungen und Ereignisse<br>- Gewährleistet Datenkonsistenz über TCP/IP<br>- Fehlererkennung und Paketwiederholung |
| **5. Modding-System / API**  | Erweiterbarkeit und Anpassbarkeit der Anwendung            | - Bereitstellung von Schnittstellen für Mods und Plugins<br>- Erlaubt server- und clientseitige Erweiterungen<br>- Unterstützt Frameworks wie Forge, Fabric oder Bedrock Add-ons      |


### Anwendungsfalldiagramm
![Anwendungsfalldiagramm](diagrams/anwendungsfaelle.png)


### Zusammenspiel der Komponenten
1. Client sendet Benutzereingaben (z. B. Bewegung, Aktionen) an den Server.
2. Server verarbeitet diese Ereignisse, prüft sie auf Gültigkeit und aktualisiert den Weltzustand.
3. Änderungen werden über die Netzwerkkommunikation an alle betroffenen Clients verteilt.
4. Der Client rendert die neue Weltansicht basierend auf den erhaltenen Daten.
5. Alle Spielzustände werden periodisch oder ereignisgesteuert in der Datenhaltung gespeichert.
6. Das Modding-System kann an jeder dieser Komponenten Erweiterungen einfügen (z. B. neue Blöcke, Spielmechaniken, UI-Elemente).


### Beispielhafte Struktur (für das spätere Diagramm)
```
+--------------------------------------------------------+
|                   Minecraft Anwendung                  |
|--------------------------------------------------------|
|  +---------------+   +---------------+   +------------+ |
|  |    Client     |<->|   Netzwerk    |<->|   Server   | |
|  +---------------+   +---------------+   +------------+ |
|          |                                   |          |
|          v                                   v          |
|  +---------------+                   +---------------+  |
|  |   Modding     |                   |  Datenhaltung |  |
|  +---------------+                   +---------------+  |
+--------------------------------------------------------+

```


## 6. Laufzeitsicht (optional)
(optional, falls ihr Abläufe zeigen wollt).

## 7. Verteilungssicht
### Ziel der Verteilungssicht  

Die Verteilungssicht zeigt, wo und wie die einzelnen Softwarekomponenten von Minecraft betrieben werden.  
Sie beschreibt die Hardware- bzw. Systemumgebung (Clients, Server, Plattformen, Netzwerke) sowie deren Kommunikationsbeziehungen.  
Damit wird ersichtlich, wie die logische Architektur auf reale Systeme abgebildet wird.  

### Übersicht der physischen Verteilung
| Systemkomponente                 | Beschreibung                                                    | Typische Umgebung                                             |
| -------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------- |
| **Client-Gerät**                 | Führt die Benutzeroberfläche und das Rendering der 3D-Welt aus. | PC, Notebook, Konsole oder Mobilgerät                         |
| **Server**                       | Verwaltet die Spielwelt, Spielregeln und Mehrspielersitzungen.  | Lokaler Rechner, dedizierter Server, Cloud (z. B. AWS, Azure) |
| **Microsoft/Xbox Services**      | Authentifizierung, Cloud-Speicher, Multiplayer-Verwaltung.      | Microsoft Cloud (zentrale Server)                             |
| **Modding-/Content-Plattformen** | Stellen Erweiterungen, Skins, Texturen und Mods bereit.         | Externe Web- oder Cloud-Server                                |
| **Datenhaltung**                 | Speicherung von Spielwelten, Benutzerinventaren, Logs.          | Lokal auf Serverlaufwerk oder Cloud-Speicher                  |


### Typische Verteilung einer Minecraft-Umgebung
1. Spielergerät (Client):  
- Läuft auf Windows, macOS, Linux oder mobilen Betriebssystemen.  
- Enthält Rendering-Engine, Eingabelogik, UI und Netzwerkmodul.  
- Kommuniziert über das Internet mit einem dedizierten Server.  

2. Server:  
- Hostet eine oder mehrere Welten.  
- Führt Spiellogik, Ereignisverwaltung und Weltupdates aus.  
- Speichert Welt- und Spielerinformationen (NBT-Dateien).  
- Stellt Netzwerkdienste über TCP-Port (Standard: 25565) bereit.  

3. Externe Dienste (Microsoft/Xbox, Marketplace, Mods):  
- Übernehmen Authentifizierung, Konto-Management und Download von Zusatzinhalten.  
- Laufen vollständig in der Microsoft-Cloud oder auf Community-Plattformen.  

4. Kommunikation:  
- Alle Verbindungen laufen über das Internet (TCP/IP).  
- Für Multiplayer wird eine direkte Client–Server-Verbindung hergestellt.  
- Authentifizierungsdaten werden über HTTPS an Microsoft/Xbox übertragen.  

### Beschreibung des (noch zu erstellenden) Verteilungsdiagramms
Das Verteilungsdiagramm sollte den Aufbau etwa so darstellen:
````
+---------------------------------------------------------------+
|                        Internet / Netzwerk                    |
|---------------------------------------------------------------|
|                                                               |
|   +-----------------+        TCP/IP        +----------------+ |
|   | Minecraft Client|<-------------------> | Minecraft Server| |
|   | (z.B. Laptop)   |                     | (z.B. Cloud VPS) | |
|   +-----------------+                     +----------------+ |
|           |                                          |        |
|           | HTTPS (Login)                            | I/O     |
|           v                                          v        |
|   +------------------+                     +----------------+ |
|   | Microsoft/Xbox   |                     |  Datenspeicher | |
|   |  Auth Services   |                     | (World Saves)  | |
|   +------------------+                     +----------------+ |
|                                                               |
+---------------------------------------------------------------+
````

### Variante der Verteilung
| Variante                      | Beschreibung                                                     | Beispiel                                         |
| ----------------------------- | ---------------------------------------------------------------- | ------------------------------------------------ |
| **Einzelspieler-Modus**       | Client und Server laufen auf demselben Gerät.                    | Spieler startet lokale Welt über „Singleplayer“. |
| **LAN-Server**                | Server läuft auf einem Rechner im lokalen Netzwerk.              | Schulnetzwerk oder gemeinsames WLAN-Spiel.       |
| **Dedizierter Online-Server** | Server läuft auf einem gehosteten System (z. B. Cloud-VPS).      | Öffentliche Server wie Hypixel oder Aternos.     |
| **Education Edition**         | Server und Clients sind über Schulnetzwerk oder Cloud verbunden. | Unterrichtsumgebung mit zentraler Verwaltung.    |


### Kommunikationsbeziehungen
- Client ↔ Server: Spielinteraktionen, Positions- und Weltupdates (TCP/IP).
- Client ↔ Microsoft/Xbox Services: Authentifizierung, Multiplayer-Sitzung, Freundesliste.
- Server ↔ Datenhaltung: Speicherung der Weltdateien, Backups, Logs.
- Server ↔ Modding-System: Zugriff auf Mod-Plugins, Event Hooks, Konfiguration.

### Verteilungsdiagramm
![Verteilungsdiagramm](diagrams/verteilung.png)



## 8. Qualitätsanforderungen  
### Ziel  
<br>
Die Qualitätsanforderungen beschreiben die wichtigsten Qualitätsziele, die das System Minecraft erfüllen muss.  
Sie dienen als Grundlage für Entwurfsentscheidungen und zukünftige Erweiterungen.  
Jede Anforderung wird mit einem Ziel, einer Begründung und einer Maßnahme beschrieben.  

---

1. Leistungsfähigkeit (Performance)

| Aspekt         | Beschreibung                                                                                                                                                                                                                                            |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ziel**       | Das System soll auch bei großen Welten und mehreren gleichzeitigen Spielern flüssig laufen.                                                                                                                                                             |
| **Begründung** | Eine stabile Bildrate (FPS) und geringe Latenz sind essenziell für ein immersives Spielerlebnis.                                                                                                                                                        |
| **Maßnahmen**  | - Chunk-basierte Weltstruktur zur dynamischen Ladeoptimierung.<br>- Multithreading für Rendering, Netzwerk und Physik.<br>- Nutzung von Level-of-Detail-Mechanismen und Caching.<br>- Serverseitige Optimierung von Tick-Rate und Ereignisverarbeitung. |

---

2. Zuverlässigkeit und Stabilität

| Aspekt         | Beschreibung                                                                                                                                                                                                                                  |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ziel**       | Minecraft soll dauerhaft stabil laufen und Spielstände zuverlässig speichern, auch bei unerwarteten Unterbrechungen.                                                                                                                          |
| **Begründung** | Datenverlust oder Systemabstürze würden das Spielerlebnis stark beeinträchtigen.                                                                                                                                                              |
| **Maßnahmen**  | - Automatische Zwischenspeicherung von Welt- und Inventardaten (Autosave).<br>- Wiederherstellung beim Neustart (Crash Recovery).<br>- Getrennte Thread-Verwaltung für kritische Prozesse.<br>- Regelmäßige Backup-Funktion im Serverbetrieb. |

---

3. Erweiterbarkeit und Modifizierbarkeit

| Aspekt         | Beschreibung                                                                                                                                                                                                                           |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ziel**       | Das System soll flexibel erweiterbar sein, ohne den Kerncode verändern zu müssen.                                                                                                                                                      |
| **Begründung** | Minecraft lebt von einer aktiven Modding-Community, die neue Inhalte und Spielmechaniken entwickelt.                                                                                                                                   |
| **Maßnahmen**  | - Bereitstellung stabiler APIs (Forge, Fabric, Add-ons).<br>- Ereignisbasierte Architektur mit klar definierten Hooks.<br>- Modularer Aufbau von Client und Server.<br>- Unterstützung von Konfigurationsdateien für Mods und Plugins. |

---

4. Plattformunabhängigkeit (optional, aber erwähnenswert)

| Aspekt         | Beschreibung                                                                                                                                                                     |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ziel**       | Minecraft soll auf verschiedenen Plattformen (PC, Konsole, Mobile, Cloud) laufen.                                                                                                |
| **Begründung** | Eine breite Nutzerbasis und flexible Nutzung erfordern plattformübergreifende Unterstützung.                                                                                     |
| **Maßnahmen**  | - Entwicklung separater Editionen (Java / Bedrock).<br>- Nutzung plattformabhängiger APIs (OpenGL, DirectX, Metal).<br>- Synchronisierung zentraler Daten über Microsoft-Konten. |

---

5. Benutzerfreundlichkeit (optional, falls ihr ein viertes Hauptziel möchtet)

| Aspekt         | Beschreibung                                                                                                                                           |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Ziel**       | Die Steuerung und das Interface sollen für alle Altersgruppen intuitiv verständlich sein.                                                              |
| **Begründung** | Minecraft richtet sich an Spieler jeden Alters, einschließlich Kinder und Lernumgebungen.                                                              |
| **Maßnahmen**  | - Einheitliches UI-Design über alle Plattformen.<br>- Einfache Steuerung mit Standardtasten und Symbolen.<br>- Kontextbezogene Tooltips und Tutorials. |



## 9. Anhänge
Links, Quellen, GitHub-Workflows.

---

© 2025 – Gruppenarbeit Architektur Minecraft  
Autorengruppe: *Fabian, Teo, Eldin, Thomas*  
Schule: *Feusi Bildungszentrum*  
Dozent: *Björn Michels*  
Abgabedatum: 16.11.2025  
Präsentation: 19.11.2025
