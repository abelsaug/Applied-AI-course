; Movies Recommendation System


(clear)
(reset)

;Imports
(import nrc.fuzzy.*)
(import nrc.fuzzy.jess.*)

; Global Variables
; Global variables for categories
(defglobal ?*age* = (new nrc.fuzzy.FuzzyVariable "age" 10.0 120.0 "User's Age"))
(defglobal ?*action* = (new nrc.fuzzy.FuzzyVariable "action" 1.0 5.0 "User's interest in Action movies"))
(defglobal ?*adventure* = (new nrc.fuzzy.FuzzyVariable "adventure" 1.0 5.0 "User's interest in Adventure movies"))
(defglobal ?*animation* = (new nrc.fuzzy.FuzzyVariable "animation" 1.0 5.0 "User's interest in Animation movies"))
(defglobal ?*comedy* = (new nrc.fuzzy.FuzzyVariable "comedy" 1.0 5.0 "User's interest in Comedy movies"))
(defglobal ?*crime* = (new nrc.fuzzy.FuzzyVariable "crime" 1.0 5.0 "User's interest in Crime movies"))
(defglobal ?*documentary* = (new nrc.fuzzy.FuzzyVariable "documentary" 1.0 5.0 "User's interest in Documentary movies"))
(defglobal ?*drama* = (new nrc.fuzzy.FuzzyVariable "drama" 1.0 5.0 "User's interest in Drama movies"))
(defglobal ?*family* = (new nrc.fuzzy.FuzzyVariable "family" 1.0 5.0 "User's interest in Family movies"))
(defglobal ?*fantasy* = (new nrc.fuzzy.FuzzyVariable "fantasy" 1.0 5.0 "User's interest in Fantasy movies"))
(defglobal ?*foreign* = (new nrc.fuzzy.FuzzyVariable "foreign" 1.0 5.0 "User's interest in Foreign movies"))
(defglobal ?*history* = (new nrc.fuzzy.FuzzyVariable "history" 1.0 5.0 "User's interest in History movies"))
(defglobal ?*horror* = (new nrc.fuzzy.FuzzyVariable "horror" 1.0 5.0 "User's interest in Horror movies"))
(defglobal ?*mystery* = (new nrc.fuzzy.FuzzyVariable "mystery" 1.0 5.0 "User's interest in Mystery movies"))
(defglobal ?*romance* = (new nrc.fuzzy.FuzzyVariable "romance" 1.0 5.0 "User's interest in Romance movies"))
(defglobal ?*scifi* = (new nrc.fuzzy.FuzzyVariable "scifi" 1.0 5.0 "User's interest in Sci-Fi movies"))
(defglobal ?*sports* = (new nrc.fuzzy.FuzzyVariable "sports" 1.0 5.0 "User's interest in Sports movies"))
(defglobal ?*thriller* = (new nrc.fuzzy.FuzzyVariable "thriller" 1.0 5.0 "User's interest in Thriller movies"))
(defglobal ?*war* = (new nrc.fuzzy.FuzzyVariable "war" 1.0 5.0 "User's interest in War movies"))
(defglobal ?*western* = (new nrc.fuzzy.FuzzyVariable "western" 1.0 5.0 "User's interest in Western movies"))

; Global variables for recommendation

