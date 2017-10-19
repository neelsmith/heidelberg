# Recovering the history of Iliadic scholia: architecture and initial results from the Homer Multitext project

Melody Wauke, Charles Schufreider and Neel Smith (College of the Holy Cross)[^1]


[^1]:  The work presented here was developed in independent but coordinated undergraduate theses by Wauke and Schufreider, for which Smith served as an advisor.  The discussion of how distinct zones of scholia function is analyzed more extensively in Schuhfreider's thesis;  the identification of Aristarchan material is the further developed in Wauke's thesis.


## Overview

The Venetus A manuscript of the *Iliad* (Marciana 454 = 822) is uniquely important for Homerists.  The scholarly notes (or *scholia*) that often fill the margins of the manuscript's pages cite scholars as early as the first Alexandrian editors of the *Iliad*, and in some cases quote them for readings of the *Iliad* not known elsewhere in the manuscript tradition.  Since 2010, the main focus of the Homer Multitext project (HMT) has been to prepare digital editions of the texts in the Venetus A manuscript.  In this paper, we first outline the design of our digital editions (Setion 1), then show how this architecture supports new kinds of research.  Specifically,  we apply new methods to two classic problems.

-  How should we interpet the physical organization of this uniquely rich manuscript?  Can we identify the function of the carefully planned, distinct zones of the page layout? (Section 2)
2.  Can we find evidence for the work of antiquity's most influential editor, Aristarchus of Samothrace? (Section 3)

These questions offer complementary perspectives on the transmission of ancient scholarship on the *Iliad* to us.  The first perspective is synchronic. Using topic modelling, we show that the zones of the page layout are characterized by distinct patterns of language.  The scribe of the Venetus A, in other words, planned the page layout to accommodate different kinds of material.  This is most easily explained as material deriving from distinct sources, and so suggests that the tenth-century scribe is creating a unique manuscript drawing on multiple sources no longer extant.

The second perspective is diachronic.  We construct a machine-learning model to identify verbatim language of Aristarchus, and show how this model can find material preserving Aristarchus' own words in any zone of the manuscript.  This shows us that Aristarchus' words reached the scribe of the Venetus A via different sources.


# Section 1

## The Venetus A *scholia*

Since the discovery of the Venetus A manuscript by Villoison[^villoison] in 1788 and the extended discussion of its *scholia* in Wolf's seminal *Prolegomena ad Homerum* of 1795, the manuscript's *scholia* have been central to scholarship on "the Homeric question."  It is all the more remarkable that they have never been fully published.

[^villoison]: *Homeri Ilias ad veteris codicis veneti fidem recensita. Scholia in eam antiquissima ex eodem codice aliisque, nunc primum edidit cum asteriscis, obeliscis aliisque signis criticis Joh. Baptista Caspar d'Ansse de Villoison* (Venice, 1788: Typis et Sumptibus Fratrum Coleti).

The Homer Multitext edition is filling this gap.  The work we describe here analyzes eighteen books from the Homer Multitext edition of the Venetus A, comprising roughly 8000 *scholia*.  We expect that in the coming year, the HMT will offer a complete edition of the Venetus A with approximately 10,000 *scholia*.  Because each scholion is indexed to visual evidence and its location on a page, our analysis can combine the textual content of the *scholia* with information about their layout, and with other features such as the editorial signs associated with more than 10% of the *Iliad* lines.  Because our edition is digital, we can systematically and comprehensively apply our analyses to the HMT editions.   Prior to the HMT, the fullest edition was that of Dindorf (1875), but, as we discuss below, he does not  distinguish scholia placed in the distinct intermarginal and interior zones of the page.  The most recent edition of the *scholia* is by Erbse,[^erbse] which is also the basis for the digital text included in the datasets of Northwestern University's WordHoard software.[^wordhoard]   Erbse's edition omits 20% of the content in the Venetus A,[^erbseissues] including only those *scholia* he classifies as "*vetera*."  It is therefore impossible to draw a non-biased sample of data from this digital data set.  By contrast, since the eighteen books we analyze here include every word, symbol or other mark seen by HMT editors, we are confident that the broad outlines of our conclusions will be valid for all of the Venetus A.  In any event, our conclusions can in the future be tested against the publicly available editions of the HMT when a complete Venetus A is available.

