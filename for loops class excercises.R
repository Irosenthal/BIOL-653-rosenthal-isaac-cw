
##### for loops excercize ######
 mat <- matrix(1:100, nrow = 10, ncol = 10)
for (i in 1:100){
    print(i)
}


set.seed(1)
x <- round(runif(min = 10, max = 100, n = 15))
# creating a vecotor of random numbers using a set seed, from 10 to 100 containing 15 values


#3a
for (i in x){
    print(paste(i)) # this works and makes sense
}

#3b
x <- round(runif(min = 10, max = 100, n = 15))

counts <- vector(length = length(x))   # this doesn't work and doesn't make sense
for (i in x){
   counts <- paste(i)
}


# paste converts it's arguements into a string



#4

for (i in 1:10){
    sq <- 2^i
    print(sq)   # this was easy
}   

#5

matr <- matrix(1:12, nrow = 12, ncol = 12)
print(matr)    # this is cheating



for (i in 1:12){
matr <- i*i
print(matr)
}   # but this is broken.
