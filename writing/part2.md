


# Section 3


## Finding the language of Aristarchus


How influential were the Alexandrian editors in shaping the written *Iliad* that we have today?  What role did the editions of Zenodotus, Aristophanes and Aristarchus play in narrowing down the multiformity of the earliest written versions of the *Iliad*  to the relatively homogeneous text we find in the medieval manuscripts?

The *scholia* of the Venetus A offer a window on the editorial work of scholars from the Alexandrians through late antiquity.  The manuscript itself provides very little information about the sources of its *scholia*, however. At the end of several books of the *Iliad*, a subscription cites four scholars of the first and second centuries C.E. However, the *scholia* themselves frequently refer to scholars from later periods, so the subscription does not provide us with a complete view of the sources lying behind the *scholia*.

With the digital edition of the HMT, can we pinpoint specific source material for the *scholia* with more precision than has been achieved previously?  In particular, can we identify material stemming directly from the editions of Aristachus? To address these questions, we constructed a machine-learning model for identifying  *scholia* that can be directly associated with Aristarchus.


## Defining a feature set


In contrast to the unsupervised classification of topic modelling, we build our classifier from a manually analyzed set of training data.  A second set of manually analyzed data is then used to evaluate the performance of the model.  The resulting model can be applied to arbitrarily large sets of data.

Our first step, then, was to identify features that mark *scholia* as "Aristarchan."   The Venetus A uniquely preserves roughly 2800 critical signs marking noteworthy lines of the *Iliad*, and indicating that a comment discusses some aspect of that line. In the Venetus A, these marks therefore call our attention to lines of main text discussed in *scholia*, but the system was invented by Aristarchus, whose edition of the *Iliad* and commentary on the *Iliad* were two separate documents. The critical signs were especially helpful for readers trying to coordinate two papyrus scrolls: the apearance of a sign in the edition would notify them to check the commentary.  The Venetus A alone has preserved these Aristarchan signs, and while their presence on a line does not guarantee that the corresponding *scholion* is Aristarchan, it unambiguously means that Aristarchus' commentaries originally dicussed this line.[^bird]


[^bird]:  On the Aristarchan critical signs, see Graeme Bird, "Critical Signs—Drawing Attention to 'Special' Lines of Homer's *Iliad* in the Manuscript Venetus A" in *Recapturing a Homeric Legacy* (= Hellenic Studies 35), edited by Casey Dué, pp. 89-115.  Available from  <http://www.homermultitext.org/Pubs/Due_Recapturing_a_Homeric_Legacy.pdf>


*Scholia* on lines marked by Aristarchan critical signs are often introduced with the word "ὅτι," "because" (transliterated "hoti"). This elliptical expression is short for "The [critical] sign is there because..." and indicates that the comment is meant to explain the presence of the critical sign.  Because "hoti" occurs so frequently in *scholia* which are associated with a critical sign, it is likely that the comment introduced by "hoti" was transmitted alongside the critical signs and is therefore Aristarchus' own way of explaining why he placed a critical sign next to a line in his edition. We therefore considered the presence of an initial *hoti* in a *scholion* an Aristarchan feature.

We looked at n-gram frequencies of the text of *scholia*, and stumbled across an unexpectedly clear formula that is characteristic of *scholia* marked by a critical sign and introduced by "hoti".  Aristarchus' edition responded directly to the edition of his predecessor, Zenodotus. While Zenodotus' name appears frequently in the Venetus A, and not just in "hoti" *scholia*, we found that his edition is cited in two distinct ways in the *scholia*.  Outside of the "hoti" *scholia*, he is regularly cited with the preposition παρά (παρὰ Ζηνοδότῳ, "in [the work of] Zenodotus"), as are other editors and scholars.  In the "hoti" scholia, however, he often appears as the subject of the verb γράφω (literally, "to write") when the *scholion* cites his edition.  (In English, we say that editors "read" a particular variant; in Greek, they "write" one version or another.)  Remarkably, no other individual appears as the subject of the verb γράφω in the eighteen books of *scholia* we examined.  This makes perfect sense if it was Aristarchus' practice to cite editors with γράφω, and the practice of later scholars to cite editors with παρά. We therefore considered the expression "Ζηνόδοτος γράφει" ("Zenodotus writes...") to be an indicator of directly Aristarchan language in a *scholion*.


