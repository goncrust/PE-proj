# Setup, lambda = 19.5
set.seed(4666);
sample <- rexp(1079, rate = 19.5);
# Calculating constants
time <- cumsum(sample);
T <- ceiling(time[[1079]]);
# Getting the amount of events per second; events ~ Poi(19.5)
events <- rep(0, T);
for (t in time) events[[ceiling(t)]] <- events[[ceiling(t)]] + 1
# Getting the expected values and the mean
mean <- mean(events);
expected <- 19.5; # Expected value of a Poisson distribution is lambda
# Calculating the answer
ans <- abs(mean - expected);
print(ans)