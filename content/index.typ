#import "../config.typ": template, tufted
#import "_cv-content.typ": contact-note, profile-summary, research-interests, research-highlights, selected-publications, brainoware-coverage

#show: template.with(
  title: "Hongwei Cai | Postdoctoral Fellow, Indiana University Bloomington",
  description: "Hongwei Cai is a postdoctoral fellow at Indiana University Bloomington building intelligent biohybrid organoid systems for precision medicine and AI computing.",
)

#tufted.margin-note[
  #html.span(
    class: "profile-photo",
    image("imgs/headshot.jpg", alt: "Portrait of Hongwei Cai"),
  )
  #contact-note()
]

= About me

#html.elem("p", attrs: (class: "lede"), [I build intelligent biohybrid organoid systems for precision medicine and AI computing.])

#profile-summary

== Research Interests

#research-interests

== Representative work

#selected-publications

== Updates

Feb.2025 - My manuscript entitled "Vascular network-inspired diffusible scaffolds for engineering functional mid-brain organoids" has been accepted by Cell Stem Cell. 

See the full list at #link("/Publication/")[Publication], my #link("/Patent/")[Patents], #link("/Award-Service/")[Awards & Service], or view my #link("/CV/")[CV].
