###############################################################################################
################################# EMOTIONS SET ################################################
###############################################################################################

# Numbers of trials, subejcts and observations
SCENARIO_NAMES <- c('S1','S2','S3','S4','S5','S6','S7','S8','S9','S10')
NUM_SCENARIOS <- length(SCENARIO_NAMES)
NUM_TRIALS <- NUM_SCENARIOS * 100
NUM_SUBS <- 30
NUM_OBS <- NUM_TRIALS*NUM_SUBS

# percent of subjects that consented, and their genders
PERCENT_CONSENTED <- .9
GENDER_FEMALE_COUNT <- round(NUM_SUBS*.45)
GENDER_PERCENTS <- c(GENDER_FEMALE_COUNT, 2*GENDER_FEMALE_COUNT, NUM_SUBS-(2*GENDER_FEMALE_COUNT))
GENDER_NAMES <- c('Female', 'Male', 'Other')

# generate the random values for the per-subject values
ANXIETY <- runif(NUM_SUBS,1,10)
AGES <- rnorm(NUM_SUBS, mean=30, sd=3)
AGES[AGES<18] <- 18
WEIGHTS <- rnorm(NUM_SUBS, mean=150, sd=30)
HEIGHTS <- rnorm(NUM_SUBS, mean=66, sd=3)

# create 3 randomizations of the scenario orders
NUM_RANDOMIZATIONS <- 3
SCENARIOS_RAW <- rep(1:NUM_SCENARIOS,NUM_TRIALS/NUM_SCENARIOS)
SCENRAIOS <- list(NUM_RANDOMIZATIONS)
for (curRand in 1:NUM_RANDOMIZATIONS) {
  SCENRAIOS[[curRand]] <- SCENARIO_NAMES[sample(SCENARIOS_RAW)]
}

# define the weights the beta values should take for all the variables
STANDARDIZED_BETAS_VALENCE <- c(0,c(.002, 4, 5, 2, .001, .002, .001, .002, .001), .5, .05, .02, 2.5, .01, .03)
STANDARDIZED_BETAS_AROUSAL <- c(0,c(.002, .001, .002, 2, 3, 4, .001, .002, .001), 3, .2, .1, 2.9, .01, .03)
STANDARDIZED_BETAS_DOMINANCE <- c(0,c(.002, .001, .002, .001, .002, 4, 2, 3, 1), .8, .1, .15, 4.2, .01, .03)

NOISE_LEVEL <- 10

# Pre-allocate the data frame to save on memory
emotions_df <- data.frame(Valence=numeric(NUM_OBS),
                         Arousal=numeric(NUM_OBS),
                         Dominance=numeric(NUM_OBS),
                         Consent=logical(NUM_OBS),
                         TrialNo=integer(NUM_OBS),
                         SubjectNo=integer(NUM_OBS),
                         Scenario=factor(character(NUM_OBS),levels=SCENARIO_NAMES),
                         Anxiety=integer(NUM_OBS),
                         Gender=factor(character(NUM_OBS), levels=GENDER_NAMES),
                         Age=integer(NUM_OBS),
                         Weight=numeric(NUM_OBS),
                         Height=numeric(NUM_OBS),
                         stringsAsFactors = FALSE)

# Pull out the names of the independent variables for use later
INDEPENDENT_VARIABLE_NAMES = colnames(emotions_df)
INDEPENDENT_VARIABLE_NAMES <- INDEPENDENT_VARIABLE_NAMES[-c(1,2,3,4,5,6)]

# loop over all the "subjects" and make a dataset for each one
for (curSub in 1:NUM_SUBS){

  # create the indices of the first and last trial for the current subject
  curStart <- (curSub-1)* NUM_TRIALS + 1
  curEnd <- curSub*NUM_TRIALS

  # assign all the Per-Subject Variables
  emotions_df[curStart:curEnd, 'SubjectNo'] <- curSub
  emotions_df[curStart:curEnd, 'Consent'] <- curSub <= as.integer(NUM_SUBS*PERCENT_CONSENTED)
  emotions_df[curStart:curEnd, 'Age'] <- AGES[curSub]
  emotions_df[curStart:curEnd, 'Weight'] <- WEIGHTS[curSub]
  emotions_df[curStart:curEnd, 'Height'] <- HEIGHTS[curSub]
  emotions_df[curStart:curEnd, 'Anxiety'] <- ANXIETY[curSub]
  if (curSub < GENDER_PERCENTS[1]){
    emotions_df[curStart:curEnd, 'Gender'] <- GENDER_NAMES[1]
  } else if(curSub < GENDER_PERCENTS[2]){
    emotions_df[curStart:curEnd, 'Gender'] <- GENDER_NAMES[2]
  } else {
    emotions_df[curStart:curEnd, 'Gender'] <- GENDER_NAMES[3]
  }

  # assign all the per trial variables
  emotions_df[curStart:curEnd, 'TrialNo'] <- 1:NUM_TRIALS
  curSubRand <- (curSub%%NUM_RANDOMIZATIONS) + 1
  curSubScenarios <- SCENRAIOS[[curSubRand]]
  emotions_df[curStart:curEnd, 'Scenario'] <- curSubScenarios
}

