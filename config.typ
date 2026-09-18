#import "tufted-lib/tufted.typ" as tufted

#let template = tufted.tufted-web.with(
  header-links: (
    "/": "Home",
    "/Publication/": "Publication",
    "/Patent/": "Patent",
    "/Award-Service/": "Award & Service",
    "/CV/": "CV",
  ),

  title: "Hongwei Cai",
  author: "Hongwei Cai",
  description: "Postdoctoral fellow in intelligent human organoid microphysiological systems, biocomputing, microfluidics, and neuroengineering.",
  site-url: "https://hwcai.github.io/",
  lang: "en",

  header-elements: (
    [Hongwei Cai, Ph.D.],
  ),

  footer-elements: (
    "(c) 2026 Hongwei Cai",
    [Built with #link("https://github.com/Yousa-Mirage/Tufted-Blog-Template")[Tufted Blog Template]],
  ),
)