[^wordhoard]: http://wordhoard.northwestern.edu/


[^erbse]: *Scholia Graeca in Homeri Iliadem (Scholia vetera)* (De Gruyter, 1969-1988) in five volumes with two additional volumes of indices.

[^erbseissues]:  We would like to acknowledge the work  of Melissa Browne (now Melissa Toomey) and Frank Hartel who in 2010 edited books 3 and 4 of the Venetus A *scholia*, and cross-indexed their editions with the digital text of Erbse in WordHoard.   Comparing their complete text with the digital Erbse revealed that, measured in numbers of words, approximately 20% of the text content of the Venetus A is absent from Erbse's edition.

## When is a digital document a digital edition?

Within the Homer Multitext project, the experience of editing the Venetus A manuscript has prompted extended reflection and debate about what it means to edit a text.  What changes when an edition is digital?  All of us are excited about emerging possibilities of digital reading at multiple scales:  not just systematic searching, but "reading" to identify latent patterns we don't even know to search for.  How do we create *digital* editions that can support a full range of *digital* reading, including digital methods we have not yet imagined?

We take as a point of departure the central idea of the Greek term ἔκδωσις, and its calques in various modern languages (*editio*, edition, Ausgabe...)  An edition is first and foremost *giving away* a version of a text.  Using analog technologies, giving away a physical artifact (whether printed book, vellum codex or papyrus scroll) makes available to the new owner every possibility of analog reading.  To make every possibility of digital reading available when we give away a digital edition, we need to plan for three kinds of access.  A digital edition must by *legally*, *technically* and *semantically* accessible.


*Legal accesibility* is a well understood problem in 2017, and well defined solutions are readily available.  A digital edition must be licensed for reuse so that automated reading of the edition can proceed without limitation by requirements for special permissions.  The Homer Multitext project uses Creative Commons licenses permitting reuse for all of its digital content.

*Technical accessibility* has also been extensively studied.  To ensure that our editions remain technically accessible they must be in openly specified, plain-text formats.  The ideal is the simplest possible format that is also expressively complete.  Like most digital editorial projects, the Homer Multitext uses XML to produce semantically encoded editions following the guidelines of the Text Encoding Initiative (TEI).

If the scholarly community has well defined solutions to these problems, however, we lack any comparable consensus on how to make an edition *semantically* accessible.  It may once have been a goal of the TEI to facilitate interchange of texts, but the reality today is that using XML following TEI guidelines guarantees that you can *not* simply exchange texts with other projects.  The guidelines are rich, and frequently recommend multiple possible solutions to an encoding problem;  even when the editor intends to follow a single recommendation, the generic schemas for validating TEI following the guidelines allow multiple possible embeddings and sequences of elements.[^teiambig]  Alternative readings are a further complication:  every form of TEI `choice` element presents an ambiguity that a digital reader has to resolve.


[^teiambig]:  Consider a simple example that can enormously complicate digital reading of a text.  We can use the TEI `persName` element to identify personal names, and TEI `abbr` to identify abbreviations.  But what is the proper encoding of an abbreviated personal name?  The "TEI-all" schema allows an example like `<persName><abbr>ΑΡΙΣΤ</abbr></persName>`;  it also allows `  <abbr><persName>ΑΡΙΣΤ</persName></abbr>`.

More generally, XML is limited to validating a given syntax; real semantic accessibility would require that we validate contents as well.  Like many projects, therefore, the HMT has defined not only its own project-specific guidelines for using a subset of the TEI guidelines, but also editorial standards for encoding the contents of the documents.

