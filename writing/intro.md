*Recovering the history of Iliadic scholia: architecture and initial results from the Homer Multitext project (HMT)*

Melody Wauke, Charles Schufreider and Neel Smith[^1]


[^1]:  The work presented here was developed in independent but coordinated undergraduate theses by Wauke and Schufreider, for which Smith served as an advisor.




Venetus A and the Homeric problem


Editions




## Digital editing:

## from *document* to *edition*


Neel Smith

October 6, 2017

---


>How do we create **digital** editions for **digital** reading?


---

## Digital reading

-   different scales
-   both directed and latent pattern recognition
-   digital "future proofing"

---

![Zurich, from ETH](imgs/zurich.jpg)

---


## Outline

1.  Background : the Homer Multitext
2.  Editions, archival and publishable

---


## 1. The Homer Multitext

---

## Original idea

Ebbott and Dué (2005):

>As many Homers as you please

---


## Canonical citation


-   align different *Iliad*s
-   disagree about editions


---


![Critical apparatus](imgs/allen-sample.png)

---

## Citing texts


The *Canonical Text Service (CTS) URN*:


-   congruent with traditional citation practice
-   pairs two hierarchies (work, and passage)
-   technology-independent URN

---

## A general pattern

1.  abstract model
2.  specification (syntax)
3.  implementation

---

## Abstract model

>Ordered hierarchy of citation objects (OHCO2)


---


## Syntax

    urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.7

![Anatomy of a CTS URN](imgs/cts-urn.gif)


---

## Code implementations

Best tested: scala, cross-compiles for JVM and JS


---


## Venice, 2007

----

![Marciana library, Venice](imgs/biblioteca2.png)



---

![The cradle](imgs/cradle-small.png)

---


The Venetus A

![The Venetus A](imgs/multitext-ms.jpg)

---

## Source material

-   multiple documents in one MS
-   no canonical citation for *scholia*
-   layout and design part of semantics



---

![A multitextual manuscript](imgs/12r.jpg)


---



## Diplomatic edition



![Digital diplomatic edition](imgs/dsemod.png)


---


## Citing objects

---


## Model

-   versioned collections of...
-   unique objects with...
-   same set of properties across a version

---

## Syntax

The CITE2 URN


E.g., a page of a manuscript:

    urn:cite2:hmt:msA.v1:12r

![Anatomy of a CITE2 URN](imgs/12r-urn.gif)

---

## Citing images

Extended citation

    urn:cite2:hmt:vaimg.2017a:VA012RN_0013@0.2079,0.2107,0.1655,0.01806

![Extended citation for images](imgs/img-roi.gif)


(See an [image citation tool](http://www.homermultitext.org/ict2))


---




## Digital diplomatic edition

-   falsifiable:  citable visual evidence
-   complete (HMT: "every anthropogenic mark")


---

# Traditional (print) critical editions

-   selective evidence (app.crit.) for...
-   a version extant in no source...
-   using an ambiguous notation

---


## 2. Editions, archival and publishable

---


## ἔκδωσις  / editio / edition / Ausgabe

---

## Access

1.  legal
2.  technical
2.  semantic



---

## Legal accesibility


A solved problem:

-   license for **reuse** (e.g., CC), or
-   public domain


---


## Technical accessibility

-   public version control (github)
-   human-readable formats
-   simplest format that is expressively complete


---


## Result: TEI XML


---


## Digression: tooling

-   Atom editor: <https://atom.io/>
-   Atom package for validating TEI editing: <https://github.com/neelsmith/atomic-tei>

---

![atomic-tei package](imgs/atomic-tei.jpg)

---


## Semantically accessible?

Not yet...  for two reasons


---


## 1. Whose TEI?

> Using TEI in 2017 guarantees you can **not** simply exchange data!


---

## Validation beyond TEI syntax


1.   syntax: validate TEI usage against *project* standards
2.   editorial content: validate identifiers
3.   text: validate morphology


---

## Requires an abstract model!

1.  editors' manual (specification)
2.  code implementation
3.  code implementation applied to TEI document


---

## Application in HMT

-   200 contributors able to validate their work
-   (but model has evolved)

---

## Computer-assisted *verification*


    urn:cite2:hmt:pers:pers1

    24.338 Πηλείωνα
    24.394 Ἀχιλλεὺς
    24.406 Πηληιάδεω Ἀχιλῆος

---

## HMT in 2018

In parallel:

-   editing multiple MSS
-   revalidating previous MSS

---


## 2.  Multivalence is ambiguity

-   every TEI `choice` is digitally ambiguous
-   requires full object model to process correctly



---

##  *ex una, plures*

1.  Archival edition in TEI
2.  Publishable editions in simple text format

---

## Citable EXchange format (CEX)

-   delimited text:  URN + text
-   complete under OHCO2
-   text content: whitespace-separated tokens

---

## Delimited text example

    urn:cts:greekLit:tlg5026.msA.hmt:1.2.lemma#μῆνις
    urn:cts:greekLit:tlg5026.msA.hmt:1.2.comment#παρὰ τὸ μένω μῆνις ὡς ἐνὸς ἦνις · οἱ δὲ περὶ Γλαύκωνα τὸν Ταρσέα ἠξίουν ὀξύνειν τὸ ὄνομα οὐκ ὀρθῶς .
    urn:cts:greekLit:tlg5026.msA.hmt:1.3.lemma#ἄειδε

---


## Editions

Examples:

-   pure diplomatic
-   scribally corrected
-   orthographically normalized

---


## Consequences

-   each suited to distinct kinds of analysis
-   all editions automatically aligned


---

## Reading across aligned diplomatic editions

-   appearance of abbreviations in *Iliad* vs scholia
-   scribal alternatives in Bankes papyrus compared to Aristarchan readings in  *Iliad* scholia


---


Bankes papyrus (2nd c CE?)

![Bankes papyrus](imgs/hawara-corr.jpg)

---

>**Digital** editions for **digital** readings

---

## Editions aren't just for people


-   morphologically parsed edition
-   metrically analyzed *Iliads*
-   texts optimized for Topic Modelling

---


## Examples from 2017

Unravelling transmission of *Iliad* scholia:


-   **Charlie Schufreider**:   distribution of topics by zones
-   **Melody Wauke**:  machine learning model of Aristarchan language

---


![machine mediation](imgs/conf-free.png)

---

## General conclusions

-   digital editions *always* mediated by machine
-   syntax is not enough:  *model/specification/implementation*
-   editing, reading, analysis converge

---


# Thank you!


`nsmith@holycross.edu`
