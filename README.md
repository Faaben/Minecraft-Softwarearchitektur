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
Kontextdiagramm + Beschreibung.

## 4. Lösungsstrategie
Wichtige Architekturentscheidungen (Frontend, Backend, Cloud, Schnittstellen).

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
