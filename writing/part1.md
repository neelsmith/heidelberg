

# Section 2

## Analyzing layout and content in the Venetus A

![Folio 12 recto](https://raw.githubusercontent.com/neelsmith/heidelberg/master/imgs/DSE2.JPG)

Figure 1 illustrates folio twelve recto of the Venetus A manuscript, the first page to contain text from the *Iliad*.  The text of the *Iliad* is in the middle of the page written in a larger hand and darker ink.  The colored overlays highlight distinct zones of *scholia* found on a typical page: main scholia (shown in yellow), intermarginal scholia (red), interior scholia (blue), and exterior scholia (green).  A fifth zone is made up of the interlinear scholia (not highlighted with a color here, but visible as the notes in a smaller script in between lines of the *Iliad* text). While not every folio of the Venetus A contains all five types of scholia, every folio maintains the spatial integrity of the five zones: if there are no exterior scholia on a particular folio, for example, the scribe will respect the space allowed for exterior scholia, and will not expand other scholia into this zone.

While the difference in placement on the page for these five distinct zones of Venetus A scholia is  obvious to any casual reader of the manuscript, the difference in function among these zones is much less evident. Why should a scribe place a scholion in any particular zone as opposed to another?

Nineteenth-century scholars debated this question extensively.  Karl Dindorf, in the preface to his 1875 edition of the Venetus A scholia,[^bigD] argues that the interlinear zone presents no more than glosses on the words which lie below them (Dindorf 1875, ix), and indeed this does seem to be their primary function. As for the exterior scholia, T. W. Allen[^twa] argued that these scholia are the result of an editorial pass through the manuscript (181). For Allen, the main, intermarginal, and interior scholia were all written by the same scribe, but the exterior scholia were undoubtedly the work of a different scribe checking the work of the previous scribe against the original sources for the manuscript, and making corrections when necessary in the outer margin (172).

[^bigD]:  *Scholia Graeca in Homeri Iliadem*. Edited by Karl Wilhelm Dindorf. (Oxford UP, 1875).  Available online from the HMT project at  <http://www.homermultitext.org/pd-pdfs/Dindorfius1875a.pdf>.



[^twa]:   Allen, T. W. "On the Composition of Some Greek Manuscripts: The Venetian Homer," *Journal of Philology* 26, 1899, 161-181.  Available online from the HMT project at <http://www.homermultitext.org/pd-pdfs/Allen-JP-1899.pdf>.

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
