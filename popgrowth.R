


N_1 <- 2
r <- 1
k <- 1000

N_2 <- N_1+r*N_1*(1???N_1/k)

print(N_2)


N_3 <- N_2+*???N_2*(1???N_2/k)

print(N_3)


N_4 <- N_3+r*N_3*(1???N_3/k)

print(N_4)



#rep will repeat it based on ngen

dgrowth <- function(n, r, k, ngen, ninit){    # make a function named dgrowth witht arguements N, r, k, and ngen
    n <- rep(NA, ngen)                          # rep will repeat it ngen times
    n[1] <- ninit                               # NA in n becomes ninit because NA is in the first position of n
    for (i in 2:ngen){                          # begin a for loop starting at 2nd position
        n[i] <- (n[i-1])+r???(n[i-1]???1???(n[i-1])/k)  # for each position i, run the equation. note syntax: n[i-1]
    }
    print(n)                                      # return value
}  


#n[2]<- n[1] + r * n[1] * 1-(n[1]/k) - this is the 1st time the loop is run with actual values instead of abstract


dgrowth(2, 1, 1000, 2, 1)  # N = initial population size, r and k are givens, ngen is number of generations (not individuals), ninit is the starting genearation

dgrowth(2, 1, 1000, 3, 1)

dgrowth(2, 1, 1000, 4, 1)

# make a data frame

ngen <- 100
pop_100 <- dgrowth(2, 1, 1000, 100, 1)
time_100 <- 1:ngen
pop_df <- data.frame(N = pop_100, time = time_100)
options(scipen = 999)
print(pop_df)


# make plots!

library(ggplot2)

























