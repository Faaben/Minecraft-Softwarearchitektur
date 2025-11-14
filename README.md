# arc42 Architektur-Dokumentation  
## Minecraft – Referenzarchitektur (didaktisches Modell)

**Hinweis**  
Diese Dokumentation beschreibt Minecraft als abstrahierte Referenzarchitektur auf Basis des arc42-Templates.  
Sie dient Ausbildungszwecken, fokussiert auf typische Architekturprinzipien und ersetzt keine interne Dokumentation von Mojang/Microsoft.

---

## 1. Einführung und Ziele

### 1.1 Beschreibung der Anwendung

Minecraft ist eine Open-World-Sandbox-Anwendung, in der Spielerinnen und Spieler eine prozedural generierte, aus Blöcken aufgebaute 3D-Welt erkunden, gestalten und verändern können.  
Das System kombiniert Elemente von Erkundung, Ressourcenmanagement, überlebensmechaniken, Baün, Automatisierung, Handel, Bildungsszenarien und kompetitivem Spiel.

Wesentliche Eigenschaften:

- Voxelbasierte 3D-Welt mit Blöcken als Grundeinheit
- Persistente Welten mit Tag-/Nacht-Zyklus, Wetter, Kreaturen (Mobs) und Strukturen
- Verschiedene Spielmodi (Survival, Creative, Adventure, Spectator, Hardcore)
- Einzelspieler und Mehrspieler mit gemeinsamen Welten
- Erweiterbarkeit durch Resource Packs, Datapacks, Mods, Plugins und Add-ons

Technische Basis:

- Minecraft: Java Edition (Java)
- Minecraft: Bedrock Edition (C++ und plattformspezifische Komponenten)
- Zielplattformen: Windows, macOS, Linux, Konsolen, Mobile, Education-spezifische Umgebungen

### 1.2 Aufgabenstellung

Die Architektur von Minecraft soll eine langfristig tragfähige Plattform bieten, die:

- sehr grosse, persistente Welten performant und konsistent verwaltet
- Einzelspieler-, LAN- und Internet-Multiplayer-Szenarien ermöglicht
- serverseitig autoritative Spiellogik zur Sicherstellung von Fairness und Konsistenz bereitstellt
- auf unterschiedlichen Plattformen mit variierender Hardware performant betrieben werden kann
- eine aktive Community aus Mod-Entwicklern, Content Creators und Serverbetreibenden gezielt unterstützt
- regelmässige Updates, neü Inhalte und Editionsvarianten ermöglicht, ohne bestehende Welten systematisch zu brechen

Diese Referenzarchitektur abstrahiert typische Muster von Java Edition, Bedrock Edition, Realms, Dedicated Servern und Education Edition zu einem einheitlichen, didaktischen Modell.

### 1.3 Qualitätsziele

1. **Performance & Skalierung**  
   Spielbare Bildraten und stabile Tick-Raten auch bei grossen Welten, vielen Entitäten und mehreren Dutzend bis Hunderten gleichzeitigen Spielenden.
2. **Stabilität & Datenintegrität**  
   Hohe Zuverlässigkeit beim Speichern und Laden von Welten und Spielerfortschritten; Minimierung der Gefahr von Datenkorruption.
3. **Erweiterbarkeit & Offenheit**  
   Klare Erweiterungspunkte für Mods, Plugins, Datapacks, Resource Packs und Add-ons bei gleichzeitig geschütztem Kern.
4. **Sicherheit & Fairness**  
   Schutz vor Cheating, Exploits und unautorisierten Zugriffe durch serverseitige Autorität, Authentifizierung und konfigurierbare Rechte.
5. **Plattformvielfalt & Konsistenz**  
   Konsistentes Spielerlebnis über verschiedene Plattformen hinweg, bei gleichzeitiger Optimierung für die jeweilige Zielumgebung.