In 2014 and 2015, we began to go beyond simply giving editors a document with prose guidelines.  We identified abstract features of our editions (for example, "editions must distinguish numeric tokens from alphabetic tokens," or "personal names are disambiguated with unique identifiers").  We specified an XML syntax for representing each feature (e.g., "numeric tokens are tagged with TEI `num`," or "the `n` attribute of the TEI `persName` should have a valid URN value from the HMT collection of personal name identifiers").  At the same time, we implemented each feature in an object model that could parse XML and evaluate whether it complies with our specifications.  We are currently working with an implementation of the full model of HMT editions written in Scala.[^textmodel]


[^textmodel]: Like all our work, the impelmentation is available from publicly visible github repositories. See https://github.com/homermultitext/hmt-textmodel  We would especially like to thank HMT Project Manager Stephanie Lindeborg of Boston Latin Academy for her work on this part of the project.

Our initial motivation was to create an editors' manual specifying syntax and restrictions on contents (such as allowed character encodings, and controlled vocabularies for identifiers), and a parallel implementation in code so that all contributors could validate their work in progress against a single, machine-enforced standard.[^citizenscholar] In 2016-2017, the co-authors began to leverage the same code library to generate multiple, semantically unambiguous editions from a single, rich XML source.  TEI XML documents validated against our project standards serve as archival editions, from which we create plain-text editions without any XML markup.  We can, for example, generate pure diplomatic plain-text editions, or plain-text editions reflecting scribal corrections, or editions normalized against modern orthographic practices.  Because all of our plain-text editions are derived from a single, canonically citable source, they can be automatically aligned.  We can identify exactly which token in one edition correspond to a given token in another edition.


[^citizenscholar]: For a discussion of some of the ways this has made it possible for the HMT to accept contributions from more than 150 team members, see Neel Smith, "Citizen Scholarship in the Homer Multitext Project"  in *Pushing the Boundaries of Historia* (edited by Lee Fratantuono and Mary English) (Routledge: forthcoming).

At this point we are no longer limited to producing editions for immediate reading by humans:  reading is not just for people any more.  We can create editions for specific kinds of reading, including specific kinds of automated reading.


# Section 2

## Analyzing layout and content in the Venetus A

