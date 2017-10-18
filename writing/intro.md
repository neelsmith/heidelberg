# Recovering the history of Iliadic scholia: architecture and initial results from the Homer Multitext project

Melody Wauke, Charles Schufreider and Neel Smith (College of the Holy Cross)[^1]


[^1]:  The work presented here was developed in independent but coordinated undergraduate theses by Wauke and Schufreider, for which Smith served as an advisor.


## Overview

The Venetus A manuscript of the *Iliad* (Marciana 454 = 822) is uniquely important for Homerists.  The scholarly notes (or *scholia*) that often fill the margins of the manuscript's pages cite scholars as early as the first Alexandrian editors of the *Iliad*, and in some cases quote them for readings of the *Iliad* not known elsewhere in the manuscript tradition.  Since 2010, the main focus of the Homer Multitext project (HMT) has been to prepare digital editions of the texts in the Venetus A manuscript.  In this paper, we outline the design of our digital editions, and show how this architecture supports new kinds of research.  Specifically,  we apply new methods to two classic problems.

1.  How should we interpet the physical organization of this uniquely rich manuscript?  Can we identify the function of the carefully planned, distinct zones of the page layout?
2.  Can we find evidence for the work of antiquity's most influential editor, Aristarchus of Samothrace?

These questions offer complementary perspectives on the transmission of ancient scholarship on the *Iliad* to us.  The first perspective is synchronic. Using topic modelling, we show that the zones of the page layout are characterized by distinct patterns of language.  The scribe of the Venetus A, in other words, planned the page layout to accommodate different kinds of material.  This is most easily explained as material deriving from distinct sources, and so suggests that the tenth-century scribe is creating a unique manuscript drawing on multiple sources no longer extant.

The second perspective is diachronic.  We construct a machine-learning model to identify verbatim language of Aristarchus, and show how this model can find material preserving Aristarchus' own words in any zone of the manuscript.  This shows us that Aristarchus' words reached the scribe of the Venetus A via different sources.


## The Venetus A *scholia*

Since the discovery of the Venetus A manuscript by Villoison[^villoison] in 1788 and the extended discussion of its *scholia* in Wolf's seminal *Prolegomena ad Homerum* of 1795, the manuscript's *scholia* have been central to scholarship on "the Homeric question."  It is all the more remarkable that they have never been fully published.

[^villoison]: *Homeri Ilias ad veteris codicis veneti fidem recensita. Scholia in eam antiquissima ex eodem codice aliisque, nunc primum edidit cum asteriscis, obeliscis aliisque signis criticis Joh. Baptista Caspar d'Ansse de Villoison* (Venice, 1788: Typis et Sumptibus Fratrum Coleti).

The Homer Multitext edition is filling this gap.  The work we describe here analyzes eighteen books from the Homer Multitext edition of the Venetus A, comprising roughly 8000 *scholia*.  We expect that in the coming year, the HMT will offer a complete edition of the Venetus A with approximately 10,000 *scholia*.  Because each scholion is indexed to visual evidence and its location on a page, our analysis can combine the textual content of the *scholia* with information about their layout, and with other features such as the editorial signs associated with more than 10% of the *Iliad* lines.  Because our edition is digital, we can systematically and comprehensively apply our analyses to the HMT editions.   Prior to the HMT, the fullest edition was that of Dindorf (1875), but, as we discuss below, he does not  distinguish scholia placed in the distinct intermarginal and interior zones of the page.  The most recent edition of the *scholia* is by Erbse,[^erbse] which is also the basis for the digital text included in the datasets of Northwestern University's WordHoard software.[^wordhoard]   Erbse's edition omits 20% of the content in the Venetus A.[^erbseissues], including only those *scholia* he classifies as "*vetera*."  It is therefore impossible to draw a non-biased sample of data from this digital data set.  By contrast, since the eighteen books we analyze here include every word, symbol or other mark seen by HMT editors, we are confident that the broad outlines of our conclusions will be valid for all of the Venetus A.  In any event, our conclusions can in the future be tested against the publicly available editions of the HMT when a complete Venetus A is available.

[^wordhoard]: http://wordhoard.northwestern.edu/


[^erbse]: *Scholia Graeca in Homeri Iliadem (Scholia vetera)* (De Gruyter, 1969-1988) in five volumes with two additional volumes of indices.

[^erbseissues]:  We would like to acknowledge the work  of Melissa Browne (now Melissa Toomey) and Frank Hartel who in 2010 edited books 3 and 4 of the Venetus A *scholia*, and cross-indexed their editions with the digital text of Erbse in WordHoard.   Comparing their complete text with the digital Erbse revealed that, measured in numbers of words, approximately 20% of the text content of the Venetus A is absent from Erbse's edition.

