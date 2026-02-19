#import "/typst-dhbw-template/lib.typ": *
#import "example-acronyms.typ": acronyms
#import "example-glossary.typ": glossary
#show outline.where(target: figure.where(kind: image)): it => {
  show outline.entry: it => {
    show cite: it => {}
    it
  }
  it
}
#let text_kurz = "XYZ"

#let text_abs = "XYZ"

#show: supercharged-dhbw.with(
  title: "Entwicklung eines Gesundheitstrackers zur Überwachung und Verarbeitung von
Vitalwerten",
  authors: (
    (
      name: "Max Mustermann",
      student-id: "1234567",
      course: "TES22",
      course-of-studies: "Embedded Systems",
      company: (
        (name: "Muster GmbH", post-code: "70435", city: "Stuttgart")
      ),
    ),
  ),
  acronyms: acronyms, // displays the acronyms defined in the acronyms dictionary
  at-university: false, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("example-sources.bib"),
  date: (datetime(year: 2025, month: 6, day: 2), datetime(year: 2025, month: 9, day: 8)),
  glossary: none, // displays the glossary terms defined in the glossary dictionary
  language: "de", // en, de
  supervisor: (company: "M.Sc. Erika Muster", university: "Prof. Dr. Max Beispiel"),
  university: "Dualen Hochschule Baden-Württemberg",
  university-location: "Stuttgart",
  university-short: "DHBW",
  show-confidentiality-statement: false,
  page-numbering: (preface: "I", main: "1", appendix: "I"),
  header: (show-right-logo: false, show-left-logo: false),
  abstract: text_abs,
  kurzfassung: text_kurz,
  type-of-thesis: "Studienarbeit",
  // KI-Nutzung (Kap. 4.4 + 4.6): ai-disclosure fügt den Pflichtssatz zur
  // Selbstständigkeitserklärung hinzu; ai-tools erzeugt die Tabelle am Ende.
  ai-disclosure: true,
  ai-tools: (
    (
      tool: "ChatGPT",
      description: [Verständnis von Grundbegriffen im Themenfeld (Kapitel 2) sowie Recherche von Literaturstellen],
    ),
    (
      tool: "Microsoft Copilot",
      description: [Korrektur- und Formulierungshilfe (gesamt) sowie Übersetzung von Textpassagen],
    ),
  ),
  appendix: [
    == Rohdaten der Vitalwertmessung <anhang-rohdaten>

    Die folgende Tabelle enthält alle im Messzeitraum aufgezeichneten Rohdaten, die der Auswertung in @tab-messreihe zugrunde liegen.

    #figure(
      table(
        columns: (auto, 1fr, 1fr, 1fr, 1fr),
        align: (left, center, center, center, center),
        table.header(
          [*Zeitstempel*], [*HR (bpm)*], [*SpO₂ (%)*], [*Temp. (°C)*], [*Bewertung*],
        ),
        [08:00], [72], [98], [36.7], [normal],
        [08:15], [75], [97], [36.8], [normal],
        [08:30], [68], [99], [36.6], [normal],
        [08:45], [80], [96], [37.1], [erhöht],
        [09:00], [74], [98], [36.9], [normal],
        [09:15], [71], [99], [36.7], [normal],
        [09:30], [78], [97], [37.0], [normal],
        [09:45], [82], [95], [37.3], [erhöht],
      ),
      caption: [Vollständige Rohdaten der Vitalwertmessung],
    )

    == Systemkonfiguration <anhang-config>

    #figure(
      sourcecode[```json
{
  "sensor": {
    "sampling_rate_hz": 1,
    "hr_range": [40, 200],
    "spo2_range": [80, 100],
    "temp_range": [35.0, 42.0]
  },
  "transmission": {
    "protocol": "BLE",
    "interval_ms": 500
  }
}
      ```],
      caption: [Konfigurationsdatei des Gesundheitstrackers],
      supplement: "Quellcode",
    )
  ],
  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
)


= Motivation <motivation>
XYZ

= Grundlagen
XYZ

Das DHBW-Logo ist in @abb-dhbw-logo dargestellt. @tab-messreihe zeigt eine exemplarische Messreihe der aufgezeichneten Vitalwerte.

#figure(
  image("/typst-dhbw-template/dhbw.svg", width: 40%),
  caption: [DHBW-Logo als Beispielabbildung],
) <abb-dhbw-logo>

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr),
    align: (left, center, center, center),
    table.header([*Messung*], [*Herzfrequenz (bpm)*], [*Sauerstoffsättigung (%)*], [*Temperatur (°C)*]),
    [1], [72], [98], [36.7],
    [2], [75], [97], [36.8],
    [3], [68], [99], [36.6],
    [4], [80], [96], [37.1],
    [5], [74], [98], [36.9],
  ),
  caption: [Exemplarische Messreihe der Vitalwerte],
) <tab-messreihe>

== Verwendung von Formiergasen in Zuverlässigkeitstests<reliability>
Die Messung der Wafer erfolgt mit sehr feinen Nadeln. Diese Nadeln sind Teil eines sogenannten Waferprobers ($"CuO"$), der für die Kontaktierung und Messung auf Wafern eingesetzt wird. Die Nadeln werden auf die Oberfläche des Wafers gesetzt und können dabei die Passivierungsschicht des Wafers beschädigen 
#colbreak()
Eine Beschädigung der Passivierungsschicht #acr("HTTP") oder #acrpl("API") durch eine Nadel ist beispielhaft in dargestellt. Diese Aufnahmen sind ein Ergebnis der Forschung von Y. Liu et al. und dienen hier der Veranschaulichung der Problematik.

$ e = x_a - x_w $<messfehler>

#figure(
  caption: "Deklaration der Zustandsvariablen",
  sourcecode[```py
    sinit           = True
    proc_cancel     = False
    standby         = False
    leakage_test    = False
    leakage_test_n2 = False
    flush_n2        = False
    ramp_up         = False
    proc_start      = False
    ramp_downHT     = False
    ramp_downLT     = False
  ```],
  supplement: "Quellcode",
)<state_flags>

= Reflexion und Ausblick
XYZ

