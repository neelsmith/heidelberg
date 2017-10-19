


# Section 3


## Finding the language of Aristarchus


How influential were the Alexandrian editors in shaping the written *Iliad* that we have today?  What role did the editions of Zenodotus, Aristophanes and Aristarchus play in narrowing down the multiformity of the earliest written versions of the *Iliad*  to the relatively homogeneous text we find in the medieval manuscripts?

The *schoilia* of the Venetus A offer a window on the editorial work of scholars from the Alexandrians through late antiquity.  The manuscript itself provides very little information about the sources of its *scholia*, however. At the end of several books of the *Iliad*, a subscription cites four scholars of the first and second centuries C.E. However, the *scholia* themselves frequently refer to scholars from later periods, so the subscription does not provide us with a complete view of the sources lying behind the *scholia*.

With the digital edition of the HMT, can we pinpoint specific source material for the *scholia* with more precision than has been achieved previously?  In particular, can we identify material stemming directly from the editions of Aristachus? To address these questions, we constructed a machine-learning model for identifying  *scholia* that can be directly associated with Aristarchus.

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

Once we computed the feature set for each *scholion*, we set aside a randomly selected sample of 100 *scholia* from the main, intermarginal, and interior zones.  We read the text of each *scholion*, and assigned it a class. It is important to recognize that the manual classification is based on our own, very traditional close reading.  Our arguments for calling a *scholion* "Aristarchan" or not are the same kind arguments that have been used in *Quellenkritik* of the *scholia* for more than two centuries.  The question an automated classifier can address is how closely the eight features we defined can reproduce those interpretations.

We ultimately defined four classes.  In addition to our intial goal of classifying *scholia* as "Aristarchan," we split non-Aristarchan scholia  into "paraphrase of Aristarchus" and "post-Aristarchan" classes. We applied the "paraphrase" class to *scholia* mentioning Aristarchus or his editions, but no other later editor, when we intepreted these *scholia* as reworkings in third-person language of originally Arisarchan material.  We also recognized that many scholia are difficult or impossible to classify confidently. We classified these as "indeterminate."

In our random sample of 100 *scholia*, the "indeterminate" class was the most frequent (38), followed closely by "Aristarchan" (36), with the "paraphrase" and "post-Aristarchan" classes about evenly matched.


We next split the manually classified *scholia* into a training set and an evaluation set.  While many machine-learning algorithms could be applied to learn a model from a training set of data, we chose to use a decision tree[^sparkml]

[^sparkml]:  Specifically, we used the implementation in the Apache Spark machine learning libary.  For documentaiton, see "Decision Trees - RDD-based API."https://spark.apache.org/docs/latest/mllib-decision-tree.html.





The next step was to take this set of manually labeled scholia and use it as a training set for a machine-learning model. That is, using machine learning, it was possible to create an Aristarchan identifier which uses the features which were clustered together and the labels which were assigned to the training set of scholia. The method employed here was decision tree learning. As explained by Spark, decision trees are "popular methods for the machine learning tasks of classification." Moreover, within a model, "each partition is chosen greedily by selecting the best split from a set of possible splits, in order to maximize the information gain at a tree node." More simply, the model learns from the data provided (in this case, the manually classified set of scholia), and creates its own model that "splits" on certain variables (features). The goal, then, is to have a model which, when applied, can predict classifications accurately.

Thus, a decision tree script which uses a generic Spark machine learning process was created specificially for this analysis.




The model learns from the training set, and then creates a series of binary decisions in order to determine how to classify scholia depending on the features they do or do not contain. Next, this series of decisions is applied to the evaluation set.

Through this method, it was possible to create a decision tree model that was up to 90% accurate when applied to the evaluation set. If one were to randomly assign labels to scholia, one would expect about 25% accuracy, as there are four different classifications. Thus 90% accuracy is very significant. The next step in this process is to apply this model to the remaining 7900 scholia in my data set and obtain the statistics for how many scholia of each classification it can distinguish.








From the results of the decision tree, it appears that both Aristarchan scholia and post-Aristarchan scholia fall in the main zone more frequently. However, scholia which directly mention Aristarchus are most often in the intermarginal zone. The interior zone's distributions are often similar to those of the intermarginal, but usually slightly less extreme. At one point, the zone of scholia was added as a feature for the decision tree to determine if this helped with classification. However, when this was added to the list of features, the ensuing decision tree model was actually less accurate. This demonstrates that scholia zone is not a satisfactory enough feature for determining source. Furthermore, the features which were identified are more accurate for predicting source.

This finding that the zone of scholia negatively impacts the effectiveness of the Aristarchan classifier seems to conflict with the finding previously discussed that the individual zones of scholia are distinct in their content. By saying that including the zones made the classifier worse, it seems to imply that there actually is not distinct content among the zones. However, this is only saying that associating Aristarchan scholia solely with the main scholia, for example, and Aristarchan paraphrase solely with the intermarginal scholia is way too simplistic of a model. This is not contradictory to the previous findings, but entirely consistent. To reiterate from before, while the intermarginal scholia were shown to make up a disproportionate part of scholia strongly associated with the Aristarchan topic (topic 9), interior and main scholia also made up a significant proportion of those Aristarchan topic scholia. Thus, it was not concluded that the Aristarchan topic existed exclusively within the intermarginal scholia, but just that this particular pattern of language appear more frequently among the intermarginal scholia than the main and interior scholia. This level of complexity eludes the simpler approach of the decision tree model which wants a single feature to apply exclusively to a classification, and the other features which were identified are better suited for classifying scholia.

This part of the paper gives witness to another way of implementing the Homer Multitext’s semantic model for the digital edition of the Venetus A manuscript. More specifically, it demonstrated a method for analyzing scholia that relies on considering each scholion as a collection of features it does or does not contain. Ultimately, with the results of this research, it has shown that despite insufficient citations and no-longer extant sources, it is still possible, in the 21st century, to recover some of the 2nd century B.C.E material for a 10th century C.E. manuscript. Moreover, it has shown that this sort of classification can be done on a large scale. Although the initial classification was on a limited set of scholia, the model that learned from it can be applied to the thousands of scholia in the Venetus A manuscript. Thus this work has added to the understanding of the transmission of Aristarchus' editions in the over one millennium span from when he was working at the library of Alexandria to the construction of the Venetus A manuscript. In combination with the work done to understand the difference among the zones of the scholia, this paper demonstrates how the use of a semantic model for a digital transcription of the Venetus A manuscript has made investigation in the form and history of its texts straightforward and manageable.