(defglobal ?*actionrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation1" 1.0 5.0 ""))
(defglobal ?*adventurerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation2" 1.0 5.0 ""))
(defglobal ?*animationrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation3" 1.0 5.0 ""))
(defglobal ?*comedyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation4" 1.0 5.0 ""))
(defglobal ?*crimerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation5" 1.0 5.0 ""))
(defglobal ?*documentaryrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation6" 1.0 5.0 ""))
(defglobal ?*dramarecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation7" 1.0 5.0 ""))
(defglobal ?*familyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation8" 1.0 5.0 ""))
(defglobal ?*fantasyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation9" 1.0 5.0 ""))
(defglobal ?*foreignrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation10" 1.0 5.0 ""))
(defglobal ?*historyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation11" 1.0 5.0 ""))
(defglobal ?*horrorrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation12" 1.0 5.0 ""))
(defglobal ?*mysteryrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation13" 1.0 5.0 ""))
(defglobal ?*romancerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation14" 1.0 5.0 ""))
(defglobal ?*scifirecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation15" 1.0 5.0 ""))
(defglobal ?*sportsrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation16" 1.0 5.0 ""))
(defglobal ?*thrillerrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation17" 1.0 5.0 ""))
(defglobal ?*warrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation18" 1.0 5.0 ""))
(defglobal ?*westernrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation19" 1.0 5.0 ""))

(defglobal ?*actionrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation21" 1.0 5.0 ""))
(defglobal ?*adventurerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation22" 1.0 5.0 ""))
(defglobal ?*animationrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation23" 1.0 5.0 ""))
(defglobal ?*comedyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation24" 1.0 5.0 ""))
(defglobal ?*crimerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation25" 1.0 5.0 ""))
(defglobal ?*documentaryrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation26" 1.0 5.0 ""))
(defglobal ?*dramarecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation27" 1.0 5.0 ""))
(defglobal ?*familyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation28" 1.0 5.0 ""))
(defglobal ?*fantasyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation29" 1.0 5.0 ""))
(defglobal ?*foreignrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation30" 1.0 5.0 ""))
(defglobal ?*historyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation31" 1.0 5.0 ""))
(defglobal ?*horrorrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation32" 1.0 5.0 ""))
(defglobal ?*mysteryrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation33" 1.0 5.0 ""))
(defglobal ?*romancerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation34" 1.0 5.0 ""))
(defglobal ?*scifirecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation35" 1.0 5.0 ""))
(defglobal ?*sportsrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation36" 1.0 5.0 ""))
(defglobal ?*thrillerrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation37" 1.0 5.0 ""))
(defglobal ?*warrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation38" 1.0 5.0 ""))
(defglobal ?*westernrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation39" 1.0 5.0 ""))

(defglobal ?*actionrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation41" 1.0 5.0 ""))
(defglobal ?*adventurerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation42" 1.0 5.0 ""))
(defglobal ?*animationrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation43" 1.0 5.0 ""))
(defglobal ?*comedyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation44" 1.0 5.0 ""))
(defglobal ?*crimerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation45" 1.0 5.0 ""))
(defglobal ?*documentaryrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation46" 1.0 5.0 ""))
(defglobal ?*dramarecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation47" 1.0 5.0 ""))
(defglobal ?*familyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation48" 1.0 5.0 ""))
(defglobal ?*fantasyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation49" 1.0 5.0 ""))
(defglobal ?*foreignrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation50" 1.0 5.0 ""))
(defglobal ?*historyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation51" 1.0 5.0 ""))
(defglobal ?*horrorrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation52" 1.0 5.0 ""))
(defglobal ?*mysteryrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation53" 1.0 5.0 ""))
(defglobal ?*romancerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation54" 1.0 5.0 ""))
(defglobal ?*scifirecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation55" 1.0 5.0 ""))
(defglobal ?*sportsrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation56" 1.0 5.0 ""))
(defglobal ?*thrillerrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation57" 1.0 5.0 ""))
(defglobal ?*warrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation58" 1.0 5.0 ""))
(defglobal ?*westernrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation59" 1.0 5.0 ""))

(defglobal ?*actionrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation61" 1.0 5.0 ""))
(defglobal ?*adventurerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation62" 1.0 5.0 ""))
(defglobal ?*animationrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation63" 1.0 5.0 ""))
(defglobal ?*comedyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation64" 1.0 5.0 ""))
(defglobal ?*crimerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation65" 1.0 5.0 ""))
(defglobal ?*documentaryrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation66" 1.0 5.0 ""))
(defglobal ?*dramarecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation67" 1.0 5.0 ""))
(defglobal ?*familyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation68" 1.0 5.0 ""))
(defglobal ?*fantasyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation69" 1.0 5.0 ""))
(defglobal ?*foreignrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation70" 1.0 5.0 ""))
(defglobal ?*historyrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation71" 1.0 5.0 ""))
(defglobal ?*horrorrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation72" 1.0 5.0 ""))
(defglobal ?*mysteryrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation73" 1.0 5.0 ""))
(defglobal ?*romancerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation74" 1.0 5.0 ""))
(defglobal ?*scifirecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation75" 1.0 5.0 ""))
(defglobal ?*sportsrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation76" 1.0 5.0 ""))
(defglobal ?*thrillerrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation77" 1.0 5.0 ""))
(defglobal ?*warrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation78" 1.0 5.0 ""))
(defglobal ?*westernrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation79" 1.0 5.0 ""))

(defglobal ?*animationrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation20" 1.0 5.0 ""))
(defglobal ?*animationrecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation40" 1.0 5.0 ""))
(defglobal ?*crimerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation60" 1.0 5.0 ""))
(defglobal ?*romancerecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation80" 1.0 5.0 ""))

(defglobal ?*norecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation81" 1.0 5.0 ""))
(defglobal ?*norecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation82" 1.0 5.0 ""))
(defglobal ?*norecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation83" 1.0 5.0 ""))
(defglobal ?*norecommendation* = (new nrc.fuzzy.FuzzyVariable "recommendation84" 1.0 5.0 ""))

; Initialize the Fuzzy Variables and add Terms to it.

(defrule init  
    =>
   	(load-package nrc.fuzzy.jess.FuzzyFunctions) 
    
    (?*age* addTerm "young-kid" (new nrc.fuzzy.TriangleFuzzySet 10.00 13.0 16.00))   
    (?*age* addTerm "young-adult" (new nrc.fuzzy.TriangleFuzzySet 17.0 24.0 36.0))
    (?*age* addTerm "middle-age" (new nrc.fuzzy.TriangleFuzzySet 36.0 42.0 60.0))
    (?*age* addTerm "old" (new nrc.fuzzy.TriangleFuzzySet 60.0 99.0 100.0))

    
    (?*action* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*action* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)

    (?*adventure* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*adventure* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*animation* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*animation* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*comedy* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*comedy* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*crime* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*crime* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*documentary* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*documentary* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*drama* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*drama* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*family* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*family* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*fantasy* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*fantasy* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*foreign* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*foreign* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*history* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*history* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*horror* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*horror* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*mystery* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*mystery* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*romance* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*romance* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*scifi* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*scifi* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*sports* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*sports* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*thriller* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*thriller* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*war* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*war* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    (?*western* addTerm "hate-it" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*western* addTerm "love-it" (create$ 2.5 5.0) (create$ 0.0 1.0) 2)
    
    
    

  
    
    (?*actionrecommendation* addTerm "young-action-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*adventurerecommendation* addTerm "young-adventure-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*animationrecommendation* addTerm "young-animation-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*comedyrecommendation* addTerm "young-comedy-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*crimerecommendation* addTerm "young-crime-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*documentaryrecommendation* addTerm "young-documentary-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*dramarecommendation* addTerm "young-drama-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
 	(?*familyrecommendation* addTerm "young-family-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*fantasyrecommendation* addTerm "young-fantasy-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*foreignrecommendation* addTerm "young-foreign-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*historyrecommendation* addTerm "young-history-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*horrorrecommendation* addTerm "young-horror-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*mysteryrecommendation* addTerm "young-mystery-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*romancerecommendation* addTerm "young-romance-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*scifirecommendation* addTerm "young-scifi-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*sportsrecommendation* addTerm "young-sports-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*thrillerrecommendation* addTerm "young-thriller-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*warrecommendation* addTerm "young-war-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*westernrecommendation* addTerm "young-western-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
 	 
    (?*actionrecommendation* addTerm "adult-action-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*adventurerecommendation* addTerm "adult-adventure-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*animationrecommendation* addTerm "adult-animation-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*comedyrecommendation* addTerm "adult-comedy-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*crimerecommendation* addTerm "adult-crime-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*documentaryrecommendation* addTerm "adult-documentary-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*dramarecommendation* addTerm "adult-drama-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
 	(?*familyrecommendation* addTerm "adult-family-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*fantasyrecommendation* addTerm "adult-fantasy-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*foreignrecommendation* addTerm "adult-foreign-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*historyrecommendation* addTerm "adult-history-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*horrorrecommendation* addTerm "adult-horror-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*mysteryrecommendation* addTerm "adult-mystery-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*romancerecommendation* addTerm "adult-romance-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*scifirecommendation* addTerm "adult-scifi-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*sportsrecommendation* addTerm "adult-sports-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*thrillerrecommendation* addTerm "adult-thriller-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*warrecommendation* addTerm "adult-war-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*westernrecommendation* addTerm "adult-western-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
 	
	(?*actionrecommendation* addTerm "middle-action-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*adventurerecommendation* addTerm "middle-adventure-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*animationrecommendation* addTerm "middle-animation-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*comedyrecommendation* addTerm "middle-comedy-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*crimerecommendation* addTerm "middle-crime-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*documentaryrecommendation* addTerm "middle-documentary-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*dramarecommendation* addTerm "middle-drama-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
 	(?*familyrecommendation* addTerm "middle-family-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*fantasyrecommendation* addTerm "middle-fantasy-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*foreignrecommendation* addTerm "middle-foreign-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*historyrecommendation* addTerm "middle-history-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*horrorrecommendation* addTerm "middle-horror-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*mysteryrecommendation* addTerm "middle-mystery-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*romancerecommendation* addTerm "middle-romance-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*scifirecommendation* addTerm "middle-scifi-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*sportsrecommendation* addTerm "middle-sports-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*thrillerrecommendation* addTerm "middle-thriller-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*warrecommendation* addTerm "middle-war-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*westernrecommendation* addTerm "middle-western-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    
    (?*actionrecommendation* addTerm "old-action-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*adventurerecommendation* addTerm "old-adventure-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*animationrecommendation* addTerm "old-animation-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*comedyrecommendation* addTerm "old-comedy-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*crimerecommendation* addTerm "old-crime-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*documentaryrecommendation* addTerm "old-documentary-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*dramarecommendation* addTerm "old-drama-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
 	(?*familyrecommendation* addTerm "old-family-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*fantasyrecommendation* addTerm "old-fantasy-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*foreignrecommendation* addTerm "old-foreign-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*historyrecommendation* addTerm "old-history-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*horrorrecommendation* addTerm "old-horror-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*mysteryrecommendation* addTerm "old-mystery-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*romancerecommendation* addTerm "old-romance-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*scifirecommendation* addTerm "old-scifi-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*sportsrecommendation* addTerm "old-sports-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*thrillerrecommendation* addTerm "old-thriller-high" (create$ 2.5 5) (create$ 1.0 0.0) 2)
    (?*warrecommendation* addTerm "old-war-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*westernrecommendation* addTerm "old-western-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)

    (?*norecommendation* addTerm "young-adult-nopref" (create$ 4 5) (create$ 0.0 1.0) 2 )
    (?*norecommendation* addTerm "young-kid-nopref" (create$ 4 5) (create$ 0.0 1.0) 2 )
    (?*norecommendation* addTerm "middle-nopref" (create$ 4 5) (create$ 0.0 1.0) 2 )
    (?*norecommendation* addTerm "old-nopref" (create$ 4 5) (create$ 0.0 1.0) 2 )
    
    (?*animationrecommendation* addTerm "young-animation-scifi" (create$ 4.25 5)(create$ 0.0 1.0) 2 )
    (?*animationrecommendation* addTerm "adult-animation-scifi" (create$ 4.25 5)(create$ 0.0 1.0) 2 )
    (?*crimerecommendation* addTerm "middle-crime-thriller" (create$ 4.25 5) (create$ 0.0 1.0) 2 )
    (?*romancerecommendation* addTerm "old-war-romance" (create$ 4.25 5) (create$ 0.0 1.0) 2 )
    
    
    
    
    
    
    
;    (?*metalrecommendation* addTerm "young-all-low" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*metalrecommendation* addTerm "young-metal" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*poprecommendation* addTerm "young-pop" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "young-rap-pop" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*raprecommendation* addTerm "young-rap" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "young-all-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*poprecommendation* addTerm "young-metal-pop" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "young-metal-rap" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    
;    (?*metalrecommendation* addTerm "old-all-low" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*metalrecommendation* addTerm "old-metal" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*poprecommendation* addTerm "old-pop" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "old-rap-pop" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*raprecommendation* addTerm "old-rap" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "old-all-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*poprecommendation* addTerm "old-metal-pop" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "old-metal-rap" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    
;    (?*metalrecommendation* addTerm "middle-all-low" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*metalrecommendation* addTerm "middle-metal" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*poprecommendation* addTerm "middle-pop" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "middle-rap-pop" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*raprecommendation* addTerm "middle-rap" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "middle-all-high" (create$ 2.5 5) (create$ 0.0 1.0) 2)
;    (?*poprecommendation* addTerm "middle-metal-pop" (create$ 1 2.5) (create$ 1.0 0.0) 2)
;    (?*raprecommendation* addTerm "middle-metal-rap" (create$ 2.5 5) (create$ 0.0 1.0) 2)
   
    (assert (initialize))
    )

; Display to user.

(defrule userDisplay 
    (initialize)
    =>
    (printout t "Hi. Welcome to the Movie Recommendation System. Please enter your name and then press enter key> ")
    (bind ?name (readline))
    (printout t crlf " " crlf)
    (printout t " Hello, " ?name "." crlf)
    (printout t " Please answer the following questions and we will recommend you some cool movies." crlf)
    (printout t " " crlf crlf)
	(printout t "What is your age range? (Enter "young-kid" if your are 10-16, "young-adult" if you are 17-36, "middle-age" if you are 37-60,  "old" if you are above 60.)"  crlf)
	(bind ?ag (readline))
    
    (printout t "How interested are you in Action genre? (love-it/hate-it)" crlf)
    (bind ?act (readline))
    (printout t "How interested are you in Adventure genre? (love-it/hate-it)" crlf)
    (bind ?adv (readline))
    (printout t "How interested are you in Animation genre? (love-it/hate-it)" crlf)
    (bind ?anim (readline))
    (printout t "How interested are you in Comedy genre? (love-it/hate-it)" crlf)
    (bind ?com (readline))
    (printout t "How interested are you in Crime genre? (love-it/hate-it)" crlf)
    (bind ?cri (readline))
    (printout t "How interested are you in Documentary genre? (love-it/hate-it)" crlf)
    (bind ?doc (readline))
    (printout t "How interested are you in Drama genre? (love-it/hate-it)" crlf)
    (bind ?dra (readline))
    (printout t "How interested are you in Family genre? (love-it/hate-it)" crlf)
    (bind ?fam (readline))
    (printout t "How interested are you in Fantasy genre? (love-it/hate-it)" crlf)
    (bind ?fan (readline))
    (printout t "How interested are you in Foreign genre? (love-it/hate-it)" crlf)
    (bind ?for (readline))
    (printout t "How interested are you in History genre? (love-it/hate-it)" crlf)
    (bind ?his (readline))
    (printout t "How interested are you in Horror genre? (love-it/hate-it)" crlf)
    (bind ?hor (readline))
    (printout t "How interested are you in Mystery genre? (love-it/hate-it)" crlf)
    (bind ?mys (readline))
    (printout t "How interested are you in Romance genre? (love-it/hate-it)" crlf)
    (bind ?rom (readline))
    (printout t "How interested are you in Sci-Fi genre? (love-it/hate-it)" crlf)
    (bind ?sci (readline))
    (printout t "How interested are you in Sports genre? (love-it/hate-it)" crlf)
    (bind ?spo (readline))
    (printout t "How interested are you in Thriller genre? (love-it/hate-it)" crlf)
    (bind ?thr (readline))
    (printout t "How interested are you in War genre? (love-it/hate-it)" crlf)
    (bind ?war (readline))
    (printout t "How interested are you in Western genre? (love-it/hate-it)" crlf)
    (bind ?wes (readline))
    
	(assert (age (new nrc.fuzzy.FuzzyValue ?*age* ?ag)))
    (assert (action (new nrc.fuzzy.FuzzyValue ?*action* ?act)))
    (assert (adventure (new nrc.fuzzy.FuzzyValue ?*adventure* ?adv)))
    (assert (animation (new nrc.fuzzy.FuzzyValue ?*animation* ?anim)))
    (assert (comedy (new nrc.fuzzy.FuzzyValue ?*comedy* ?com)))
    (assert (crime (new nrc.fuzzy.FuzzyValue ?*crime* ?cri)))
    (assert (documentary (new nrc.fuzzy.FuzzyValue ?*documentary* ?doc)))
    (assert (drama (new nrc.fuzzy.FuzzyValue ?*drama* ?dra)))
    (assert (family (new nrc.fuzzy.FuzzyValue ?*family* ?fam)))
    (assert (fantasy (new nrc.fuzzy.FuzzyValue ?*fantasy* ?fan)))
    (assert (foreign (new nrc.fuzzy.FuzzyValue ?*foreign* ?for)))
    (assert (history (new nrc.fuzzy.FuzzyValue ?*history* ?his)))
    (assert (horror (new nrc.fuzzy.FuzzyValue ?*horror* ?hor)))
    (assert (mystery (new nrc.fuzzy.FuzzyValue ?*mystery* ?mys)))
    (assert (romance (new nrc.fuzzy.FuzzyValue ?*romance* ?rom)))
    (assert (scifi (new nrc.fuzzy.FuzzyValue ?*scifi* ?sci)))
    (assert (sports (new nrc.fuzzy.FuzzyValue ?*sports* ?spo)))
    (assert (thriller (new nrc.fuzzy.FuzzyValue ?*thriller* ?thr)))
    (assert (war (new nrc.fuzzy.FuzzyValue ?*war* ?war)))
    (assert (western (new nrc.fuzzy.FuzzyValue ?*western* ?wes)))
    
    )



; Rule 1: Action movies for young kids
(defrule action-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (action ?act&:(fuzzy-match ?act "love-it"))
    =>
    (assert (recommendation1 (new nrc.fuzzy.FuzzyValue ?*actionrecommendation* "young-action-high")))
    )

; Rule 2: Adventure movies for young kids
(defrule adventure-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (adventure ?adv&:(fuzzy-match ?adv "love-it"))
    =>
    (assert (recommendation2 (new nrc.fuzzy.FuzzyValue ?*adventurerecommendation* "young-adventure-high")))
    )

; Rule 3: Animation movies for young kids
(defrule animation-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (animation ?ani&:(fuzzy-match ?ani "love-it"))
    =>
    (assert (recommendation3 (new nrc.fuzzy.FuzzyValue ?*animationrecommendation* "young-animation-high")))
    )

; Rule 4: Comedy movies for young kids
(defrule comedy-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (comedy ?com&:(fuzzy-match ?com "love-it"))
    =>
    (assert (recommendation4 (new nrc.fuzzy.FuzzyValue ?*comedyrecommendation* "young-comedy-high")))
    )

; Rule 5: Crime movies for young kids
(defrule crime-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (crime ?cri&:(fuzzy-match ?cri "love-it"))
    =>
    (assert (recommendation5 (new nrc.fuzzy.FuzzyValue ?*crimerecommendation* "young-crime-high")))
    )

; Rule 6: Documentary movies for young kids
(defrule documentary-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (documentary ?doc&:(fuzzy-match ?doc "love-it"))
    =>
    (assert (recommendation6 (new nrc.fuzzy.FuzzyValue ?*documentaryrecommendation* "young-documentary-high")))
    )

; Rule 7: Drama movies for young kids
(defrule drama-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (drama ?dra&:(fuzzy-match ?dra "love-it"))
    =>
    (assert (recommendation7 (new nrc.fuzzy.FuzzyValue ?*dramarecommendation* "young-drama-high")))
    )

; Rule 8: Family movies for young kids
(defrule family-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (family ?fam&:(fuzzy-match ?fam "love-it"))
    =>
    (assert (recommendation8 (new nrc.fuzzy.FuzzyValue ?*familyrecommendation* "young-family-high")))
    )

; Rule 9: Fantasy movies for young kids
(defrule fantasy-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (fantasy ?fan&:(fuzzy-match ?fan "love-it"))
    =>
    (assert (recommendation9 (new nrc.fuzzy.FuzzyValue ?*fantasyrecommendation* "young-fantasy-high")))
    )

; Rule 10: Foreign movies for young kids
(defrule foreign-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (foreign ?for&:(fuzzy-match ?for "love-it"))
    =>
    (assert (recommendation10 (new nrc.fuzzy.FuzzyValue ?*foreignrecommendation* "young-foreign-high")))
    )

; Rule 11: History movies for young kids
(defrule history-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (history ?his&:(fuzzy-match ?his "love-it"))
    =>
    (assert (recommendation11 (new nrc.fuzzy.FuzzyValue ?*historyrecommendation* "young-history-high")))
    )

; Rule 12: Horror movies for young kids
(defrule horror-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (horror ?hor&:(fuzzy-match ?hor "love-it"))
    =>
    (assert (recommendation12 (new nrc.fuzzy.FuzzyValue ?*horrorrecommendation* "young-horror-high")))
    )

; Rule 13: Mystery movies for young kids
(defrule mystery-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (mystery ?mys&:(fuzzy-match ?mys "love-it"))
    =>
    (assert (recommendation13 (new nrc.fuzzy.FuzzyValue ?*mysteryrecommendation* "young-mystery-high")))
    )

; Rule 14: Romance movies for young kids
(defrule romance-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (romance ?rom&:(fuzzy-match ?rom "love-it"))
    =>
    (assert (recommendation14 (new nrc.fuzzy.FuzzyValue ?*romancerecommendation* "young-romance-high")))
    )

; Rule 15: Sci-Fi movies for young kids
(defrule scifi-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (scifi ?sci&:(fuzzy-match ?sci "love-it"))
    =>
    (assert (recommendation15 (new nrc.fuzzy.FuzzyValue ?*scifirecommendation* "young-scifi-high")))
    )

; Rule 16: Sports movies for young kids
(defrule sports-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (sports ?spo&:(fuzzy-match ?spo "love-it"))
    =>
    (assert (recommendation16 (new nrc.fuzzy.FuzzyValue ?*sportsrecommendation* "young-sports-high")))
    )

; Rule 17: Thriller movies for young kids
(defrule thriller-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (thriller ?thr&:(fuzzy-match ?thr "love-it"))
    =>
    (assert (recommendation17 (new nrc.fuzzy.FuzzyValue ?*thrillerrecommendation* "young-thriller-high")))
    )

; Rule 18: War movies for young kids
(defrule war-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (war ?war&:(fuzzy-match ?war "love-it"))
    =>
    (assert (recommendation18 (new nrc.fuzzy.FuzzyValue ?*warrecommendation* "young-war-high")))
    )

; Rule 19: Western movies for young kids
(defrule western-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (western ?wes&:(fuzzy-match ?wes "love-it"))
    =>
    (assert (recommendation19 (new nrc.fuzzy.FuzzyValue ?*westernrecommendation* "young-western-high")))
    )


; Rule 20: Animation-Scifi movies for young kids
(defrule animation-scifi-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (animation ?ani&:(fuzzy-match ?ani "love-it"))
    (scifi ?sci&:(fuzzy-match ?sci "love-it"))
    =>
    (assert (recommendation20 (new nrc.fuzzy.FuzzyValue ?*animationrecommendation* "young-animation-scifi")))
    )


; Rule 21: Action movies for young adults
(defrule action-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (action ?act&:(fuzzy-match ?act "love-it"))
    =>
    (assert (recommendation21 (new nrc.fuzzy.FuzzyValue ?*actionrecommendation* "adult-action-high")))
    )

; Rule 22: Adventure movies for young adults
(defrule adventure-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (adventure ?adv&:(fuzzy-match ?adv "love-it"))
    =>
    (assert (recommendation22 (new nrc.fuzzy.FuzzyValue ?*adventurerecommendation* "adult-adventure-high")))
    )

; Rule 23: Animation movies for young adults
(defrule animation-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (animation ?ani&:(fuzzy-match ?ani "love-it"))
    =>
    (assert (recommendation23 (new nrc.fuzzy.FuzzyValue ?*animationrecommendation* "adult-animation-high")))
    )

; Rule 24: Comedy movies for young adults
(defrule comedy-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (comedy ?com&:(fuzzy-match ?com "love-it"))
    =>
    (assert (recommendation24 (new nrc.fuzzy.FuzzyValue ?*comedyrecommendation* "adult-comedy-high")))
    )

; Rule 25: Crime movies for young adults
(defrule crime-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (crime ?cri&:(fuzzy-match ?cri "love-it"))
    =>
    (assert (recommendation25 (new nrc.fuzzy.FuzzyValue ?*crimerecommendation* "adult-crime-high")))
    )

; Rule 26: Documentary movies for young adults
(defrule documentary-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (documentary ?doc&:(fuzzy-match ?doc "love-it"))
    =>
    (assert (recommendation26 (new nrc.fuzzy.FuzzyValue ?*documentaryrecommendation* "adult-documentary-high")))
    )

; Rule 27: Drama movies for young adults
(defrule drama-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (drama ?dra&:(fuzzy-match ?dra "love-it"))
    =>
    (assert (recommendation27 (new nrc.fuzzy.FuzzyValue ?*dramarecommendation* "adult-drama-high")))
    )

; Rule 28: Family movies for young adults
(defrule family-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (family ?fam&:(fuzzy-match ?fam "love-it"))
    =>
    (assert (recommendation28 (new nrc.fuzzy.FuzzyValue ?*familyrecommendation* "adult-family-high")))
    )

; Rule 29: Fantasy movies for young adults
(defrule fantasy-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (fantasy ?fan&:(fuzzy-match ?fan "love-it"))
    =>
    (assert (recommendation29 (new nrc.fuzzy.FuzzyValue ?*fantasyrecommendation* "adult-fantasy-high")))
    )

; Rule 30: Foreign movies for young adults
(defrule foreign-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (foreign ?for&:(fuzzy-match ?for "love-it"))
    =>
    (assert (recommendation30 (new nrc.fuzzy.FuzzyValue ?*foreignrecommendation* "adult-foreign-high")))
    )

; Rule 31: History movies for young adults
(defrule history-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (history ?his&:(fuzzy-match ?his "love-it"))
    =>
    (assert (recommendation31 (new nrc.fuzzy.FuzzyValue ?*historyrecommendation* "adult-history-high")))
    )

; Rule 32: Horror movies for young adults
(defrule horror-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (horror ?hor&:(fuzzy-match ?hor "love-it"))
    =>
    (assert (recommendation32 (new nrc.fuzzy.FuzzyValue ?*horrorrecommendation* "adult-horror-high")))
    )

; Rule 33: Mystery movies for young adults
(defrule mystery-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (mystery ?mys&:(fuzzy-match ?mys "love-it"))
    =>
    (assert (recommendation33 (new nrc.fuzzy.FuzzyValue ?*mysteryrecommendation* "adult-mystery-high")))
    )

; Rule 34: Romance movies for young adults
(defrule romance-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (romance ?rom&:(fuzzy-match ?rom "love-it"))
    =>
    (assert (recommendation34 (new nrc.fuzzy.FuzzyValue ?*romancerecommendation* "adult-romance-high")))
    )

; Rule 35: Sci-Fi movies for young adults
(defrule scifi-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (scifi ?sci&:(fuzzy-match ?sci "love-it"))
    =>
    (assert (recommendation35 (new nrc.fuzzy.FuzzyValue ?*scifirecommendation* "adult-scifi-high")))
    )

; Rule 36: Sports movies for young adults
(defrule sports-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (sports ?spo&:(fuzzy-match ?spo "love-it"))
    =>
    (assert (recommendation36 (new nrc.fuzzy.FuzzyValue ?*sportsrecommendation* "adult-sports-high")))
    )

 Rule 37: Thriller movies for young adults
(defrule thriller-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (thriller ?thr&:(fuzzy-match ?thr "love-it"))
    =>
    (assert (recommendation37 (new nrc.fuzzy.FuzzyValue ?*thrillerrecommendation* "adult-thriller-high")))
    )

; Rule 38: War movies for young adults
(defrule war-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (war ?war&:(fuzzy-match ?war "love-it"))
    =>
    (assert (recommendation38 (new nrc.fuzzy.FuzzyValue ?*warrecommendation* "adult-war-high")))
    )

; Rule 39: Western movies for young adults
(defrule western-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (western ?wes&:(fuzzy-match ?wes "love-it"))
    =>
    (assert (recommendation39 (new nrc.fuzzy.FuzzyValue ?*westernrecommendation* "adult-western-high")))
    )

; Rule 40: Animation-Scifi movies for young adults
(defrule animation-scifi-young-adult
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (animation ?ani&:(fuzzy-match ?ani "love-it"))
    (scifi ?sci&:(fuzzy-match ?sci "love-it"))
    =>
    (assert (recommendation40 (new nrc.fuzzy.FuzzyValue ?*animationrecommendation* "adult-animation-scifi")))
    )



; Rule 41: Action movies for middle age
(defrule action-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (action ?act&:(fuzzy-match ?act "love-it"))
    =>
    (assert (recommendation41 (new nrc.fuzzy.FuzzyValue ?*actionrecommendation* "middle-action-high")))
    )

; Rule 42: Adventure movies for middle age
(defrule adventure-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (adventure ?adv&:(fuzzy-match ?adv "love-it"))
    =>
    (assert (recommendation42 (new nrc.fuzzy.FuzzyValue ?*adventurerecommendation* "middle-adventure-high")))
    )

; Rule 43: Animation movies for middle age
(defrule animation-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (animation ?ani&:(fuzzy-match ?ani "love-it"))
    =>
    (assert (recommendation43 (new nrc.fuzzy.FuzzyValue ?*animationrecommendation* "middle-animation-high")))
    )

; Rule 44: Comedy movies for middle age
(defrule comedy-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (comedy ?com&:(fuzzy-match ?com "love-it"))
    =>
    (assert (recommendation44 (new nrc.fuzzy.FuzzyValue ?*comedyrecommendation* "middle-comedy-high")))
    )

; Rule 45: Crime movies for middle age
(defrule crime-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (crime ?cri&:(fuzzy-match ?cri "love-it"))
    =>
    (assert (recommendation45(new nrc.fuzzy.FuzzyValue ?*crimerecommendation* "middle-crime-high")))
    )

; Rule 46: Documentary movies for middle age
(defrule documentary-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (documentary ?doc&:(fuzzy-match ?doc "love-it"))
    =>
    (assert (recommendation46 (new nrc.fuzzy.FuzzyValue ?*documentaryrecommendation* "middle-documentary-high")))
    )

; Rule 47: Drama movies for middle age
(defrule drama-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (drama ?dra&:(fuzzy-match ?dra "love-it"))
    =>
    (assert (recommendation47 (new nrc.fuzzy.FuzzyValue ?*dramarecommendation* "middle-drama-high")))
    )

; Rule 48: Family movies for middle age
(defrule family-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (family ?fam&:(fuzzy-match ?fam "love-it"))
    =>
    (assert (recommendation48 (new nrc.fuzzy.FuzzyValue ?*familyrecommendation* "middle-family-high")))
    )

; Rule 49: Fantasy movies for middle age
(defrule fantasy-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (fantasy ?fan&:(fuzzy-match ?fan "love-it"))
    =>
    (assert (recommendation49 (new nrc.fuzzy.FuzzyValue ?*fantasyrecommendation* "middle-fantasy-high")))
    )

; Rule 50: Foreign movies for middle age
(defrule foreign-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (foreign ?for&:(fuzzy-match ?for "love-it"))
    =>
    (assert (recommendation50 (new nrc.fuzzy.FuzzyValue ?*foreignrecommendation* "middle-foreign-high")))
    )

; Rule 51: History movies for middle age
(defrule history-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (history ?his&:(fuzzy-match ?his "love-it"))
    =>
    (assert (recommendation51 (new nrc.fuzzy.FuzzyValue ?*historyrecommendation* "middle-history-high")))
    )

; Rule 52: Horror movies for middle age
(defrule horror-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (horror ?hor&:(fuzzy-match ?hor "love-it"))
    =>
    (assert (recommendation52 (new nrc.fuzzy.FuzzyValue ?*horrorrecommendation* "middle-horror-high")))
    )

; Rule 53: Mystery movies for middle age
(defrule mystery-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (mystery ?mys&:(fuzzy-match ?mys "love-it"))
    =>
    (assert (recommendation53 (new nrc.fuzzy.FuzzyValue ?*mysteryrecommendation* "middle-mystery-high")))
    )

; Rule 54: Romance movies for middle age
(defrule romance-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (romance ?rom&:(fuzzy-match ?rom "love-it"))
    =>
    (assert (recommendation54 (new nrc.fuzzy.FuzzyValue ?*romancerecommendation* "middle-romance-high")))
    )

; Rule 55: Sci-Fi movies for middle age
(defrule scifi-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (scifi ?sci&:(fuzzy-match ?sci "love-it"))
    =>
    (assert (recommendation55 (new nrc.fuzzy.FuzzyValue ?*scifirecommendation* "middle-scifi-high")))
    )

; Rule 56: Sports movies for middle age
(defrule sports-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (sports ?spo&:(fuzzy-match ?spo "love-it"))
    =>
    (assert (recommendation56 (new nrc.fuzzy.FuzzyValue ?*sportsrecommendation* "middle-sports-high")))
    )

; Rule 57: Thriller movies for middle age
(defrule thriller-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (thriller ?thr&:(fuzzy-match ?thr "love-it"))
    =>
    (assert (recommendation57 (new nrc.fuzzy.FuzzyValue ?*thrillerrecommendation* "middle-thriller-high")))
    )

; Rule 58: War movies for middle age
(defrule war-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (war ?war&:(fuzzy-match ?war "love-it"))
    =>
    (assert (recommendation58 (new nrc.fuzzy.FuzzyValue ?*warrecommendation* "middle-war-high")))
    )

; Rule 59: Western movies for middle age
(defrule western-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (western ?wes&:(fuzzy-match ?wes "love-it"))
    =>
    (assert (recommendation59 (new nrc.fuzzy.FuzzyValue ?*westernrecommendation* "middle-western-high")))
    )


; Rule 60: Animation-Scifi movies for middle age
(defrule animation-scifi-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (animation ?ani&:(fuzzy-match ?ani "love-it"))
    (scifi ?sci&:(fuzzy-match ?sci "love-it"))
    =>
    (assert (recommendation60 (new nrc.fuzzy.FuzzyValue ?*crimerecommendation* "middle-crime-thriller")))
    )



; Rule 61: Action movies for old age
(defrule action-old
    (age ?a&:(fuzzy-match ?a "old"))
    (action ?act&:(fuzzy-match ?act "love-it"))
    =>
    (assert (recommendation61 (new nrc.fuzzy.FuzzyValue ?*actionrecommendation* "old-action-high")))
    )

; Rule 62: Adventure movies for old age
(defrule adventure-old
    (age ?a&:(fuzzy-match ?a "old"))
    (adventure ?adv&:(fuzzy-match ?adv "love-it"))
    =>
    (assert (recommendation62 (new nrc.fuzzy.FuzzyValue ?*adventurerecommendation* "old-adventure-high")))
    )

; Rule 63: Animation movies for old age
(defrule animation-old
    (age ?a&:(fuzzy-match ?a "old"))
    (animation ?ani&:(fuzzy-match ?ani "love-it"))
    =>
    (assert (recommendation63 (new nrc.fuzzy.FuzzyValue ?*animationrecommendation* "old-animation-high")))
    )

; Rule 64: Comedy movies for old age
(defrule comedy-old
    (age ?a&:(fuzzy-match ?a "old"))
    (comedy ?com&:(fuzzy-match ?com "love-it"))
    =>
    (assert (recommendation64 (new nrc.fuzzy.FuzzyValue ?*comedyrecommendation* "old-comedy-high")))
    )

; Rule 65: Crime movies for old age
(defrule crime-old
    (age ?a&:(fuzzy-match ?a "old"))
    (crime ?cri&:(fuzzy-match ?cri "love-it"))
    =>
    (assert (recommendation65 (new nrc.fuzzy.FuzzyValue ?*crimerecommendation* "old-crime-high")))
    )

; Rule 66: Documentary movies for old age
(defrule documentary-old
    (age ?a&:(fuzzy-match ?a "old"))
    (documentary ?doc&:(fuzzy-match ?doc "love-it"))
    =>
    (assert (recommendation66 (new nrc.fuzzy.FuzzyValue ?*documentaryrecommendation* "old-documentary-high")))
    )

; Rule 67: Drama movies for old age
(defrule drama-old
    (age ?a&:(fuzzy-match ?a "old"))
    (drama ?dra&:(fuzzy-match ?dra "love-it"))
    =>
    (assert (recommendation67 (new nrc.fuzzy.FuzzyValue ?*dramarecommendation* "old-drama-high")))
    )

; Rule 68: Family movies for old age
(defrule family-old
    (age ?a&:(fuzzy-match ?a "old"))
    (family ?fam&:(fuzzy-match ?fam "love-it"))
    =>
    (assert (recommendation68 (new nrc.fuzzy.FuzzyValue ?*familyrecommendation* "old-family-high")))
    )

; Rule 69: Fantasy movies for old age
(defrule fantasy-old
    (age ?a&:(fuzzy-match ?a "old"))
    (fantasy ?fan&:(fuzzy-match ?fan "love-it"))
    =>
    (assert (recommendation69 (new nrc.fuzzy.FuzzyValue ?*fantasyrecommendation* "old-fantasy-high")))
    )

; Rule 70: Foreign movies for old age
(defrule foreign-old
    (age ?a&:(fuzzy-match ?a "old"))
    (foreign ?for&:(fuzzy-match ?for "love-it"))
    =>
    (assert (recommendation70 (new nrc.fuzzy.FuzzyValue ?*foreignrecommendation* "old-foreign-high")))
    )

; Rule 71: History movies for old age
(defrule history-old
    (age ?a&:(fuzzy-match ?a "old"))
    (history ?his&:(fuzzy-match ?his "love-it"))
    =>
    (assert (recommendation71 (new nrc.fuzzy.FuzzyValue ?*historyrecommendation* "old-history-high")))
    )

; Rule 72: Horror movies for old age
(defrule horror-old
    (age ?a&:(fuzzy-match ?a "old"))
    (horror ?hor&:(fuzzy-match ?hor "love-it"))
    =>
    (assert (recommendation72 (new nrc.fuzzy.FuzzyValue ?*horrorrecommendation* "old-horror-high")))
    )

; Rule 73: Mystery movies for old age
(defrule mystery-old
    (age ?a&:(fuzzy-match ?a "old"))
    (mystery ?mys&:(fuzzy-match ?mys "love-it"))
    =>
    (assert (recommendation73 (new nrc.fuzzy.FuzzyValue ?*mysteryrecommendation* "old-mystery-high")))
    )

; Rule 74: Romance movies for old age
(defrule romance-old
    (age ?a&:(fuzzy-match ?a "old"))
    (romance ?rom&:(fuzzy-match ?rom "love-it"))
    =>
    (assert (recommendation74 (new nrc.fuzzy.FuzzyValue ?*romancerecommendation* "old-romance-high")))
    )

; Rule 75: Sci-Fi movies for old age
(defrule scifi-old
    (age ?a&:(fuzzy-match ?a "old"))
    (scifi ?sci&:(fuzzy-match ?sci "love-it"))
    =>
    (assert (recommendation75 (new nrc.fuzzy.FuzzyValue ?*scifirecommendation* "old-scifi-high")))
    )

; Rule 76: Sports movies for old age
(defrule sports-young-kid
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (sports ?spo&:(fuzzy-match ?spo "love-it"))
    =>
    (assert (recommendation76 (new nrc.fuzzy.FuzzyValue ?*sportsrecommendation* "old-sports-high")))
    )

; Rule 77: Thriller movies for old age
(defrule thriller-old
    (age ?a&:(fuzzy-match ?a "old"))
    (thriller ?thr&:(fuzzy-match ?thr "love-it"))
    =>
    (assert (recommendation77 (new nrc.fuzzy.FuzzyValue ?*thrillerrecommendation* "old-thriller-high")))
    )

; Rule 78: War movies for old age
(defrule war-old
    (age ?a&:(fuzzy-match ?a "old"))
    (war ?war&:(fuzzy-match ?war "love-it"))
    =>
    (assert (recommendation78 (new nrc.fuzzy.FuzzyValue ?*warrecommendation* "old-war-high")))
    )

; Rule 79: Western movies for old age
(defrule western-old
    (age ?a&:(fuzzy-match ?a "old"))
    (western ?wes&:(fuzzy-match ?wes "love-it"))
    =>
    (assert (recommendation79 (new nrc.fuzzy.FuzzyValue ?*westernrecommendation* "old-western-high")))
    )


; Rule 80: Animation-Scifi movies for old age
(defrule war-romance-old
    (age ?a&:(fuzzy-match ?a "old"))
    (animation ?ani&:(fuzzy-match ?ani "love-it"))
    (scifi ?sci&:(fuzzy-match ?sci "love-it"))
    =>
    (assert (recommendation80(new nrc.fuzzy.FuzzyValue ?*romancerecommendation* "old-war-romance")))
    )


; Rule 81: Young kids with no preferences
(defrule nopref-young-kids
    (age ?a&:(fuzzy-match ?a "young-kid"))
    (animation ?ani&:(fuzzy-match ?ani "hate-it"))
    (scifi ?sci&:(fuzzy-match ?sci "hate-it"))
    (western ?wes&:(fuzzy-match ?wes "hate-it"))
    (war ?war&:(fuzzy-match ?war "hate-it"))
    (thriller ?thr&:(fuzzy-match ?thr "hate-it"))
    (sports ?spo&:(fuzzy-match ?spo "hate-it"))
    (romance ?rom&:(fuzzy-match ?rom "hate-it"))
    (mystery ?mys&:(fuzzy-match ?mys "hate-it"))
    (horror ?hor&:(fuzzy-match ?hor "hate-it"))
    (history ?his&:(fuzzy-match ?his "hate-it"))
    (foreign ?for&:(fuzzy-match ?for "hate-it"))
    (fantasy ?fan&:(fuzzy-match ?fan "hate-it"))
    (family ?fam&:(fuzzy-match ?fam "hate-it"))
    (drama ?dra&:(fuzzy-match ?dra "hate-it"))
    (documentary ?doc&:(fuzzy-match ?doc "hate-it"))
    (comedy ?com&:(fuzzy-match ?com "hate-it"))
    (crime ?cri&:(fuzzy-match ?cri "hate-it"))
    (adventure ?adv&:(fuzzy-match ?adv "hate-it"))
    (action ?act&:(fuzzy-match ?act "hate-it"))
    =>
    (assert (recommendation81 (new nrc.fuzzy.FuzzyValue ?*norecommendation* "young-kid-nopref")))
    )

; Rule 82: Young adults with no preferences
(defrule nopref-young-adults
    (age ?a&:(fuzzy-match ?a "young-adult"))
    (animation ?ani&:(fuzzy-match ?ani "hate-it"))
    (scifi ?sci&:(fuzzy-match ?sci "hate-it"))
    (western ?wes&:(fuzzy-match ?wes "hate-it"))
    (war ?war&:(fuzzy-match ?war "hate-it"))
    (thriller ?thr&:(fuzzy-match ?thr "hate-it"))
    (sports ?spo&:(fuzzy-match ?spo "hate-it"))
    (romance ?rom&:(fuzzy-match ?rom "hate-it"))
    (mystery ?mys&:(fuzzy-match ?mys "hate-it"))
    (horror ?hor&:(fuzzy-match ?hor "hate-it"))
    (history ?his&:(fuzzy-match ?his "hate-it"))
    (foreign ?for&:(fuzzy-match ?for "hate-it"))
    (fantasy ?fan&:(fuzzy-match ?fan "hate-it"))
    (family ?fam&:(fuzzy-match ?fam "hate-it"))
    (drama ?dra&:(fuzzy-match ?dra "hate-it"))
    (documentary ?doc&:(fuzzy-match ?doc "hate-it"))
    (comedy ?com&:(fuzzy-match ?com "hate-it"))
    (crime ?cri&:(fuzzy-match ?cri "hate-it"))
    (adventure ?adv&:(fuzzy-match ?adv "hate-it"))
    (action ?act&:(fuzzy-match ?act "hate-it"))
    =>
    (assert (recommendation82 (new nrc.fuzzy.FuzzyValue ?*norecommendation* "young-adult-nopref")))
    )

; Rule 83: Middle aged people with no preferences
(defrule nopref-middle-age
    (age ?a&:(fuzzy-match ?a "middle-age"))
    (animation ?ani&:(fuzzy-match ?ani "hate-it"))
    (scifi ?sci&:(fuzzy-match ?sci "hate-it"))
    (western ?wes&:(fuzzy-match ?wes "hate-it"))
    (war ?war&:(fuzzy-match ?war "hate-it"))
    (thriller ?thr&:(fuzzy-match ?thr "hate-it"))
    (sports ?spo&:(fuzzy-match ?spo "hate-it"))
    (romance ?rom&:(fuzzy-match ?rom "hate-it"))
    (mystery ?mys&:(fuzzy-match ?mys "hate-it"))
    (horror ?hor&:(fuzzy-match ?hor "hate-it"))
    (history ?his&:(fuzzy-match ?his "hate-it"))
    (foreign ?for&:(fuzzy-match ?for "hate-it"))
    (fantasy ?fan&:(fuzzy-match ?fan "hate-it"))
    (family ?fam&:(fuzzy-match ?fam "hate-it"))
    (drama ?dra&:(fuzzy-match ?dra "hate-it"))
    (documentary ?doc&:(fuzzy-match ?doc "hate-it"))
    (comedy ?com&:(fuzzy-match ?com "hate-it"))
    (crime ?cri&:(fuzzy-match ?cri "hate-it"))
    (adventure ?adv&:(fuzzy-match ?adv "hate-it"))
    (action ?act&:(fuzzy-match ?act "hate-it"))
    =>
    (assert (recommendation83 (new nrc.fuzzy.FuzzyValue ?*norecommendation* "middle-nopref")))
    )

; Rule 84: Old people with no preferences
(defrule nopref-old
    (age ?a&:(fuzzy-match ?a "old"))
    (animation ?ani&:(fuzzy-match ?ani "hate-it"))
    (scifi ?sci&:(fuzzy-match ?sci "hate-it"))
    (western ?wes&:(fuzzy-match ?wes "hate-it"))
    (war ?war&:(fuzzy-match ?war "hate-it"))
    (thriller ?thr&:(fuzzy-match ?thr "hate-it"))
    (sports ?spo&:(fuzzy-match ?spo "hate-it"))
    (romance ?rom&:(fuzzy-match ?rom "hate-it"))
    (mystery ?mys&:(fuzzy-match ?mys "hate-it"))
    (horror ?hor&:(fuzzy-match ?hor "hate-it"))
    (history ?his&:(fuzzy-match ?his "hate-it"))
    (foreign ?for&:(fuzzy-match ?for "hate-it"))
    (fantasy ?fan&:(fuzzy-match ?fan "hate-it"))
    (family ?fam&:(fuzzy-match ?fam "hate-it"))
    (drama ?dra&:(fuzzy-match ?dra "hate-it"))
    (documentary ?doc&:(fuzzy-match ?doc "hate-it"))
    (comedy ?com&:(fuzzy-match ?com "hate-it"))
    (crime ?cri&:(fuzzy-match ?cri "hate-it"))
    (adventure ?adv&:(fuzzy-match ?adv "hate-it"))
    (action ?act&:(fuzzy-match ?act "hate-it"))
    =>
    (assert (recommendation84 (new nrc.fuzzy.FuzzyValue ?*norecommendation* "old-nopref")))
    )

; Corresponding Rules for recommending movies based on the rules
(defrule Recom1  
    (or(recommendation1 ?i&:(fuzzy-match ?i "young-action-high"))(recommendation21 ?i&:(fuzzy-match ?i "adult-action-high")))
    =>
    (printout t "Wonder Woman" crlf))

(defrule Recom2  
    (recommendation2 ?i&:(fuzzy-match ?i "young-adventure-high"))
    =>
    (printout t "Pirates of the Caribbean" crlf))

(defrule Recom3 
    (or(recommendation3 ?i&: (fuzzy-match ?i "young-animation-high"))(recommendation23 ?i&: (fuzzy-match ?i "adult-animation-high")))
    =>
    (printout t "Inside Out" crlf)
    (printout t "Lion King" crlf))

(defrule Recom4 
    (recommendation4 ?i&:(fuzzy-match ?i "young-comedy-high"))
    =>
    (printout t "Despicable Me" crlf))

(defrule Recom5
    (recommendation5 ?i&:(fuzzy-match ?i "young-crime-high"))
    =>
    (printout t "The Dark Knight" crlf))

(defrule Recom6
    (recommendation6 ?i&:(fuzzy-match ?i "young-documentary-high"))
    =>
    (printout t "Wings of Life" crlf)
    (printout t "Invictus" crlf))

(defrule Recom7
    (recommendation7 ?i&:(fuzzy-match ?i "young-drama-high"))
    =>
    (printout t "We Bought a Zoo" crlf))

(defrule Recom8
    (recommendation8 ?i&:(fuzzy-match ?i "young-family-high"))
    =>
    (printout t "The Lego Movie" crlf))

(defrule Recom9
    (recommendation9 ?i&:(fuzzy-match ?i "young-fantasy-high"))
    =>
    (printout t "The Chronicles of Narnia: The Lion, the Witch and the Wardrobe" crlf)
    (printout t "Harry Potter and the Chamber of Secrets" crlf))

(defrule Recom10
    (recommendation10 ?i&:(fuzzy-match ?i "young-foreign-high"))
    =>
    (printout t "My Neighbor Totoro" crlf))

(defrule Recom11
    (recommendation11 ?i&:(fuzzy-match ?i "young-history-high"))
    =>
    (printout t "Night at the museum" crlf)
    (printout t "Hidden Figures" crlf))


(defrule Recom12
    (recommendation12 ?i&:(fuzzy-match ?i "young-horror-high"))
    =>
    (printout t "Monster House" crlf))

(defrule Recom13
    (and (recommendation13 ?i&:(fuzzy-match ?i "young-mystery-high")) (not (recommendation9 ?i&:(fuzzy-match ?i "young-fantasy-high"))))
    =>
    (printout t "Harry Potter and the Chamber of Secrets" crlf))

(defrule Recom14
    (recommendation14 ?i&:(fuzzy-match ?i "young-romance-high"))
    =>
    (printout t "Little Manhattan" crlf))

(defrule Recom15
    (recommendation15 ?i&:(fuzzy-match ?i "young-scifi-high"))
    =>
    (printout t "WALL-E" crlf))


(defrule Recom16
    (recommendation16 ?i&:(fuzzy-match ?i "young-sports-high"))
    =>
    (printout t "The Game Plan" crlf)
    (printout t "42" crlf))


(defrule Recom17
    (recommendation17 ?i&:(fuzzy-match ?i "young-thriller-high"))
    =>
    (printout t "Jurassic World" crlf))


(defrule Recom18
    (recommendation18 ?i&:(fuzzy-match ?i "young-war-high"))
    =>
    (printout t "War Horse" crlf)
    (printout t "Dunkirk" crlf))


(defrule Recom19
    (recommendation19 ?i&:(fuzzy-match ?i "young-western-high"))
    =>
    (printout t "Back to the Future Part III" crlf))







(defrule Recom21  
    (recommendation21 ?i&:(fuzzy-match ?i "adult-action-high"))
    =>
    (printout t "Mad Max: Fury Road" crlf))

(defrule Recom22  
    (recommendation22 ?i&:(fuzzy-match ?i "adult-adventure-high"))
    =>
    (printout t "The Lord of the Rings" crlf))

(defrule Recom23 
    (recommendation23 ?i&: (fuzzy-match ?i "adult-animation-high"))
    =>
    (printout t "South Park: Bigger, Longer & Uncut" crlf))

(defrule Recom24 
    (recommendation24 ?i&:(fuzzy-match ?i "adult-comedy-high"))
    =>
    (printout t "The Dictator" crlf))

(defrule Recom25
    (recommendation25 ?i&:(fuzzy-match ?i "adult-crime-high"))
    =>
    (printout t "Heat" crlf)
    (printout t "The Usual Suspects" crlf))

(defrule Recom26
    (recommendation26 ?i&:(fuzzy-match ?i "adult-documentary-high"))
    =>
    (printout t "An Inconvenient Truth" crlf))

(defrule Recom27
    (or(recommendation27 ?i&:(fuzzy-match ?i "adult-drama-high"))(recommendation47 ?i&:(fuzzy-match ?i "middle-drama-high")))
    =>
    (printout t "The Shawshank Redemption" crlf)
    (printout t "Forrest Gump" crlf))

(defrule Recom28
    (recommendation28 ?i&:(fuzzy-match ?i "adult-family-high"))
    =>
    (printout t "The Lego Movie" crlf)
    (printout t "School of Rock" crlf)
    )

(defrule Recom29
    (and (recommendation29 ?i&:(fuzzy-match ?i "adult-fantasy-high"))(not (recommendation9 ?i&:(fuzzy-match ?i "adult-adventure-high"))))
    =>
    (printout t "The Lord of the Rings" crlf))

(defrule Recom30
    (recommendation30 ?i&:(fuzzy-match ?i "adult-foreign-high"))
    =>
    (printout t "La vita è bella" crlf))

(defrule Recom31
    (recommendation31 ?i&:(fuzzy-match ?i "adult-history-high"))
    =>
    (printout t "Braveheart" crlf)
    (printout t "300" crlf))


(defrule Recom32
    (recommendation32 ?i&:(fuzzy-match ?i "adult-horror-high"))
    =>
    (printout t "It" crlf))

(defrule Recom33
    (recommendation33 ?i&:(fuzzy-match ?i "adult-mystery-high")) 
    =>
    (printout t "The Usual Suspects" crlf)
    (printout t "Gone Girl" crlf))

(defrule Recom34
    (recommendation34 ?i&:(fuzzy-match ?i "adult-romance-high"))
    =>
    (printout t "The Fault in Our Stars" crlf))

(defrule Recom35
    (recommendation35 ?i&:(fuzzy-match ?i "adult-scifi-high"))
    =>
    (printout t "Blade Runner 2049" crlf)
    (printout t "Star Wars" crlf))


(defrule Recom36
    (recommendation36 ?i&:(fuzzy-match ?i "adult-sports-high"))
    =>
    (printout t "Rocky" crlf)
    (printout t "The Warrior" crlf))


(defrule Recom37
    (recommendation37 ?i&:(fuzzy-match ?i "adult-thriller-high"))
    =>
    (printout t "Shutter Island" crlf))


(defrule Recom38  
    (recommendation38 ?i&:(fuzzy-match ?i "adult-war-high"))
    =>
    (printout t "Saving Private Ryan" crlf)
    (printout t "Dunkirk" crlf))


(defrule Recom39
    (recommendation39 ?i&:(fuzzy-match ?i "adult-western-high"))
    =>
    (printout t "Django Unchained" crlf)
    (printout t "3:10 to Yuma" crlf))
    
    
    
    

    
(defrule Recom41  
	(recommendation41 ?i&:(fuzzy-match ?i "middle-action-high"))
	=>
	(printout t "The Terminator Series" crlf))

(defrule Recom42  
    (recommendation42 ?i&:(fuzzy-match ?i "middle-adventure-high"))
    =>
    (printout t "Indiana Jones series" crlf))

(defrule Recom43 
    (recommendation43 ?i&: (fuzzy-match ?i "middle-animation-high"))
    =>
    (printout t "Grave of the Fireflies" crlf))

(defrule Recom44 
    (recommendation44 ?i&:(fuzzy-match ?i "middle-comedy-high"))
    =>
    (printout t "Wayne's World" crlf))

(defrule Recom45
    (recommendation45 ?i&:(fuzzy-match ?i "middle-crime-high"))
    =>
    (printout t "Pulp Fiction" crlf)
    (printout t "The Goodfellas" crlf)
    (printout t "Reservoir Dogs" crlf))


(defrule Recom46
    (recommendation46 ?i&:(fuzzy-match ?i "middle-documentary-high"))
    =>
    (printout t "Hoop Dreams" crlf)
    (printout t "Senna" crlf))

(defrule Recom47
    (recommendation47 ?i&:(fuzzy-match ?i "middle-drama-high"))
    =>
    (printout t "Fight Club" crlf))

(defrule Recom48
    (recommendation48 ?i&:(fuzzy-match ?i "middle-family-high"))
    =>
    (printout t "The Goonies" crlf)
	(printout t "E.T. the Extra-Terrestrial" crlf))

(defrule Recom49
    (recommendation49 ?i&:(fuzzy-match ?i "middle-fantasy-high"))
    =>
    (printout t "Ghostbusters" crlf))

(defrule Recom50
    (recommendation50 ?i&:(fuzzy-match ?i "middle-foreign-high"))
    =>
    (printout t "Amélie" crlf)
    (printout t "City of God" crlf))

(defrule Recom51
    (recommendation51 ?i&:(fuzzy-match ?i "middle-history-high"))
    =>
    (printout t "Schindler's List" crlf)
	(printout t "Letters from Iwo Jima" crlf))


(defrule Recom52
    (recommendation52 ?i&:(fuzzy-match ?i "middle-horror-high"))
    =>
    (printout t "A Nightmare on Elm Street" crlf))

(defrule Recom53
    (recommendation53 ?i&:(fuzzy-match ?i "middle-mystery-high"))
    =>
    (printout t "Seven" crlf))

(defrule Recom54
    (recommendation54 ?i&:(fuzzy-match ?i "middle-romance-high"))
    =>
    (printout t "Titanic" crlf))

(defrule Recom55
    (recommendation55 ?i&:(fuzzy-match ?i "middle-scifi-high"))
    =>
    (printout t "The Matrix series" crlf))


(defrule Recom56
    (recommendation56 ?i&:(fuzzy-match ?i "middle-sports-high"))
    =>
    (printout t "Rush" crlf)
    (printout t "Lagaan" crlf)
    (printout t "The Greatest game ever played" crlf))


(defrule Recom57
    (recommendation57 ?i&:(fuzzy-match ?i "middle-thriller-high"))
    =>
    (printout t "The Bourne Series" crlf)
    (printout t "The Silence of the Lambs" crlf))


(defrule Recom58
    (recommendation58 ?i&:(fuzzy-match ?i "middle-war-high"))
    =>
    (printout t "Full Metal Jacket" crlf)
    (printout t "Das Boot" crlf))


(defrule Recom59
    (recommendation59 ?i&:(fuzzy-match ?i "middle-western-high"))
    =>
    (printout t "Unforgiven" crlf))




(defrule Recom61  
	(recommendation61 ?i&:(fuzzy-match ?i "old-action-high"))
	=>
	(printout t "Goldfinger" crlf))

(defrule Recom62  
    (recommendation62 ?i&:(fuzzy-match ?i "old-adventure-high"))
    =>
    (printout t "Lawrence of Arabia" crlf)
    (printout t "The Bucket List " crlf))

(defrule Recom63 
    (recommendation63 ?i&: (fuzzy-match ?i "old-animation-high"))
    =>
    (printout t "Grave of the Fireflies" crlf))

(defrule Recom64 
    (recommendation64 ?i&:(fuzzy-match ?i "old-comedy-high"))
    =>
    (printout t "Charlie Chaplin movies" crlf)
    (printout t "The Best Exotic Marigold Hotel" crlf))

(defrule Recom65
    (recommendation65 ?i&:(fuzzy-match ?i "old-crime-high"))
    =>
    (printout t "Bonnie and Clyde" crlf)
    (printout t "The Killing" crlf))

(defrule Recom66
    (recommendation66 ?i&:(fuzzy-match ?i "old-documentary-high"))
    =>
    (printout t "Young@Heart" crlf)
    (printout t "Gotta Dance" crlf)
    (printout t "Elvis Presley: The Last 24 Hours" crlf))

(defrule Recom67
    (recommendation67 ?i&:(fuzzy-match ?i "old-drama-high"))
    =>
    (printout t "Hachi – a Dog’s Tale" crlf))

(defrule Recom68
    (recommendation68 ?i&:(fuzzy-match ?i "old-family-high"))
    =>
    (printout t "Up" crlf))

(defrule Recom69
    (recommendation69 ?i&:(fuzzy-match ?i "old-fantasy-high"))
    =>
    (printout t "Groundhog Day" crlf))

(defrule Recom70
    (recommendation70 ?i&:(fuzzy-match ?i "old-foreign-high"))
    =>
    (printout t "M" crlf)
    (printout t "La Dolce Vita" crlf))

(defrule Recom71
    (recommendation71 ?i&:(fuzzy-match ?i "old-history-high"))
    =>
    (printout t "Schindler's List" crlf)
	(printout t "The Pianist" crlf))

(defrule Recom72
    (recommendation72 ?i&:(fuzzy-match ?i "old-horror-high"))
    =>
    (printout t "The Exorcist" crlf))

(defrule Recom73
    (recommendation73 ?i&:(fuzzy-match ?i "old-mystery-high"))
    =>
    (printout t "Dial M for Murder" crlf)
    (printout t "Chinatown" crlf))

(defrule Recom74
    (recommendation74 ?i&:(fuzzy-match ?i "old-romance-high"))
    =>
    (printout t "Casablanca" crlf))

(defrule Recom75
    (recommendation75 ?i&:(fuzzy-match ?i "old-scifi-high"))
    =>
    (printout t "2001: A Space Odyssey" crlf)
    (printout t "The Time Machine" crlf))


(defrule Recom76
    (recommendation76 ?i&:(fuzzy-match ?i "old-sports-high"))
    =>
    (printout t "Chariots of Fire" crlf)
    (printout t "Raging Bull" crlf))


(defrule Recom77
    (recommendation77 ?i&:(fuzzy-match ?i "old-thriller-high"))
    =>
    (printout t "Murder on the Orient Express" crlf)
    (printout t "Rear Window" crlf))


(defrule Recom78
    (recommendation78 ?i&:(fuzzy-match ?i "old-war-high"))
    =>
    (printout t "Where Eagles Dare" crlf))


(defrule Recom79
    (recommendation79 ?i&:(fuzzy-match ?i "old-western-high"))
    =>
    (printout t "The Magnficent Seven" crlf)
    (printout t "The Good, the Bad and the Ugly" crlf))






(defrule Recom20
    (recommendation20 ?i&:(fuzzy-match ?i "young-animation-scifi"))
    =>
    (printout t "Big Hero 6" crlf))


(defrule Recom40
    (recommendation40 ?i&:(fuzzy-match ?i "adult-animation-scifi"))
    =>
    (printout t "Ghost in the Shell" crlf))


(defrule Recom60
    (recommendation60 ?i&:(fuzzy-match ?i "middle-crime-thriller"))
    =>
    (printout t "No Country for Old Men" crlf)
    (printout t "The Departed" crlf))


(defrule Recom80
    (recommendation80 ?i&:(fuzzy-match ?i "old-war-romance"))
    =>
    (printout t "Gone with the Wind" crlf)
    )



(defrule Recom81
    (recommendation81 ?i&:(fuzzy-match ?i "young-kid-nopref"))
    =>
    (printout t "Zootopia" crlf)
    (printout t "Captain America: Civil War" crlf)
    (printout t "Jurassic World" crlf)
    (printout t "Guardians of the Galaxy Vol.2" crlf)
    
    )
(defrule Recom82
    (recommendation82 ?i&:(fuzzy-match ?i "young-adult-nopref"))
    =>
    (printout t "Deadpool" crlf)
    (printout t "Captain America: Civil War" crlf)
    (printout t "Logan" crlf)
    (printout t "It" crlf)
    (printout t "Jurassic World" crlf)
    (printout t "The Martian" crlf)
    (printout t "Interstellar" crlf)
    (printout t "Gone Girl" crlf)
    (printout t "Kingsman: The Secret Service " crlf))
(defrule Recom83
    (recommendation83 ?i&:(fuzzy-match ?i "middle-nopref"))
    =>
    (printout t "Whiplash" crlf)
    (printout t "The Shining" crlf)
    (printout t "The Wrestler" crlf)
    (printout t "Back to the Future series" crlf)
    (printout t "Indiana Jones series" crlf)
    (printout t "Star Wars series" crlf)
    (printout t "Star Trek series" crlf)
    (printout t "The Breakfast Club" crlf)
    )
(defrule Recom84
    (recommendation84 ?i&:(fuzzy-match ?i "old-nopref"))
    =>
    (printout t "The Best Exotic Marigold Hotel" crlf)
    (printout t "Grumpy Old Men" crlf)
    (printout t "As Good as It Gets" crlf)
    (printout t "Hachi – a Dog’s Tale" crlf))

(reset) 
(run) 