# create the design matrix for the current subject by binding all the columns
designMat <- model.matrix(~Scenario+Anxiety+Gender+Age+Weight+Height, emotions_df)

# standardize the design mat
designMatStd <- cbind( designMat[,1], scale(designMat[,-1], center = FALSE))

# create the dependent variable values by muiltiplying the design matrix times the desired BETA weights, and adding noise
emotions_df[, 'Valence'] <- as.vector(designMatStd%*%STANDARDIZED_BETAS_VALENCE + rnorm(NUM_TRIALS, 0, NOISE_LEVEL))
emotions_df[, 'Arousal'] <- as.vector(designMatStd%*%STANDARDIZED_BETAS_AROUSAL + rnorm(NUM_TRIALS, 0, NOISE_LEVEL))
emotions_df[, 'Dominance'] <- as.vector(designMatStd%*%STANDARDIZED_BETAS_DOMINANCE + rnorm(NUM_TRIALS, 0, NOISE_LEVEL))

model_Valence <- lm(Valence~Scenario+Anxiety+Gender+Age+Weight+Height, data=emotions_df)
summary(model_Valence)
model_Arousal <- lm(Arousal~Scenario+Anxiety+Gender+Age+Weight+Height, data=emotions_df)
summary(model_Arousal)
model_Dominance <- lm(Dominance~Scenario+Anxiety+Gender+Age+Weight+Height, data=emotions_df)
summary(model_Dominance)

write.csv(emotions_df, 'emotions.csv')

# create the version of the dataframe that has missing data
OBS_WITH_MISSING_DATA <- logical(NUM_OBS)
OBS_WITH_MISSING_DATA[1:3000] <- TRUE
OBS_WITH_MISSING_DATA <- sample(OBS_WITH_MISSING_DATA)
emotions_missing_df <- emotions_df
emotions_missing_df$Arousal[OBS_WITH_MISSING_DATA] <- NA
write.csv(emotions_missing_df, 'emotions_missing.csv')

# create the dataframe with education level
EDUCATION_NAMES <- c('SomeHigh', 'HighSchool', 'College', 'Advanced')
NUM_SOMEHIGH <- as.integer(NUM_SUBS*.1)
NUM_HIGHSCHOOL <- as.integer(NUM_SUBS*.2)
NUM_COLLEGE <- as.integer(NUM_SUBS*.6)
EDUCATION_VALUES <- character(NUM_SUBS)
EDUCATION_VALUES[1:NUM_SOMEHIGH] <- EDUCATION_NAMES[1]
EDUCATION_VALUES[NUM_SOMEHIGH+1:(NUM_SOMEHIGH+NUM_HIGHSCHOOL)] <- EDUCATION_NAMES[2]
EDUCATION_VALUES[(NUM_SOMEHIGH+NUM_HIGHSCHOOL)+1:(NUM_SOMEHIGH+NUM_HIGHSCHOOL+NUM_COLLEGE)] <- EDUCATION_NAMES[3]
EDUCATION_VALUES[(NUM_SOMEHIGH+NUM_HIGHSCHOOL+NUM_COLLEGE)+1:NUM_SUBS] <- EDUCATION_NAMES[4]
education_df <- data.frame(SubjectNo=integer(NUM_OBS),
                           Education=factor(character(NUM_OBS),levels=EDUCATION_NAMES))
