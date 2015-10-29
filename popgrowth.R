


N_1 <- 2
r <- 1
k <- 1000

N_2 <- N_1+r*N_1*(1-N_1/k)

print(N_2)


N_3 <- N_2+*???N_2*(1-N_2/k)

print(N_3)


N_4 <- N_3+r*N_3*(1-N_3/k)

print(N_4)



#rep will repeat it based on ngen

dgrowth <- function(r, k, ngen, ninit){    # make a function named dgrowth witht arguements N, r, k, and ngen
    n <- rep(NA, ngen)                          # rep will repeat it ngen times
    n[1] <- ninit                               # NA in n becomes ninit because NA is in the first position of n
    for (i in 2:ngen){                          # begin a for loop starting at 2nd position
        n[i] <- n[i-1] + r * n[i-1] * (1-(n[i-1])/k)  # for each position i, run the equation. note syntax: n[i-1]
    }
    return(n)                                      # return value
}  


#n[2]<- n[1] + r * n[1] * 1-(n[1]/k) - this is the 1st time the loop is run with actual values instead of abstract


dgrowth(r = 1, k = 1000, ngen =  2, ninit = 1)  # N = initial population size, r and k are givens, ngen is number of generations (not individuals), ninit is the starting genearation

dgrowth(1, 1000, 3, 1)

dgrowth(1, 1000, 4, 1)

# make a data frame

ngen <- 100 
pop_100 <- dgrowth(r = 1, k = 1000, ngen = 100, ninit = 1)
time_100 <- 1:ngen
pop_df <- data.frame(N = pop_100, time = time_100)
options(scipen = 999)
print(pop_df)


# make plots!

library(ggplot2)

ggplot(data = pop_df, aes(x = time_100, y = pop_100)) + 
    geom_line()


# mess with r
ninit = 2
ngen  = 100
k = 1000
r_vals <- seq(from = 0.7, to= 3, by = 0.1)

#values of r from 0.7 to 3 by an increment of 0.1

# detour

pop1 <- dgrowth(r = 1, ninit = 1, k = 1000, ngen = 4)  # make a vector named pop1 from the output of dgrowth
pop_df1 <- data.frame(N = pop1, time = 1:4)            # make a data.frame out of pop1 and the values from 1:4 labeled time

pop2 <- dgrowth(r = 2, ninit = 1, k = 1000, ngen = 4)  # same as aboove
pop_df2 <- data.frame(N = pop2, time = 1:4)

pops_df <- rbind(pop_df1, pop_df2)                     # combines data tables as long as column names match up

# you would want to do this because you can run the function with a different set of initial conditions and then combine them into one data.frame


# want to run once for each year and once for each value of r

pop_df = data.frame(r = NA, gen = NA, N = NA)  # set up a dataframe to store results of loop because anything calculated in loop are temnprorary

ninit = 1
k = 1000
ngen = 4
r_vals <- seq(from = 0.7, to= 3, by = 0.1)

for (r in r_vals){
    N <- dgrowth(r =r, k = k, ngen = ngen, ninit = ninit)
    gen = 1:ngen
    r <- r
    pop_df_r <- data.frame(r = r, gen = gen, N = N)
    pop_df <- rbind(pop_df, pop_df_r)
}