6. **Wartbarkeit & Transparenz**  
   Verständliche Logs, Crash-Reports, Konfigurationsmechanismen und dokumentierte Schnittstellen.

### 1.4 Stakeholder

- Spielende (Casual, Kreativbau, Survival, kompetitiv)
- Community-Entwicklerinnen und -Entwickler (Mods, Plugins, Tools)
- Server-Administratoren und Hoster
- Mojang Studios / Microsoft (Produktverantwortung, Marke, Einnahmen, Compliance)
- Lehrpersonen und Bildungseinrichtungen (Minecraft Education)
- Plattformbetreiber (Konsolenhersteller, App-Store-Betreiber)

---

## 2. Randbedingungen

### 2.1 Technische Randbedingungen

- Programmiersprachen:
  - Java Edition: Java
  - Bedrock Edition: C++ (Engine-nahe, plattformspezifische Anpassungen)
- Architektur:
  - Durchgängiges Client-Server-Modell; im Singleplayer ein lokaler integrierter Serverprozess
- Persistenz:
  - Chunk-basierte Speicherung
  - Binäre, strukturierte Formate (z. B. NBT) für Weltdaten, Spielerprofile, Konfigurationen
- Netzwerk:
  - Proprietäre, paketbasierte Protokolle auf Basis etablierter Transportprotokolle
- Plattformen:
  - Desktop, Konsole, Mobile, Education-Umgebungen
- Distribution:
  - Minecraft Launcher, Plattform-Stores, Education-Portale, Realms-Verwaltung

### 2.2 Organisatorische Randbedingungen

- Zentrale Produkt- und Architekturverantwortung bei Mojang/Microsoft
- Gemeinsame Marken- und Qualitätsanforderungen für alle Editionen
- Kontinuierliche Weiterentwicklung bei gleichzeitigem Schutz bestehender Welten (Abwärtskompatibilität, Migrationspfade)
- Starke Einbindung der Community (Feedback, Modding, Serverlandschaft)

### 2.3 Rechtliche Randbedingungen

- Proprietäre Lizenz- und Nutzungsbedingungen (EULA)
- Markenrichtlinien für Minecraft-bezogene Inhalte und Server
- Vorgaben für Monetarisierung von Servern und Inhalten
- Datenschutz- und Compliance-Anforderungen für Online-Dienste
- Einhaltung plattformspezifischer Richtlinien (z. B. Konsolen, Mobile-Stores)

---

## 3. Kontextabgrenzung

### 3.1 Systemübersicht

**Im Scope dieser Architekturbetrachtung:**

- Minecraft-Client (Rendering, UI, Eingabe, Client-Netzwerk)
- Minecraft-Server (integriert, dediziert, Realms, Education-Server)
- Persistenzschicht (Weltdaten, Spielerprofile, Konfiguration)
- Offizielle Erweiterungsmechanismen (Resource Packs, Datapacks, Add-ons, APIs)

**Ausserhalb, aber relevant:**

- Microsoft-/Xbox-Accounts und zentrale Authentifizierungsdienste
- Minecraft Launcher und Plattform-Stores
- Externe / Community-Server und Hosting-Anbieter
- Modding- und Plugin-Plattformen von Drittanbietern
- Education-spezifische Verwaltungsplattformen und Schul-Infrastrukturen

### 3.2 Externe Akteure und Systeme

| Akteur / System                 | Beschreibung                                          | Interaktion                                |
|---------------------------------|-------------------------------------------------------|--------------------------------------------|
| Spielende                       | Endnutzerinnen und Endnutzer                         | Spiel, Chat, Einstellungen, Kaüfe         |
| Launcher / Store                | Distribution, Lizenzprüfung, Updates                 | Login, Download, Update, Start             |
| Microsoft-/Xbox-Services        | Identitäts- und Sitzungsverwaltung                   | Authentifizierung, Profil, Realms-Zugriff  |
| Community-/Dedicated-Server     | Von Dritten betriebene Mehrspielerserver             | Client-Verbindung via Serverprotokoll      |
| Modding-/Plugin-Plattformen     | Austausch und Distribution von Mods/Plugins           | Download, Dokumentation                    |
| Marketplace / Content-Plattform | Verkauf und Bereitstellung offizieller Inhalte       | Kaüfe, Lizenzprüfung, Download           |
| Bildungseinrichtungen           | Nutzung von Minecraft Education                       | Klassensteürung, Bereitstellung von Welten|

