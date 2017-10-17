# Recovering the history of Iliadic scholia: architecture and initial results from the Homer Multitext project

Melody Wauke, Charles Schufreider and Neel Smith (College of the Holy Cross)[^1]


[^1]:  The work presented here was developed in independent but coordinated undergraduate theses by Wauke and Schufreider, for which Smith served as an advisor.


## Overview

The Venetus A manuscript of the *Iliad* (Marciana 454 = 822) is uniquely important for Homerists.  The scholarly notes (or *scholia*) that often fill the margins of the manuscript's pages cite scholars as early as the first Alexandrian editors of the *Iliad*, and in some cases quote readings of those scholars not known elsewhere in the manuscript tradition.  Since 2010, the main focus of the Homer Multitext project (HMT) has been to prepare digital editions of the texts in the Venetus A manuscript.  In this paper, we outline the design of our digital editions, and show how this architecture supports new kinds of research.  Specifically,  we address two classic problems with new methods:

1.  First, how should we interpet the physical organization of this uniquely rich manuscript?  Can we identify the function of the carefully planned, distinct zones of the page layout?
2.  Second, can we find evidence for the work of antiquity's most influential editor, Aristarchus of Samothrace?

These questions offer complementary perspectives on the transmission of ancient scholarship on the *Iliad* to us.  The first perspective is synchronic:  using topic modelling, we show that the zones of the page layout are characterized by distinct patterns of language.  The tenth-century scribe planned the page layout to accommodate different kinds of material, most easily explained as material deriving from distinct sources.

The second perspective is synchronic.  We construct a machine-learning model to identify verbatim language of Aristarchus, and show how this model can find material preserving Aristarchus' own words in any zone of the manuscript (and thus transmitted through the distinct sources represented in each zone).

## The Venetus A


Starts with Villoison and Wolff.

But never completely published. Best edition to date Dindorf, but he omits zones and conflates zones as discussed below.


Most frequently used modern edition Erbse.  Omits 20% of content.[^erbseissues]

[^erbseissues]:  We would like to acknowledge the work  of Melissa Browne (now Melissa Toomey) and Frank Hartel who in 2010 edited books 3 and 4 of the Venetus A scholia, and cross-indexed their editions with the digital text of Erbse in Northwestern University's WordHoard software (http://wordhoard.northwestern.edu/).  Comparing their complete text with Erbse's text revealed that, measured in numbers of words, approximately 20% of the text content of the Venetus A is absent from Erbse's edition.

Problematic.

Editions




In this paper we emphasize the architecutre that made these results possible.

Our understanding of editing:

-   archival versus "readable" / "publishable" editions of a text
-   reading for a specific purpose

Automated alignment of distinct versions from citation

And...


pattern of

> abstract model -> specification -> implementation





The

Venetus A and the Homeric problem




## Digital editing:

## from *document* to *edition*


Neel Smith

October 6, 2017

---


>How do we create **digital** editions for **digital** reading?



## Digital reading

-   different scales
-   both directed and latent pattern recognition
-   digital "future proofing"



## 1. The Homer Multitext

## Original idea

Ebbott and Dué (2005):

>As many Homers as you please



## Canonical citation


-   align different *Iliad*s
-   disagree about editions




![Critical apparatus](imgs/allen-sample.png)

## Citing texts


The *Canonical Text Service (CTS) URN*:


-   congruent with traditional citation practice
-   pairs two hierarchies (work, and passage)
-   technology-independent URN


## A general pattern

1.  abstract model
2.  specification (syntax)
3.  implementation


## Abstract model

>Ordered hierarchy of citation objects (OHCO2)




## Syntax

    urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.7

![Anatomy of a CTS URN](imgs/cts-urn.gif)



## Code implementations

Best tested: scala, cross-compiles for JVM and JS




## Source material

-   multiple documents in one MS
-   no canonical citation for *scholia*
-   layout and design part of semantics



## Diplomatic edition



![Digital diplomatic edition](imgs/dsemod.png)


## Citing objects

## Model

-   versioned collections of...
-   unique objects with...
-   same set of properties across a version

## Syntax

The CITE2 URN


E.g., a page of a manuscript:

    urn:cite2:hmt:msA.v1:12r

![Anatomy of a CITE2 URN](imgs/12r-urn.gif)

## Citing images

Extended citation

    urn:cite2:hmt:vaimg.2017a:VA012RN_0013@0.2079,0.2107,0.1655,0.01806

![Extended citation for images](imgs/img-roi.gif)


(See an [image citation tool](http://www.homermultitext.org/ict2))



## Digital diplomatic edition

-   falsifiable:  citable visual evidence
-   complete (HMT: "every anthropogenic mark")


# Traditional (print) critical editions

-   selective evidence (app.crit.) for...
-   a version extant in no source...
-   using an ambiguous notation



## 2. Editions, archival and publishable

## ἔκδωσις  / editio / edition / Ausgabe


## Access

1.  legal
2.  technical
2.  semantic




## Legal accesibility


A solved problem:

-   license for **reuse** (e.g., CC), or
-   public domain



## Technical accessibility

-   public version control (github)
-   human-readable formats
-   simplest format that is expressively complete



## Result: TEI XML




## Semantically accessible?

Not yet...  for two reasons



## 1. Whose TEI?

> Using TEI in 2017 guarantees you can **not** simply exchange data!


## Validation beyond TEI syntax


1.   syntax: validate TEI usage against *project* standards
2.   editorial content: validate identifiers
3.   text: validate morphology



## Requires an abstract model!

1.  editors' manual (specification)
2.  code implementation
3.  code implementation applied to TEI document


## Application in HMT

-   200 contributors able to validate their work
-   (but model has evolved)

## Computer-assisted *verification*


    urn:cite2:hmt:pers:pers1

    24.338 Πηλείωνα
    24.394 Ἀχιλλεὺς
    24.406 Πηληιάδεω Ἀχιλῆος

## HMT in 2018

In parallel:

-   editing multiple MSS
-   revalidating previous MSS


## 2.  Multivalence is ambiguity

-   every TEI `choice` is digitally ambiguous
-   requires full object model to process correctly



##  *ex una, plures*

1.  Archival edition in TEI
2.  Publishable editions in simple text format


## Citable EXchange format (CEX)

-   delimited text:  URN + text
-   complete under OHCO2
-   text content: whitespace-separated tokens

## Delimited text example

    urn:cts:greekLit:tlg5026.msA.hmt:1.2.lemma#μῆνις
    urn:cts:greekLit:tlg5026.msA.hmt:1.2.comment#παρὰ τὸ μένω μῆνις ὡς ἐνὸς ἦνις · οἱ δὲ περὶ Γλαύκωνα τὸν Ταρσέα ἠξίουν ὀξύνειν τὸ ὄνομα οὐκ ὀρθῶς .
    urn:cts:greekLit:tlg5026.msA.hmt:1.3.lemma#ἄειδε

## Editions

Examples:

-   pure diplomatic
-   scribally corrected
-   orthographically normalized


## Consequences

-   each suited to distinct kinds of analysis
-   all editions automatically aligned


## Reading across aligned diplomatic editions

-   appearance of abbreviations in *Iliad* vs scholia
-   scribal alternatives in Bankes papyrus compared to Aristarchan readings in  *Iliad* scholia



>**Digital** editions for **digital** readings

## Editions aren't just for people


-   morphologically parsed edition
-   metrically analyzed *Iliads*
-   texts optimized for Topic Modelling

## General conclusions

-   digital editions *always* mediated by machine
-   syntax is not enough:  *model/specification/implementation*
-   editing, reading, analysis converge