![Folio 12 recto](https://raw.githubusercontent.com/neelsmith/heidelberg/master/imgs/DSE2.JPG)

Figure 1 illustrates folio twelve recto of the Venetus A manuscript, the first page to contain text from the *Iliad*.  The text of the *Iliad* is in the middle of the page written in a larger hand and darker ink.  The colored overlays highlight distinct zones of *scholia* found on a typical page: main scholia (shown in yellow), intermarginal scholia (red), interior scholia (blue), and exterior scholia (green).  A fifth zone is made up of the interlinear scholia (not highlighted with a color here, but visible as the notes in a smaller script in between lines of the *Iliad* text). While not every folio of the Venetus A contains all five types of scholia, every folio maintains the spatial integrity of the five zones: if there are no exterior scholia on a particular folio, for example, the scribe will respect the space allowed for exterior scholia, and will not expand other scholia into this zone.

While the difference in placement on the page for these five distinct zones of Venetus A scholia is  obvious to any casual reader of the manuscript, the difference in function among these zones is much less evident. Why should a scribe place a scholion in any particular zone as opposed to another?

Nineteenth-century scholars debated this question extensively.  Karl Dindorf, in the preface to his 1875 edition of the Venetus A scholia, argues that the interlinear zone presents no more than glosses on the words which lie below them (Dindorf 1875, ix), and indeed this does seem to be their primary function. As for the exterior scholia, T. W. Allen (Allen 1899) argued that these scholia are the result of an editorial pass through the manuscript (181). For Allen, the main, intermarginal, and interior scholia were all written by the same scribe, but the exterior scholia were undoubtedly the work of a different scribe checking the work of the previous scribe against the original sources for the manuscript, and making corrections when necessary in the outer margin (172).

Here we focus on the much less clear relationship among the other three zones of scholia: the main, intermarginal, and interior scholia. Dindorf observed that many of the intermarginal and interior scholia present the same or nearly the same content as the main scholia, and sometimes even use exactly the same wording. To him, these shorter intermarginal and interior scholia appeared to be nothing more than redacted versions of the main scholia (Dindorf 1875, vii). From his observations, Dindorf concluded that the intermarginal, interior, and main scholia must have come from similar, though still subtly different sources (vii). However, it is worth noting that when Dindorf uses the phrase *intermarginalia scholia* in his preface, he is actually referring to what the Homer Multitext would consider the distinct intermarginal and interior zones (Dindorf, vii). While the precise wording of Dindorf's definition of the *intermarginalia scholia* in his preface is potentially confusing, he explains that his edition marks all the scholia which he refers to as the *intermarginalia* with an asterisk so as to avoid confusing them with the main scholia (Dindorf, ix). It is clear from his edition that scholia which the HMT would call interior are marked with an asterisk alongside those which the HMT would also call intermarginal. Dindorf was not alone in this treatment of these two zones of the scholia: T. W. Allen similarly uses the single term "intermarginal" to refer to the two physically distinct zones (181). Thus, for Dindorf and Allen, there was no meaningful difference between what we call "interior" and "intermarginal" scholia; they were considered functionally equivalent.

We used topic modelling to explore the content of scholia in these three zones, and to highlight  ways the content of the various zones might differ quantitatively.  Specifically, we used the R-language implementation of the Latent Dirichlect Allocation (LDA) algorithm in Thomas Köntges' ToPan.[^topan] Each scholion was treated as a distinct document.


[^topan]: Available on github from https://github.com/ThomasK81/ToPan


Topic modelling requires a carefully prepared text.  We derived a series of plain-text editions from our archival TEI source until we had a citable edition that was optimized for topic modelling.

We began from a reading of the archival text that expanded abbreviations to their full form.  From this, we derived a second edition that normalized Byzantine orthography to modern orthographic standards, and resolved named entities to unique identifiers.  (Each of the many scholars named "Ptolemy" could then be distinguished, for example.)  This edition formed the basis of a lemmatized edition.  We used the Morpheus parsing system from the Perseus project to "edit" our text, so that all tokens were presented as identifiers for lemmatized lexical entities.  Because our citation scheme was aligned across all these editions, we could readily compare surface forms in modern or Byzantine orthography with the lemmatized tokens.

Finally, we created a version suitable for topic modelling by curating a list of stop words, and removing those tokens from the orthographically normalized edition.


Because topic modelling requires users to define the number of topics the program should produce, we manually analyzed the results of experiments with differing number of topics. Generating too many topics risks not observing meaningful patterns since they may be arbitrarily split up into more topics than necessary. On the contrary, producing too few topics can render topics meaningless  by lumping together topics that we would like to distinguish. Ultiamtely, we found that fifteen was a good compromise for our analysis.

One of the advantages of ToPan is that it produces a clear visualization of the topic modelling results, as illustrated in Figure 2.

![15-topic model via ToPan](https://raw.githubusercontent.com/neelsmith/heidelberg/master/imgs/TranslatedToPan9.jpg)

In this visualization, each of the circles on the left represents a different topic; when a topic is highlighted, the words which are most strongly associated with the topic are listed on the right. (For clarity, English translations of each of the most strongly associated words have been provided in Figure 2.) Though the topic modelling results actually exist in a multidimensional space, the results in this visualization are reduced into a two-dimensional plane using principal components analysis. The distance between circles reflects how closely related the topics are.

For the purposes of this paper we will illustrate one important result with the example of a singe topic.[^charliethesis]  Recall that a "topic" in a topic model is defined as a repeated pattern of co-occurring words. In the topic illustrated here (topic 9) we see that the names of Aristarchus of Samothrace,  Zenodotus of Ephesus and Aristophanes of Byzantium are prominent.  All were head of the library of Alexandria at some point in the third and second centuries B.C.E.  and all three produced editions of the *Iliad* known only through references such as the *scholia* to the Venetus A.   Looking at the most significant terms in this topic and reading specific scholia classified as predominantly composed of topic 9, we interpreted this recurring pattern  as the "Aristarchus topic," where the editorial work of Aristarchus is discussed and often compared to his predecessors.

[^charliethesis]:  For more detailed discussion of the results of this topic modelling, Schufreider's 2017 thesis will be available from the Holy Cross Library's institutional repository.


It would be interesting and telling if this topic were to appear with a greater frequency in any of the three zones of interest (main, intermarginal, and interior). While the ToPan visualization shows relations of different word patterns, the visualization alone does not give information about what scholia are strongly or weakly associated with each of the topics. However, ToPan does offer robust data tables providing exactly this information. Using these tables, we were able to analyze how strongly the Aristarchus topic is associated with each scholion since this relationship is scored quantitavtively by the software. This quantitaive measure, the theta-score, is scaled from 0 to 1. Were a scholion to have a theta-score of 0.0 with respect to a particular topic, this would indicate that this particular scholion contains no content from that particular topic. Conversely, a theta-score of 1.0 would indicate that the content of this scholion would likely come from this topic alone.

Our goal was to move beyond  analyzing individual scholia to analyzing scholia by zone. Using the theta-tables, we identified the proportion of scholia within each zone (main, intermarginal, and interior) which were strongly associated with the Aristarchus topic. We defined a "strong association" as a scholion having a theta-score equal to or greater than 0.9. The following table summarizes the results.


| Zone                          | Total distribution in Venetus A | Distribution within Aristarchus Topic |
|:------------------------------|:--------------------------------|:--------------------------------------|
| Main scholia (yellow)         | 3597 (45.3%)                    | 45 (32.37%)                         |
| *Intermarginal scholia (red)* | *1219 (15.4%)*                  | *65 (46.76%)*                       |
| Interior scholia (blue)       | 819 (10.3%)                     | 28 (20.14%)                         |

The second column presents the percentage of our corpus of eighteen Venetus A books represented by each zone of scholia.   The third column, presents the percentage of the scholia that are strongly associated with the Aristarchus topic. (The percentages do not add up to 100% because this table does not include the interlinear or exterior scholia that are not the focus of this analysis.) We highlight the middle row: the intermarginal scholia make up only about 15% of all the scholia in the eighteen books of the Venetus A we analyzed, but about 47% of all scholia strongly associated with the Aristarchus topic are from the intermarginal zone.  Not only does the intermarginal zone preserve a greater proportion of the Aristarchus scholia than the main zone (47% to 32%):   the proportion is more than twice the proportion of intermarginal scholia within the manuscript overall (only 15% vs. 45%). The Aristarchus topic is disproportionately concentrated within the intermarginal scholia.

Since a "topic" is defined as words which co-occur frequently, this means that the particular pattern of co-occurring words identified by the topic model occurs more in one zone than another. There are other ways to talk about Aristarchus (his name does appear as a significant term in other topics), but this pattern in which Zenodotus, Aristophanes and discussion of editorial decisions all figure prominently along with Aristarchus is heavily concentrated in the intermarginal zone.   At the same time, we can see that the main and interior scholia still constitute significant proportions of the scholia strongly associated with this topic (32.37% and 20.14%, respectively).

That points to a larger conclusion. The distribution of topics across zones of the scholia can vary greatly:  the zones demonstrably differ from each other in the balance of topics they present.  Some topics are more evenly distributed across zones, but the concentration of topics such as the Aristarchus topic shows that the layout of the manuscript's pages predefines zones that are used for distinct patterns of language.

For most of these patterns, we can readily interpret the subject, just as we interpreted topic 9 to be about discussion of Aristarchus' editorial activity.  Viewed systematically, the topics that predominate in the interior and intermarginal zones cannot be simply reduced to summaries or alternate versions of material appearing in the main scholia.

To account for the concentration of some topics in particular zones while at the same time recognizing that no topic is entirely exclusively to a single zone we believe that the simplest explanation is that the scribe intended the five zones for material from five distinct sources.  There is some overlap in topics across zones because the sources used by the Venetus A scribe incorporate some common material that made its way from antiquity to the tenth century via different paths in different forms.
