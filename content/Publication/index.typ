#import "../index.typ": template, tufted
#import "../_cv-content.typ": publication-summary, render-pub-list-html, all-publications-data, pending-work

#show: template.with(
  title: "Publication",
  description: "Publications and patents by Hongwei Cai.",
  js-scripts: ("/assets/publication-filter.js",),
)

= Publication

#text(size: 0.5em, style: "italic")["\#" equal contribution, "\*" corresponding]

#tufted.margin-note({
  image("citation-0901.PNG")
})

#tufted.margin-note[
  Over *2,300* citations at #link("https://scholar.google.com/citations?user=RIWyrJwAAAAJ", "Google Scholar") as of September 1, 2026 
]

#tufted.margin-note[
  #html.span(class: "cover-grid", {
    image("cover_1.png")
    image("cover_2.png")
    image("cover_3.png")
    image("cover_4.png")
  })
]

#html.div(class: "publication-filter", {
  html.div(class: "publication-filter-row", {
    html.span(class: "publication-filter-label", [Role])
    html.div(class: "pub-role-pills", {
      html.elem("button", attrs: (type: "button", class: "pub-role-pill is-active", "data-role": "all"), [All])
      html.elem("button", attrs: (type: "button", class: "pub-role-pill", "data-role": "first"), [Major roles])
      html.elem("button", attrs: (type: "button", class: "pub-role-pill", "data-role": "collaborative"), [Collaborative])
    })
  })
  html.div(class: "publication-filter-row", {
    html.span(class: "publication-filter-label", [Year])
    html.span(class: "publication-filter-hint", [From])
    html.elem("select", attrs: (id: "pub-year-from", class: "pub-year-select"), [
      #html.elem("option", attrs: (value: "2019"), [2019])
      #html.elem("option", attrs: (value: "2020"), [2020])
      #html.elem("option", attrs: (value: "2021"), [2021])
      #html.elem("option", attrs: (value: "2022"), [2022])
      #html.elem("option", attrs: (value: "2023"), [2023])
      #html.elem("option", attrs: (value: "2024"), [2024])
      #html.elem("option", attrs: (value: "2025"), [2025])
      #html.elem("option", attrs: (value: "2026"), [2026])
    ])
    html.span(class: "publication-filter-hint", [To])
    html.elem("select", attrs: (id: "pub-year-to", class: "pub-year-select"), [
      #html.elem("option", attrs: (value: "2026"), [2026])
      #html.elem("option", attrs: (value: "2025"), [2025])
      #html.elem("option", attrs: (value: "2024"), [2024])
      #html.elem("option", attrs: (value: "2023"), [2023])
      #html.elem("option", attrs: (value: "2022"), [2022])
      #html.elem("option", attrs: (value: "2021"), [2021])
      #html.elem("option", attrs: (value: "2020"), [2020])
      #html.elem("option", attrs: (value: "2019"), [2019])
    ])
    html.elem("button", attrs: (id: "pub-filter-reset", class: "pub-filter-button publication-filter-reset", type: "button"), [Reset])
  })
})

#html.div(class: "peer-group", render-pub-list-html(all-publications-data))

See the full #link("/Patent/")[Patent] list, or view my #link("/CV/")[CV].