for (curSub in 1:NUM_SUBS){
  
  # create the indices of the first and last trial for the current subject
  curStart <- (curSub-1)* NUM_TRIALS + 1
  curEnd <- curSub*NUM_TRIALS
  
  # assign all the Per-Subject Variables
  education_df[curStart:curEnd, 'SubjectNo'] <- curSub
  education_df[curStart:curEnd, 'Education'] <- EDUCATION_VALUES[curSub]
}
write.csv(education_df, 'education.csv')
###############################################################################################
################################# Election SET ################################################
###############################################################################################


# Numbers of trials, subejcts and observations
NUM_SUBS <- 10000

# percent of subjects that consented, and their genders
GENDER_FEMALE_COUNT <- round(NUM_SUBS*.45)
GENDER_PERCENTS <- c(GENDER_FEMALE_COUNT, 2*GENDER_FEMALE_COUNT, NUM_SUBS-(2*GENDER_FEMALE_COUNT))
GENDER_NAMES <- c('Female', 'Male', 'Other')

PARTY_NAMES = c('Dem', 'Rep', 'Other')
DEM_COUNT <- round(NUM_SUBS*.48)
PARTY_AFFILIATION <- integer(NUM_SUBS)
PARTY_AFFILIATION[1:DEM_COUNT] = PARTY_NAMES[1]
PARTY_AFFILIATION[(DEM_COUNT+1):(2*DEM_COUNT)] = PARTY_NAMES[2]
PARTY_AFFILIATION[(2*DEM_COUNT+1):NUM_SUBS] = PARTY_NAMES[3]
PARTY_AFFILIATION <- sample(PARTY_AFFILIATION)

STATE_NAMES <- c('CA', 'NY', 'FL', 'OH', 'KY')
NUM_STATES <- length(STATE_NAMES)
NUM_SUBS_PER_STATE <- NUM_SUBS/NUM_STATES
STATE <- integer(NUM_SUBS)
for (curState in 1:NUM_STATES){
  STATE[((curState-1)*NUM_SUBS_PER_STATE+1):(curState*NUM_SUBS_PER_STATE)] = STATE_NAMES[curState]
}

# generate the random values for the per-subject values
AGES <- rnorm(NUM_SUBS, mean=30, sd=3)
AGES[AGES<18] <- 18

# create correlated spending between dems and prop1 and reps and prop2
spendingCov = matrix(0.2, ncol=4, nrow=4)
diag(spendingCov) = c(30,10,7,5)
spendingCov[1,3] <- 1
spendingCov[3,1] <- 1
spendingCov[2,4] <- 2
spendingCov[4,2] <- 2
spendingMean <- c(100, 200, 30, 70)
spending <-mvtnorm::rmvnorm(NUM_SUBS, mean = spendingMean, sigma = spendingCov)
SPENDING_DEM <- spending[,1]
SPENDING_REP <- spending[,2]
SPENDING_PROP1 <- spending[,3]
SPENDING_PROP2 <- spending[,4]

# define the weights the beta values should take for all the variables
STANDARDIZED_BETAS_SENATOR <- c(0,c(2, .001), c(1, .01), 1, c(0, -.5, -1, -2), 1.4, -2.5, 0, 0)
STANDARDIZED_BETAS_REPRESENTATIVE <- c(0,c(3, .01), c(1, 1), 2, c(.3, 1, 1, 1), .6, -.9, 0, 0)
STANDARDIZED_BETAS_PROP1 <- c(0,c(-2, .01), c(2, .01), .1, c(.2, .1, -3, -3), 0, 0, 1.4, -1)
STANDARDIZED_BETAS_PROP2 <- c(0,c(1, .01), c(-1, .01), .3, c(.1, 0, -1, -2), 0, 0, .7, -2)

NOISE_LEVEL <- 10

# Pre-allocate the data frame to save on memory
election_df <- data.frame(SenatorDem=logical(NUM_SUBS),
                          RepresentativeDem=logical(NUM_SUBS),
                          Prop1Pass=logical(NUM_SUBS), 
                          Prop2Pass=logical(NUM_SUBS),
                          PartyAffiliation=factor(character(NUM_SUBS),levels=PARTY_NAMES),
                          Gender=factor(character(NUM_SUBS), levels=GENDER_NAMES),
                          Age=integer(NUM_SUBS),
                          State=factor(character(NUM_SUBS), levels=STATE_NAMES),
                          DemSpending=numeric(NUM_SUBS),
                          RepSpending=numeric(NUM_SUBS),
                          Prop1Spending=numeric(NUM_SUBS),
                          Prop2Spending=numeric(NUM_SUBS),
                          stringsAsFactors = FALSE)

