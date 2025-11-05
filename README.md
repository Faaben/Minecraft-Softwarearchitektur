# Minecarft-Softwarearchitektur
Gruppenarbeit Wirtschaftsinformatiker

# Architektur-Dokumentation (nach arc42)

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
Akteur / System  
Spieler Client)
  - Beschreibung: Endbenutzer, die Minecraft auf PC, Konsole oder Mobilgerät spielen.
  - Interaktion mit Minecraft: Interagieren mit der Spielwelt über Tastatur, Maus oder Controller; senden Befehle an den Server.

Multiplayer-Server
  - Beschreibung: Server, auf dem die Spielwelt und Spielregeln zentral laufen.
  - Interaktion mit Minecraft: Empfängt Spieleraktionen, synchronisiert Zustände und verwaltet Spielregeln.

Minecraft Launcher / Plattform
  - Beschreibung: Offizielle Distributionsplattform für das Spiel (Login, Updates, Lizenzprüfung).
  - Interaktion mit Minecraft: Startet die Anwendung, prüft Benutzeridentität und lädt Updates.

Microsoft Account / Xbox Live Services
  - Beschreibung: Authentifizierungs- und Cloud-Dienst.
  - Interaktion mit Minecraft: Ermöglicht Login, Freundeslisten, Multiplayer- und Marketplace-Funktionen.

Modding-Plattformen (Forge, Fabric, Add-ons)
  - Beschreibung: Frameworks und Tools für die Community-Erweiterungen.
  - Interaktion mit Minecraft: Stellen Schnittstellen bereit, um Spielinhalte und Logik zu verändern.

Ressourcenserver / Marketplace
  - Beschreibung: Offizielle Quelle für Skins, Welten, Add-ons.
  - Interaktion mit Minecraft: Download und Lizenzprüfung von Inhalten.

Bildungsplattform (Minecraft Education)
  - Beschreibung: Variante für Schulen und Unterricht.
  - Interaktion mit Minecraft: Interagiert mit Lernplattformen und Lehrerkonten.
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
###Architekturgrundidee

Minecraft verfolgt eine Client-Server-Architektur, die es erlaubt, sowohl Einzelspieler- als auch Mehrspielersitzungen zu betreiben.
Dabei gilt das Prinzip:
- Der Server bestimmt die Spielrealität, der Client visualisiert sie.

Diese klare Trennung ermöglicht:
- Multiplayer über Netzwerk (lokal oder online)
- Modulare Erweiterungen durch Plugins oder Mods
- Stabilen Betrieb, auch wenn einzelne Clients abstürzen










## 5. Bausteinsicht
Anwendungsfalldiagramm + Beschreibung.

## 6. Laufzeitsicht
(optional, falls ihr Abläufe zeigen wollt).

## 7. Verteilungssicht
Verteilungsdiagramm (z. B. wo läuft was? Server, Client, Cloud).

## 8. Qualitätsanforderungen
Drei konkrete Anforderungen beschreiben (z. B. Zuverlässigkeit, Wartbarkeit, Benutzerfreundlichkeit).

## 9. Risiken und technische Schulden
(Optional, falls vom Dozenten gewünscht).

## 10. Anhänge
Links, Quellen, GitHub-Workflows.
