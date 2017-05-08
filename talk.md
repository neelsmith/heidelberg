

## Recovering the history of Iliadic scholia



Melody Wauke, Charlie Schufreider, Neel Smith

---

## Overview

1. Architecture and workflow
2. Application:
    - the construction of the Venetus A MS
    - identifying Aristarchan material


---


## Architecture

1. canonical citation
2. explicit semantic model

---

## Semantic model


1. Lexical contents:
    - sequence of classified tokens
    - editorial status
    - alternate readings
2. Editorial disambiguation (e.g., named entities)
3. Discourse disambiguation (e.g., text reuse)

---

## Workflow

- content model encoded in TEI XML
- pointy brackets stay in the archive
- generate multiple published versions:
    - pure diplomatic
    - paleographically normalized, orthographically normalized, ...
    - optimized for TM
- choose version appropriate to analysis


---

## Versions aligned with URNs


- OHCO2 model of citation
- *versions* share a single parent *edition* in URN's work hierarchy




---


## Applying the model

---


## Venetus A

[Folio 12 recto](imgs/VenA-12r.jpg)

<img src="imgs/VenA-12r.jpg" width="500" height="594">


----

## Transmission of the *Iliad*

- orally composed (2nd millennium B.C.E.)
- Library of Alexandria : editions (3rd and 2nd c. B.C.E.)
    - Aristarchus
    - Zenodotus
- Venetus A manuscript (10th c.)
- Wolf, *Prolegomena ad Homerum* (1795)
- Homer Multitext (21st c. C.E.)

---

## HMT approach to unique layout of scholia

Digitial diplomatic editions in separate XML documents

![Folio 12 recto](imgs/DSE2.JPG)

---

## Why this unique five-zoned layout?

- Interlinear glosses
- Exterior editorial work

![Folio 12 recto](imgs/DSE2.JPG)

---

##  Why important? Scholia Overlap

*Iliad* Lines|Lines With Scholia|Lines w/ Overlapping Scholia
--- | --- |  ---
~12000|4216 (35%)|1167 (9.7%)

---

## The data set and methodology for topic model

- 18 books of scholia (~8000) from Homer Multitext's digital editions
- create a TM version of scholia
- LDA topic modelling using ToPan software
    - utilize topic distribution values (θ)


---

## 15-Topic Model, from ToPan

![Topic 9: most significant words](imgs/TranslatedToPan9.jpg)

---

## Extract scholia with high topic distribution values for each topic

![Sample Theta-Table](imgs/thetatable.png)

---

##  Scholia Distribution in Venetus A vs topic 9

| Zone                            | Total distrib. in Ven. A | Distrib. within Topic 9 |
|:--------------------------------|:---------------------|:------------------------|
| Main scholia (yellow)           | 3597 (45.3%)         | 45.0 (32.37%)           |
| **Intermarginal scholia (red)** | **1219 (15.4%)**     | **65.0 (46.76%)**       |
| Interior scholia (blue)         | 819 (10.3%)          | 28.0 (20.14%)           |

---

- there is a distinct distribution of content in each zone
- what can the content tell us about sources?

---

## Sources for the Venetus A scholia

- Limited information on source material
- Manuscript cites four specific sources from 1st and 2nd centuries C.E.
- Alexandrian editors' editions no longer extant at time of manuscript construction

---

## Recovering Aristarchan material

- Identify cluster of features which suggest source (Aristarchan, post-Aristarchan)
- create a model for identifying Aristarchan scholia

---

## Suggestions of Aristarchan *language*


- Critical Signs come from Aristarchus' editions
- Explanatory scholia (ὅτι...) transmitted with signs are also Aristarchan
- Only Zenodotus "writes" (ζηνόδοτος γράφει...) vs. παρὰ Ζηνοδότῳ

[Critical signs](imgs/critsigns.png)

<img src="imgs/critsigns.png" width="500" height="304">

---

## Significant topics for analysis

**Topic 9**: Language used when discussing Aristarchus

![Topic 9](imgs/Topic09.png)

---

### Topic 6: Aristarchan language

![Topic 6](imgs/Topic06.png)

---

## Features for analysis

### Aristarchan features
- Critical sign
- γράφει (active)
- Initial ὅτι
- Higher topic 6 score

### Post-Aristarchan features

- παρὰ Ζηνοδότῳ
- Aristarchus' name
- Post-Aristarchan name
- Higher topic 9 score

---

## Manually classify a training set of 100 scholia

- Aristarchan
- Aristarchan paraphrase
- post-Aristarchan
- indeterminate

---

## Decision tree model trained from manually labeled set

DecisionTreeClassificationModel depth 5 with 25 nodes

----

    If (feature 2 <= 0.0)
      If (feature 4 <= 0.0)
        If (feature 5 <= 0.0)

         If (feature 4 <= 0.0)
        If (feature 5 <= 0.0)


         If (feature 7 <= 0.00606060606060606)
          If (feature 7 <= 0.00103626943005181)
           Predict: 3.0
          Else (feature 7 > 0.00103626943005181)
           Predict: 4.0
         Else (feature 7 > 0.00606060606060606)
          If (feature 6 <= 0.00122699386503067)
           Predict: 2.0
          Else (feature 6 > 0.00122699386503067)

      ...

----

## Applying the model

- evaluate model: success against training set (up to 90%)
- apply to reamining 7900+ scholia:

How many of each class?

- Main scholia contain the majority of Aristarchan and post-Aristarchan language
- Intermarginal and Interior scholia contain more Aristarchan paraphrases
- Zones are *not* the best feature for indicating source

---

- Analyze scholia as a collection of various features
- Working Aristarchan identifier
  - Possible to recover material directly from Aristarchus' editions (2nd century BCE)

---

## Conclusions

Advantages of a semantic model for the HMT:

- create specialized versions of scholia from archive
- use TM to relate layout and content of Ven. A
- identify source material with machine-learning model