### 3.3 Kontextdiagramm

Das Kontextdiagramm zeigt Clients, Server, Identitätsdienste, Distribution und externe Inhalte im überblick.

![Kontextdiagramm – Minecraft-Referenzarchitektur](diagrams/kontext.svg)

### 3.4 Anwendungsfalldiagramm
Das Anwendungsfalldiagramm stellt zentrale Interaktionen schematisch dar, insbesondere:

- Welt erkunden und baün
- Ressourcen abbaün und verarbeiten
- Kämpfen und überleben
- Mehrspieler-Spiel beitreten / hosten
- Server administrieren
- Inhalte und Erweiterungen nutzen (Resource Packs, Datapacks, Mods, Add-ons)
- In Education-Szenarien Welten bereitstellen, Aufgaben steürn

Die Visualisierung zeigt dabei Spielende, Server-Administratoren und Lehrpersonen als Akteure und ihre jeweiligen Anwendungsfälle im Zusammenspiel mit Client und Server.

![Anwnedungsfälle – Minecraft-Referenzarchitektur](diagrams/anwendungsfaelle.svg)

---

## 4. Lösungsstrategie

### 4.1 Architekturstil und Leitprinzipien

- Strikte **Client-Server-Architektur** mit serverseitiger Autorität
- **Schichten- und Komponentenarchitektur** für Client, Server, Persistenz und Erweiterungen
- **Ereignis- und datengetriebenes Design** (Events, Hooks, Konfiguration statt Hardcoding)
- **Produktlinien-Ansatz**:
  - Gemeinsame Architekturprinzipien für Java, Bedrock, Education, Realms
- Offenheit für kontrollierte Erweiterbarkeit

### 4.2 Strategien zur Erreichung der Qualitätsziele

- Performance: Chunking, Tick-System, Caching, Sichtweitensteürung
- Stabilität: Robust gespeicherte Weltdaten, Crash-Handling, Wiederanlauf
- Erweiterbarkeit: Offizielle Schnittstellen, strukturierte Datenformate
- Sicherheit: Autoritativer Server, zentrale Authentifizierung, restriktive Rechte
- Portabilität: Abstraktionsschichten für Rendering, Input, Filesystem und Netzwerk

---

## 5. Bausteinsicht (Building Block View)

### 5.1 Gesamtübersicht

Die Bausteinsicht gliedert das System in Client, Server, Persistenz und Qürschnittsfunktionen:

+-----------------------------------------------------------+
|                     Minecraft System                      |
+-----------------------------------------------------------+
|  Client Layer   |  Server Layer   |  Persistence Layer    |
+-----------------------------------------------------------+
|   Cross-Cutting & Extension Layer (APIs, Mods, Add-ons)   |
+-----------------------------------------------------------+

### 5.2 Client Layer

**Verantwortungen**

- Rendering der Spielwelt und Benutzeroberflächen
- Verarbeitung von Eingaben (Maus, Tastatur, Controller, Touch)
- Anzeige von Inventar, Chat, Statusinformationen, Menüs
- Aufbau und Verwaltung der Netzwerkverbindung zum Server
- Lokales Caching von Chunks und Ressourcen
- Start eines integrierten Servers im Singleplayer (Java)

**Zentrale Bausteine**

- Rendering Engine
- UI/HUD-System
- Input-Abstraktion
- Netzwerk-Clientmodul
- Resource-Pack-Management

