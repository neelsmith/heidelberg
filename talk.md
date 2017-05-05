

## Recovering the history of Iliadic scholia: architecture and initial results from the Homer Multitext project  (HMT)



---

## Overview

1. Architecture and workflow
2. Application:
    - the construction of the Venetus A MS
    - identifying Aristarchan material


---


## Workflow

- XML source validated against explicit content model
- Pointy brackets stay in the archive
- generate multiple published editions:
    - paleographically normalized
    - orthographically normalized
    - ...
    - TM normalized
- choose edition appropriate to analysis


---

## Explicit semantic model

>Specific model of *contents* complements universal model of citation (OHCO2)

---

## HMT model - Venetus A

[Folio 12 recto](https://raw.githubusercontent.com/neelsmith/heidelberg/master/VenA-12r.jpg)

<img src="https://raw.githubusercontent.com/neelsmith/heidelberg/master/VenA-12r.jpg" width="500" height="594">


----

## Transmission of the *Iliad*

- orally composed (2nd millennium B.C.E.)
- Library of Alexandria : editions (3rd and 2nd c. B.C.E.)
    - Aristarchus
    - Zenodotus
- Venetus A manuscript (10th c. C.E.)
- Homer Multitext (21st c. C.E.)

---

## HMT approach to unique layout of scholia

Digitial diplomatic editions in separate XML documents

![Folio 12 recto](https://raw.githubusercontent.com/cjschu17/Thesis2016-2017/master/images/DSE2.JPG)

---

## Why this unique five-zoned layout?

- Interlinear glosses
- Exterior editorial work

![Folio 12 recto](https://raw.githubusercontent.com/cjschu17/Thesis2016-2017/master/images/DSE2.JPG)

---

##  Why important? Scholia Overlap

*Iliad* Lines|Lines With Scholia|Lines w/ Overlapping Scholia
--- | --- |  ---
~12000|4216 (35%)|1167 (9.7%)

---

## The data set and methodoloy for topic model

- 18 books of scholia (~8000) from Homer Multitext's digital editions
  - includes personal name identifiers
- LDA topic modelling using ToPan software
    - Utilize topic distribution values (θ)
  
---

## 15-Topic Model, from ToPan

![Topic 9: most significant words](https://raw.githubusercontent.com/cjschu17/Thesis2016-2017/master/images/TranslatedToPan9.jpg)

---

## Extract scholia with high topic distribution values for each topic

![Sample Theta-Table](https://raw.githubusercontent.com/cjschu17/drdwPortfolio/master/images/DRDW-presentation/Screen%20Shot%202016-12-08%20at%201.03.37%20AM.png)

---

## Distribution of Scholia

| Zone                            | Total distrib. in Ven. A | Distrib. within Topic 9 |
|:--------------------------------|:---------------------|:------------------------|
| Main scholia (yellow)           | 3597 (45.3%)         | 45.0 (32.37%)           |
| **Intermarginal scholia (red)** | **1219 (15.4%)**     | **65.0 (46.76%)**       |
| Interior scholia (blue)         | 819 (10.3%)          | 28.0 (20.14%)           |
