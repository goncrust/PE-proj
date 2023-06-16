# Projeto de PE: 4-10

# Setup
lambda <- 7.5
size <- 2072
set.seed(4267);
sample <- rexp(size, lambda);

# Calculating constants
time <- cumsum(sample);
T <- ceiling(time[[size]]);

# Getting the amount of events per second; events ~ Poi(lambda)
#intervals <- 1:T
#counts <- tabulate(findInterval(time, intervals))
events <- rep(0, T);
for (t in time) events[[ceiling(t)]] <- events[[ceiling(t)]] + 1

# Getting the expected values and the mean
mean <- mean(events);
expected <- lambda; # Expected Val of Poisson is lambda

# Calculating the answer
ans <- abs(mean - expected);
ans <- round(ans, 4)
print(ans)