### 5.3 Server Layer

**Verantwortungen**

- Autoritative Spiellogik (Regeln, Physik, Kampf, Interaktionen)
- Verwaltung von Welten, Dimensionen, Biomen, Strukturen
- Verwaltung von Entitäten und Block-Entitäten
- Session-Management (Login, Logout, Zeitüberschreitung)
- Rechte- und Rollenkonzept (Operatoren, Permissions)
- Synchronisierung der relevanten Welt- und Entitätsdaten an Clients
- Integration von Plugins/Mods auf dedizierten Servern

**Zentrale Bausteine**

- Tick-Engine (Game Loop)
- World Manager
- Entity Manager
- Game Rule Engine
- Netzwerk-Server-Endpunkt
- Command-/Admin-Interface
- Plugin-/Modding-Layer

### 5.4 Persistence Layer

**Verantwortungen**

- Speicherung von Weltdaten (Chunks, Regionen, Strukturen)
- Speicherung von Spielerprofilen (Position, Inventar, Statistiken)
- Speicherung von Konfigurationen, Whitelists, Bans, Berechtigungen
- Unterstützung von Backups, Restores und Migrationen

**Kernkonzepte**

- NBT-basierte und ähnliche binäre Formate
- Dateistruktur pro Weltinstanz
- Schreibstrategien zur Sicherstellung von Konsistenz

### 5.5 Netzwerk & Protokoll

**Verantwortungen**

- Aufbau, überwachung und Abbau von Client-Server-Verbindungen
- Handshake mit Protokoll- und Versionsprüfung
- Authentifizierungsablauf (Online-Modus)
- Serialisierung/Deserialisierung von Spielereignissen, Bewegungen, Chat, Welt-Updates
- Umgang mit Paketverlust, Latenz und Timeouts

**Schnittstellen**

- Definierte Pakettypen (Login, Status, ChunkData, EntityUpdate, Chat, Interaktion)
- Callbacks in Serverlogik und Clientdarstellung

### 5.6 Extension & Modding Layer

**Verantwortungen**

- Definition offizieller Erweiterungspunkte (Events, APIs, Registries)
- Einbindung von Mods, Plugins, Datapacks, Resource Packs, Add-ons
- Kapselung von Drittcode, um Kernlogik zu schützen

**Beispiele**

- Java Edition: Forge, Fabric, Bukkit/Spigot/Paper, Datapacks, Resource Packs
- Bedrock Edition: Behavior Packs, Resource Packs, Scripting APIs

---

## 6. Laufzeitsicht (Runtime View)

### 6.1 Szenario: Multiplayer-Login

1. Client startet und lädt Ressourcen.
2. Spielerin/Spieler wählt einen Server aus.
3. Client baut eine Netzwerkverbindung zum Server auf.
4. Protokoll-Handshake und Versionsabgleich.
5. Authentifizierung über Microsoft-/Xbox-Services (Online-Modus).
6. Server prüft Whitelist/Bans und lädt Spielerprofil.
7. Server sendet Startposition, relevante Chunks und Entitätsdaten.
8. Laufender Betrieb: Client sendet Aktionen; Server validiert und beantwortet mit Updates.


### 6.2 Szenario: Block platzieren

1. Spielerin/Spieler wählt Block im Inventar.
2. Client berechnet Zielposition und sendet PlaceBlock-Anfrage.
3. Server prüft Reichweite, Rechte, Spielmodus, Kollisionen.
4. Bei Erfolg aktualisiert der Server Welt- und Inventardaten.
5. Server sendet Block-Update an alle relevanten Clients.
6. Clients aktualisieren die Darstellung.

### 6.3 Szenario: Plugin-Event (Java Dedicated Server)

1. Spieler joined den Server.
2. Server erzeugt ein PlayerJoinEvent.
3. Registrierte Plugins erhalten das Event.
4. Plugins führen eigene Logik aus (Begrüssung, Checks, Logging).
5. änderungen erfolgen ausschliesslich über definierte APIs; Kernlogik bleibt autoritativ.