For an automated classification, it is equally valuable to identify features which indicate that a scholion is likely *not* Aristarchan.  Citing Zenodotus with the phrase "παρὰ Ζηνοδότῳ" is negatively correlated with the Aristarchan features we have defined:  it occurs 27 times in the books we examined, but only five of those *scholia* were on lines marked with a critical sign.  Reference to Zendotous using this formula suggests a later source or later reworking of Aristarchus' commentary, so we used th phrase "παρὰ Ζηνοδότῳ" to identify post-Aristarchan language.

The presence of Aristarchus' name in a comment is also an indication that the language of the *scholion* is post-Aristarchan. This is based on the assumption that Aristarchus did not write about himself in the third person. The assumption is strengthened by the fact that Aristarchus' name rarely appears in *scholia* on lines with critical signs.  On the other hand, the names of Aristarchus' *predecessors* appear much more frequently in the *scholia* which are connected with the critical signs, since Aristarchus often disagreed with them by name in these *scholia*. Thus the presence of Aristarchus' name in a scholion indicates some scholar at a later time was writing about him and his work on the *Iliad*.

Similarly, the presence of the name of a post-Aristarchan scholar obviously indicates that the language of the *scholion* is later than Aristarchus.


Each of these features can be treated as a binary value encoded as 0 or 1:  either a scholion begins with "hoti" or it doesn't, etc.  In addition, we realized that we could use results from the previously described topic modelling as features for our classifier.  Two of the topics from the fifteen-topic topic model described were relevant for picking out Aristarchan material.  One was the topic 9 we have examined, where the editorial work of Aristarchus is the subject of discussion.  Contrasting with this, topic 6 was defined by terms associated with Aristarchus’s own language, such as "Zenodotus," "writes" and "athetize."  We interpreted topic 6 as "Aristarchus' own comments."

We used the theta scores for topics 6 and 9 as features in our data for each *scholion*.  To  reiterate, these scores give an indication of how closely the words in a scholion relate to the words of a given topic, and are scaled from 0.0-1.0, with a score closer to 0 meaning the *scholion* is not strongly correlated with the topic in question, and a score closer to 1 meaning that the scholion is very strongly correlated with the topic in question.

Topic 6 consists of words which are strongly associated with Aristarchus' own language, so a high theta score for topic 6 suggests that the language of the *scholion* is strongly Aristarchan.

Since topic 9 consists of words used to discuss Aristarchus, his editions, and other editors, high theta-scores for topic 9 indicate language from a post-Aristarchan source or reworking of his editions.

The final list of eight features included four that we expected to characterize directly Aristarchan material, and four that we expected to characterize later material:

### Aristarchan features

-   Critical sign
-   γράφει (active)
-   Initial ὅτι
-   Higher topic 6 score

### Post-Aristarchan features

-   παρὰ Ζηνοδότῳ
-   Aristarchus' name
-   Post-Aristarchan name
-   Higher topic 9 score


## Training and evaluating a model

Computing the eight features for each *scholion* once more creates a new, citable edition of the text.  In this edition, the text of each scholion is simply eight successive numeric values from 0 to 1.  We to train and evaluate an automated classifier, we set aside a randomly selected sample of 100 *scholia* from the main, intermarginal, and interior zones.

Because our data set was automatically aligned with all our other editions of the *scholia*,  we could then read the text of each of the 100 *scholia* in the test, and assigned it a class. It is important to recognize that this manual classification is based on our own, traditional close reading.  Our arguments for deciding that a *scholion* is Aristarchan or not are the same kind arguments that have been used in *Quellenkritik* of the *scholia* for more than two centuries.  The question an automated classifier can address is how closely the eight features we selected can reproduce those interpretations.