# loop over all the "subjects" and make a dataset for each one
for (curSub in 1:NUM_SUBS){
  
  # assign all the Per-Subject Variables
  election_df[curSub, 'PartyAffiliation'] <- PARTY_AFFILIATION[curSub]
  election_df[curSub, 'Age'] <- AGES[curSub]
  election_df[curSub, 'State'] <- STATE[curSub]
  election_df[curSub, 'DemSpending'] <- SPENDING_DEM[curSub]
  election_df[curSub, 'RepSpending'] <- SPENDING_REP[curSub]
  election_df[curSub, 'Prop1Spending'] <- SPENDING_PROP1[curSub]
  election_df[curSub, 'Prop2Spending'] <- SPENDING_PROP2[curSub]
  if (curSub < GENDER_PERCENTS[1]){
    election_df[curSub, 'Gender'] <- GENDER_NAMES[1]
  } else if(curSub < GENDER_PERCENTS[2]){
    election_df[curSub, 'Gender'] <- GENDER_NAMES[2]
  } else {
    election_df[curSub, 'Gender'] <- GENDER_NAMES[3]
  }
}

# create the design matrix for the current subject by binding all the columns
designMat <- model.matrix(~PartyAffiliation+Age+Gender+State+DemSpending+RepSpending+Prop1Spending+Prop2Spending, election_df)

# standardize the design mat
designMatStd <- cbind( designMat[,1], scale(designMat[,-1], center = FALSE))

# create the dependent variable values by muiltiplying the design matrix times the desired BETA weights, and adding noise
election_df[, 'SenatorDem'] <- exp(as.vector(designMatStd%*%STANDARDIZED_BETAS_SENATOR + rnorm(NUM_SUBS, 0, NOISE_LEVEL)))
election_df[, 'SenatorDem'] <- election_df[, 'SenatorDem'] / (1 + election_df[, 'SenatorDem']) > .5
election_df[, 'RepresentativeDem'] <- exp(as.vector(designMatStd%*%STANDARDIZED_BETAS_REPRESENTATIVE + rnorm(NUM_SUBS, 0, NOISE_LEVEL)))
election_df[, 'RepresentativeDem'] <- election_df[, 'RepresentativeDem'] / (1 + election_df[, 'RepresentativeDem']) > .5
election_df[, 'Prop1Pass'] <- exp(as.vector(designMatStd%*%STANDARDIZED_BETAS_PROP1 + rnorm(NUM_SUBS, 0, NOISE_LEVEL)))
election_df[, 'Prop1Pass'] <- election_df[, 'Prop1Pass'] / (1 + election_df[, 'Prop1Pass']) > .5
election_df[, 'Prop2Pass'] <- exp(as.vector(designMatStd%*%STANDARDIZED_BETAS_PROP2 + rnorm(NUM_SUBS, 0, NOISE_LEVEL)))
election_df[, 'Prop2Pass'] <- election_df[, 'Prop2Pass'] / (1 + election_df[, 'Prop2Pass']) > .5

model_Senate <- glm(SenatorDem~PartyAffiliation+Age+Gender+State+DemSpending+RepSpending+Prop1Spending+Prop2Spending, data=election_df, family="binomial")
summary(model_Senate)
model_Representative <- glm(RepresentativeDem~PartyAffiliation+Age+Gender+State+DemSpending+RepSpending+Prop1Spending+Prop2Spending, data=election_df, family="binomial")
summary(model_Representative)
model_Prop1 <- glm(Prop1Pass~PartyAffiliation+Age+Gender+State+DemSpending+RepSpending+Prop1Spending+Prop2Spending, data=election_df, family="binomial")
summary(model_Prop1)
model_Prop2 <- glm(Prop2Pass~PartyAffiliation+Age+Gender+State+DemSpending+RepSpending+Prop1Spending+Prop2Spending, data=election_df, family="binomial")
summary(model_Prop2)

write.csv(election_df, 'election.csv')

# create the version of the dataframe that has missing data
OBS_WITH_MISSING_DATA <- logical(NUM_SUBS)
OBS_WITH_MISSING_DATA[1:500] <- TRUE
OBS_WITH_MISSING_DATA <- sample(OBS_WITH_MISSING_DATA)
election_missing_df <- election_df
election_missing_df$PartyAffiliation[OBS_WITH_MISSING_DATA] <- NA
write.csv(election_missing_df, 'emotions_missing.csv')
