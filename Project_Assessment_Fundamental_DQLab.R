#Membuat Data Frame
df <- data.frame(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9))
df[,2]
df[1,1]
df[3,2]

#Membuat Vector dan Index Position
x <- c("red","blue","yellow","orange","green","purple")
y <- x[c(2,3,4)]
y

#Mengisi Syntax Factor
x <- as.factor(c('grape','apples','pear','cherry','mango','panda'))
x
x <- as.factor(c('grape','apples','pear','cherry','mango','apples'))
x

#Menggunakan Function
add_numbers <- function(x, y){
  x+y}
add_numbers(3,3)

#Mengganti Missing Value
df <- c(1,2,3,4,5,6,NA,7,8,9,NA)
df
mean_replace <- function(df){
  df[is.na(df)] <- mean(df, na.rm = TRUE)
  return (df)}
df <- mean_replace(df)
df