We assigned each of the randomly selected *scholia* to one of four classes.  In addition to our intial goal of classifying *scholia* as "Aristarchan," we split non-Aristarchan scholia  into "paraphrase of Aristarchus" and "post-Aristarchan" classes. We applied the "paraphrase" class to *scholia* mentioning Aristarchus or his editions, but no other later editor, when we intepreted these *scholia* as reworkings in third-person language of originally Arisarchan material.  We also recognized that many scholia are difficult or impossible to classify confidently. We classified these as "indeterminate."

In our random sample of 100 *scholia*, the "indeterminate" class was the most frequent (38), followed closely by "Aristarchan" (36), with the "paraphrase" and "post-Aristarchan" classes about evenly matched.

We next split the manually classified *scholia* into a training set and an evaluation set.  While many machine-learning algorithms could be applied to learn a model from a training set of data, we chose to use a decision tree.[^sparkml]  Other algorithms are likely to produce better results, but the actual working of models built using methods such as neural networks are opaque. We wanted to build a model we could interpret directly, in order to understand what role different features played.  Of course our data sets could subsequently be analyzed with other classification methods, in hopes of getting better results, but our initial decision tree model produced usable results.



[^sparkml]:  Specifically, we used the implementation in the Apache Spark machine learning libary.  For documentation, see "Decision Trees - RDD-based API." <https://spark.apache.org/docs/latest/mllib-decision-tree.html>.

We repeatedly built a decision tree by training it on a randomly selected 70% of the 100 manually classified *scholia* (the training set), then scored the resulting model against the remaining 30% (the evaluation set).  The resulting decision trees correctly classified the *scholia* in the evaluation set up to 90% of the time.  This is significant, since, if you were to randomly assign one of four classes to the *scholia*, you would expect about a 25% success rate.



## Automated classification

Having etablished that our classifier could identify Aristarchan *scholia* with a high degree of success, we applied it to all 8,000 *scholia* in our full data set.  In the resulting classification, both Aristarchan scholia and post-Aristarchan scholia appear most frequently in the main zone.  By contrast, scholia in the "Aristarchan paraphrase"  category are most often found in the intermarginal zone.  The distribution of the four categories in the interior scene resembled the distribution within the intermarginal zone, but with a narrower spread between most frequent and least frequent classes.

Given our earlier topic modelling work, we were not surprised to find that the four classes of *scholia* had different concentrations in each zone. We decided to add the zone of the *scholion* as a further feature (for a total of nine features per *scholion*), and train a new classifier on this expanded data set.  The resulting classifier performed *worse* than the classifier trained on the initial eight features.

This may seem counterintuitive, but it illustrates a subtle and important point about the relation between the automatically inferred topics in our topic modelling and the classes in our supervised classification using decision trees.  We used topic modelling to classify *scholia* into 15 groups based solely on their vocabulary (in the edition we created that had been optimized for topic modelling).  We saw that we could plausibly interpret many of these classes as "topics" in the normal English sense of the word. The distribution of these topics shows that some concentrate more in particular zones of the page, and that the contents of the interior and intermarginal scholia cannot be summarized as condensed versions of the main scholia.


Two of those topics were particularly relevant for the problem of identifying Aristarchan material, topic 6 ("verbatim Aristarchan") and topic 9 ("discussion about Aristarchus' edition").  For our decision tree classifier, we incorporated the theta scores for these topics in a deliberately selected set of features that included the non-textual feature of the critical signs, and emphasized formulaic phrases that we could associate with one of of our four manually defined classes.  These four classes were also distributed unevenly across the different zones of the page, but each zone included some material from all four classes.  Equating one of our classes with a specific zone would therefore be simplistic:  because the full set of other features in our data set more accurately predict which scholia are "Aristarchan," etc, adding the zone as a feature actually worsened the performance of the classifier.

The topic modelling results are strong evidence that the scribe of the Venetus A planned the layout of the manuscript to accommodate material from multiple distinct sources.  The Aristarchan classifier shows us that "Aristarchan" material, "Aristarchan paraphrase" and "post-Aristarchan" material are concentrated differently in the page zones, and therefore, we infer, were transmitted in sources that included these categories in different concentrations.