---

## 7. Verteilungssicht (Deployment View)

### 7.1 Deployment-Varianten

- Singleplayer: Client + integrierter Serverprozess auf einem Gerät
- LAN-Server: Ein Host im lokalen Netz, weitere Clients verbinden sich
- Dedizierter Server: Separater Server in Rechenzentrum/Cloud
- Realms: Verwaltete Serverinstanzen durch Mojang/Microsoft
- Education Edition: Spezifische Deployments mit Classroom-Management

### 7.2 Beispielhafte Deployment-Ansicht

Die beispielhafte Deployment-Ansicht zeigt ein typisches Online-Szenario:

- Ein oder mehrere Minecraft-Clients (PC, Konsole, Mobile) verbinden sich über das Internet via TCP/IP mit einem Minecraft-Server, der entweder lokal (on-premises) oder auf einem VPS bzw. in der Cloud betrieben wird.
- Der Minecraft-Server ist für Spiellogik, Weltzustand und Synchronisation zuständig und greift lokal auf die Welt- und Spieldaten (z. B. NBT-Dateien) zu.
- Parallel dazu kommuniziert der Client bei aktivem Online-Modus über HTTPS mit den Microsoft-/Xbox-Auth-Services, um Identität, Lizenzen und ggf. Realms-Zugriffe zu validieren.
- Die Verantwortlichkeiten sind klar getrennt:
  - Authentifizierung und Kontenverwaltung bei Microsoft-/Xbox-Services,
  - autoritative Spiellogik und Weltverwaltung beim Minecraft-Server,
  - Darstellung und Eingabeverarbeitung beim Client.

Diese Struktur ermöglicht einen skalierbaren, sicheren Mehrspielerbetrieb, bei dem zentrale Dienste (Auth, Realms) von Mojang/Microsoft bereitgestellt werden, während Serverbetreiber ihre Instanzen flexibel hosten können.

+--------------------------------------------------------------+
|                        Internet / Netzwerk                   |
+--------------------------------------------------------------+
|  +-----------------+       TCP/IP       +------------------+ |
|  | Minecraft Client| <----------------> | Minecraft Server | |
|  | (PC/Konsole)    |                    | (VPS / lokal)    | |
|  +-----------------+                    +------------------+ |
|         |                                         |          |
|         | HTTPS (Auth, Profile, Realms)           | FS       |
|         v                                         v          |
|  +-------------------+                    +----------------+ |
|  | Microsoft-/Xbox   |                    | Welt-/Spiel-   | |
|  | Auth Services     |                    | Daten (NBT)    | |
|  +-------------------+                    +----------------+ |
+--------------------------------------------------------------+

![Verteilungssicht – Beispielhaftes Deployment](diagrams/verteilung.svg)

---

## 8. Qürschnittliche Konzepte

### 8.1 Sicherheitskonzept

Grundsatz: **Der Server ist autoritativ, der Client nie voll vertraünswürdig.**

- Serverseitige Prüfung aller relevanten Aktionen (Bewegung, Schaden, Inventar, Blockaktionen)
- Nutzung von Microsoft-/Xbox-Accounts im Online-Modus
- Whitelists, Bans, Rollen- und Berechtigungssysteme
- Validierung eingehender Pakete (Struktur, Freqünz, Wertebereiche)
- Einsatz von Anti-Cheat-Mechanismen (Kern + optionale Plugins)
- Beschränkung des Zugriffs auf Serverkonsole, Dateien und Administrationsschnittstellen

Ziel ist eine möglichst faire, manipulationsresistente Spielumgebung bei vertretbarem Aufwand.

### 8.2 Konfigurationskonzept

Leitidee: **Verhalten wird über Konfiguration und Daten gesteürt, nicht über Ad-hoc-Codeänderungen.**

