#import "locale.typ": *

/// Renders the "Anmerkung zur Nutzung von Künstlicher Intelligenz" section
/// (chapter 4.6 of the DHBW guidelines).
///
/// Parameters:
///   - ai-tools: array of dictionaries, each with:
///     - tool (str or content): name of the AI tool
///     - description (str or content): description of how the tool was used
///   - language: "de" or "en"
#let ai-acknowledgement(ai-tools, language) = {
  heading(level: 1, numbering: none)[#AI_ACKNOWLEDGEMENT_TITLE.at(language)]

  figure(
    kind: table,
    caption: AI_ACKNOWLEDGEMENT_TITLE.at(language),
    supplement: none,
    outlined: false,
    table(
      columns: (1fr, 3fr),
      align: (left, left),
      table.header(
        strong(AI_ACKNOWLEDGEMENT_TOOL_COLUMN.at(language)),
        strong(AI_ACKNOWLEDGEMENT_DESCRIPTION_COLUMN.at(language)),
      ),
      ..ai-tools.map(entry => (
        entry.tool,
        entry.description,
      )).flatten()
    )
  )
}