## When is a digital document a digital edition?

Within the Homer Multitext project, the experience of editing the Venetus A manuscript has prompted extended reflection and debate about what it means to edit a text.  What changes when an edition is digital?  All of us are excited about emerging possibilities of digital reading at multiple scales:  not just systematic searching, but "reading" to identify latent patterns we don't even know to search for.  How do we create *digital* editions that can support a full range of *digital* reading, including digital methods we have not yet imagined?

We take as a point of departure the central idea of the Greek term ἔκδωσις, and its calques in various modern languages (*editio*, edition, Ausgabe...)  An edition is first and foremost *giving away* a version of a text.  Using analog technologies, giving away a physical artifact (whether printed book, vellum codex or papyrus scroll) makes available to the new owner every possibility of analog reading.  To make every possibility of digital reading available when we give away a digital edition, we need to plan for three kinds of access.  A digital edition must by *legally*, *technically* and *semantically* accessible.


*Legal accesibility* is a well understood problem in 2017, and well defined solutions are readily available.  A digital edition must be licensed for reuse so that automated reading of the edition can proceed without limitation by requirements for special permissions.  The Homer Multitext project uses Creative Commons licenses permitting reuse for all of its digital content.

*Technical accessibility* has also been extensively studied.  To ensure that our editions remain technically accessible they must be in openly specified, plain-text formats.  The ideal is the simplest possible format that is also expressively complete.  Like most digital editorial projects, the Homer Multitext uses XML to produce semantically encoded editions following the guidelines of the Text Encoding Initiative (TEI).

If the scholarly community has well defined solutions to these problems, however, we lack any comparable consensus on how to make an edition *semantically* accessible.  It may once have been a goal of the TEI to facilitate interchange of texts, but the reality today is that using XML following TEI guidelines guarantees that you can *not* simply exchange texts with other projects.  The guidelines are rich, and frequently offer multiple recommended solutions to a problem;  the generic schemas for validating TEI following the guidelines allow multiple possible embeddings and sequences of elements even when the editor intends to follow a single recommendation.[^teiambig]  Alternative readings are a further complication:  every form of TEI `choice` element presents an ambiguity that a digital reader has to resolve.


[^teiambig]:  Consider a simple example that can enormously complicate digital reading of a text.  We can use the TEI `persName` element to identify personal names, and TEI `abbr` to identify abbreviations.  But what is the proper encoding of an abbreviated personal name?  The "TEI-all" schema allows an example like `<persName><abbr>Αριστ</abbr></persName>`;  it also allows `  <abbr><persName>Αριστ</persName></abbr>`.

More generally, XML is limited to validating a given syntax; real semantic accessibility would require that we validate contents as well.

Like many projects, therefore, the HMT has defined its own project standards for using a subset of the TEI guidelines, and imposes 

## Validation beyond TEI syntax


1.   syntax: validate TEI usage against *project* standards
2.   editorial content: validate identifiers
3.   text: validate morphology



## Requires an abstract model!



## A general pattern

1.  abstract model
2.  specification (syntax)
3.  implementation


-   requires full object model to process correctly





## Abstract model

>Ordered hierarchy of citation objects (OHCO2)




1.  editors' manual (specification)
2.  code implementation
3.  code implementation applied to TEI document



##  *ex una, plures*

1.  Archival edition in TEI
2.  Publishable editions in simple text format




## Canonical citation


-   align different *Iliad*s
-   disagree about editions


## Digital diplomatic edition

-   falsifiable:  citable visual evidence
-   complete (HMT: "every anthropogenic mark")









# Traditional (print) critical editions

-   selective evidence (app.crit.) for...
-   a version extant in no source...
-   using an ambiguous notation



## Application in HMT

-   200 contributors able to validate their work
-   (but model has evolved)

## Computer-assisted *verification*


See forthcoming.[^citizenscholar]


[^citizenscholar]: Neel Smith, "Citizen Scholarship in the Homer Multitext Project"  in *Pushing the Boundaries of Historia* (edited by Lee Fratantuono and Mary English) (Routledge: forthcoming).





## Consequences

-   each suited to distinct kinds of analysis
-   all editions automatically aligned


>**Digital** editions for **digital** readings







In this paper we emphasize the architecutre that made these results possible.

Our understanding of editing:

-   archival versus "readable" / "publishable" editions of a text
-   reading for a specific purpose

Automated alignment of distinct versions from citation

And...


pattern of

> abstract model -> specification -> implementation