Ebenen:

- Server-Basis-Konfiguration (z. B. `server.properties`)
- Welt- und Regelkonfiguration (Gamerules, Weltparameter)
- Erweiterungskonfigurationen (Plugins, Mods, Add-ons)
- Resource Packs und Datapacks für Inhalte und Regeln

Anforderungen:

- Klare Trennung von Standard- und projektspezifischen Einstellungen
- Dokumentierte Default-Werte
- Möglichkeit von Anpassungen zur Laufzeit (z. B. Befehle, Skripte)

### 8.3 Fehler- und Loggingkonzept

- Zentrale Logfiles für Start/Stop, Warnungen, Fehler, wichtige Events
- Crash-Reports mit Umgebungsinformationen und Stacktraces
- Optionale, datenschutzkonforme Telemetrie für Stabilitätsanalysen
- Konfigurierbare Log-Level und Trennung von Kernlogs und Plugin-Logs

Ziel ist eine gute Nachvollziehbarkeit von Problemen und eine effiziente Unterstützung von Serverbetreibenden.

### 8.4 Internationalisierung

- Alle Texte (UI, Meldungen, Itemnamen) liegen in separaten Sprachdateien vor.
- Verwendung von Lokalisierungs-Keys statt harter Texte im Code.
- Resource Packs können eigene Sprachdateien bereitstellen.
- Sprachwechsel ist im Client konfigurierbar ohne Einfluss auf Spielmechanik.

### 8.5 Performanz- und Skalierungskonzept

Wesentliche Mechanismen:

- Chunk-Streaming: Nur relevante Weltbereiche im Speicher
- Steürung von Render Distance (Client) und Simulation Distance (Server)
- Tick-basiertes Verarbeitungsmodell (typisch 20 TPS)
- Begrenzung von Entitäten, Redstone-Mechaniken und komplexen Farmen
- Vertikale Skalierung (leistungsstärkere Hardware)
- Horizontale Skalierung durch Servernetzwerke/Proxys (Lobby-Architekturen)

Ziel: Stabiler Betrieb auch bei hoher Last und komplexen Spielwelten.

---

## 9. Architekturentscheidungen

### 9.1 Client-Server statt Peer-to-Peer

- Entscheidung für ein autoritatives Servermodell
- Erleichtert Cheatschutz, Konsistenz und zentrale Regelprüfung
- Führt zu höherer Komplexität im Server und Latenzanforderungen

### 9.2 Chunk-basierte Weltorganisation

- Welt in logisch feste Einheiten (Chunks, Regionen) aufgeteilt
- Erlaubt effizientes Laden, Speichern und übertragen
- Erfordert saubere Behandlung von Effekten an Chunk-Grenzen

### 9.3 Binäre Speicherformate

- Einsatz strukturierter, binärer Formate (z. B. NBT)
- Kompakt, erweiterbar, toolfähig
- Bedarf klarer Dokumentation und Migrationskonzepte

### 9.4 Erweiterbarkeit über Schnittstellen

- Offizielle APIs und Datenformate statt ausschliesslich inoffizieller Hacks
- Stärkt Community-ökosystem, erhöht aber Aufwand für Rückwärtskompatibilität

### 9.5 Separate Produktlinien (Java / Bedrock)

- Unterschiedliche technische Basen für unterschiedliche Plattformziele
- Gemeinsame Architekturprinzipien, aber getrennte Implementierungen
- Risiko von Fragmentierung, erfordert klare Kommunikation und Synchronisation

---

## 10. Qualitätsanforderungen

### 10.1 Qualitätsbaum

Die wesentlichen Qualitätsmerkmale:

- Funktionalität
- Zuverlässigkeit
- Benutzbarkeit
- Effizienz
- änderbarkeit & Erweiterbarkeit
- Portabilität
- Sicherheit
- Wartbarkeit & Transparenz

### 10.2 Beispielhafte Qualitätsszenarien

**Performance**  
Ein dedizierter Server mit 60+ aktiven Spielenden, umfangreichen Redstone-Anlagen und vielen Entitäten hält eine stabile Tick-Rate im akzeptablen Bereich; Latenzen bleiben für Spielende spielbar.

**Zuverlässigkeit**  
Kommt es während eines automatischen Speichervorgangs zu einem Absturz, kann der Server nach Neustart die Welt konsistent laden; maximal gehen wenige Sekunden Fortschritt verloren.

**Sicherheit**  
Ein modifizierter Client versucht, ungültige Bewegungen und Item-Duplikation zu nutzen. Der Server erkennt dies anhand der Regeln und verwirft die Aktionen bzw. sperrt bei wiederholten Verstössen den Account.

**Erweiterbarkeit**  
Ein Update fügt neü Blöcke und Mobs hinzu. Bestehende Welten bleiben nutzbar; sauber implementierte Plugins und Datapacks funktionieren weiter oder lassen sich mit überschaubarem Aufwand anpassen.

**Portabilität**  
Eine neü Plattform kann angebunden werden, indem Rendering-, Input- und Plattformzugriffe abstrahiert und an die bestehende Logik angebunden werden.

---

## 11. Risiken und Technische Schulden

### 11.1 Fragmentierung

- Unterschiedliche Editionen, Feature-Stände und Modding-ökosysteme
- Gefahr von Verwirrung und uneinheitlichem Nutzererlebnis

### 11.2 Abhängigkeit von Community-Plugins

- Wichtige Funktionen häufig über Dritt-Plugins implementiert
- Veraltete oder unsichere Plugins können Stabilität und Sicherheit beeinträchtigen

### 11.3 Rückwärtskompatibilität

- Langfristige Unterstützung alter Welten erschwert tiefgreifende Architekturverbesserungen
- Bedarf an Konvertern und Migrationspfaden

### 11.4 Komplexe Performanzmechaniken

- Redstone, Entitäts-Logik und grosse Farmen können zu schwer nachvollziehbaren Lastspitzen führen
- Optimierungen im Tick- und Update-System sind komplex und fehleranfällig

---

## 12. Glossar

**Block**  
Elementare Baüinheit der Spielwelt im voxelartigen Raster.

**Chunk**  
Fester Ausschnitt der Welt, zentrale Einheit für Speicherung, Laden und übertragung.

**Region**  
Datei-Einheit, die mehrere Chunks zusammenfasst, um I/O-Zugriffe zu optimieren.

**Biome**  
Gebiete mit spezifischen Umweltbedingungen, die Terrain, Vegetation und Mobs beeinflussen.

**NBT (Named Binary Tag)**  
Binäres, hierarchisches Datenformat zur effizienten Speicherung von Minecraft-Daten.

**Entity**  
Dynamisches Objekt in der Welt (Spielende, Mobs, Tiere, Projektile, Fahrzeuge etc.).

**Block Entity / Tile Entity**  
Block mit zusätzlichen Daten oder Logik (z. B. Truhe, Ofen, Beacon).

**Tick**  
Diskrete Verarbeitungseinheit der Spiel- und Serverlogik (typischerweise 20 pro Sekunde).

**Dedicated Server**  
Eigenständiger Serverprozess für Mehrspielerbetrieb ohne grafische Oberfläche.

**Client**  
Anwendung auf dem Endgerät, zuständig für Darstellung, Eingaben und Kommunikation mit dem Server.

**Server**  
Autoritative Instanz für Weltzustand, Spiellogik, Rechteverwaltung und Synchronisierung.

**Client-Server-Protokoll**  
Spezifisches, paketbasiertes Protokoll zwischen Client und Server.

**Whitelist / Banliste / Permissions**  
Mechanismen zur Steürung von Zugang und Berechtigungen auf einem Server.

---
