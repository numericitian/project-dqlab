library("openxlsx")
library("C50")

#Mempersiapkan data
dataCreditRating <- read.xlsx(xlsxFile = "https://storage.googleapis.com/dqlab-dataset/credit_scoring_dqlab.xlsx")
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating) 

#Menggunakan C5.0
drop_columns <- c("kpr_aktif", "pendapatan_setahun_juta", "risk_rating", "rata_rata_overdue")
datafeed <- dataCreditRating[ , !(names(dataCreditRating) %in% drop_columns)]
modelKu <- C5.0(datafeed, as.factor(dataCreditRating$risk_rating))
summary(modelKu)

##########################################
##Load packages
library("openxlsx")
library("C50")

#Read Data
dataCreditRating <- read.xlsx(xlsxFile = "https://storage.googleapis.com/dqlab-dataset/credit_scoring_dqlab.xlsx")
str(dataCreditRating)

##Data Preparation
#Melakukan konversi kolom risk_rating menjadi factor
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating) 

#Melihat struktur setelah konversi
str(dataCreditRating$risk_rating)

#Menghilangkan beberapa variable input dari dataset 
input_columns <- c("durasi_pinjaman_bulan", "jumlah_tanggungan")
datafeed <- dataCreditRating[ , input_columns ]
str(datafeed)

#Mempersiapkan porsi index acak untuk training dan testing set
set.seed(100)
indeks_training_set <- sample(900, 800)

#Membuat dan menampilkan training set dan testing set
input_training_set <- datafeed[indeks_training_set,]
class_training_set <- dataCreditRating[indeks_training_set,]$risk_rating
input_testing_set <- datafeed[-indeks_training_set,]

str(input_training_set)
str(class_training_set)
str(input_testing_set)

#menghasilkan dan menampilkan summary model
risk_rating_model <- C5.0(input_training_set, class_training_set)
summary(risk_rating_model)
plot(risk_rating_model)

#menghasilkan model
risk_rating_model <- C5.0(input_training_set, class_training_set, 
                          control = C5.0Control(label="Risk Rating"))
summary(risk_rating_model)

###################################################
library("openxlsx")
library("C50")

#Mempersiapkan data
dataCreditRating <- read.xlsx(xlsxFile = "https://storage.googleapis.com/dqlab-dataset/credit_scoring_dqlab.xlsx")

#Mempersiapkan class dan input variables 
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating) 
input_columns <- c("durasi_pinjaman_bulan", "jumlah_tanggungan", "kpr_aktif")
datafeed <- dataCreditRating[ , input_columns ]

#Mempersiapkan training dan testing set
set.seed(100) #untuk menyeragamkan hasil random antar tiap komputer
indeks_training_set <- sample(900, 780)

#############################################################################
library("openxlsx")
library("C50")

#Mempersiapkan data
dataCreditRating <- read.xlsx(xlsxFile = "https://storage.googleapis.com/dqlab-dataset/credit_scoring_dqlab.xlsx")

#Mempersiapkan class dan input variables
dataCreditRating$risk_rating[dataCreditRating$risk_rating == "1"] <- "satu"
dataCreditRating$risk_rating[dataCreditRating$risk_rating == "2"] <- "dua"
dataCreditRating$risk_rating[dataCreditRating$risk_rating == "3"] <- "tiga"
dataCreditRating$risk_rating[dataCreditRating$risk_rating == "4"] <- "empat"
dataCreditRating$risk_rating[dataCreditRating$risk_rating == "5"] <- "lima"
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating)
input_columns <- c("durasi_pinjaman_bulan", "jumlah_tanggungan")
datafeed <- dataCreditRating[ , input_columns ]

#Mempersiapkan training dan testing set
set.seed(100) #untuk menyeragamkan hasil random antar tiap komputer
indeks_training_set <- sample(900, 800)

#Membuat dan menampilkan training set dan testing set
input_training_set <- datafeed[indeks_training_set,]
class_training_set <- dataCreditRating[indeks_training_set,]$risk_rating
input_testing_set <- datafeed[-indeks_training_set,]

#menghasilkan model
risk_rating_model <- C5.0(input_training_set, class_training_set, control = C5.0Control(label="Risk Rating"))
summary(risk_rating_model)

#Membuat dan menampilkan training set dan testing set
input_training_set <- datafeed[indeks_training_set,]
class_training_set <- dataCreditRating[indeks_training_set,]$risk_rating
input_testing_set <- datafeed[-indeks_training_set,]

#menghasilkan model
risk_rating_model <- C5.0(input_training_set, class_training_set, control = C5.0Control(label="Risk Rating"))
summary(risk_rating_model)

#menggunakan model untuk prediksi testing set
predict(risk_rating_model, input_testing_set)

#menyimpan risk_rating dari data awal dan hasil prediksi testing set ke dalam kolom hasil_prediksi
input_testing_set$risk_rating <- dataCreditRating[-indeks_training_set,]$risk_rating
input_testing_set$hasil_prediksi <- predict(risk_rating_model, input_testing_set)

#menampilkan variable input_testing_set
print(input_testing_set)

#membuat confusion matrix
library(reshape2)
dcast(hasil_prediksi ~ risk_rating, data=input_testing_set)

#Menghitung jumlah prediksi yang benar
nrow(input_testing_set[input_testing_set$risk_rating==input_testing_set$hasil_prediksi,])

#Menghitung jumlah prediksi yang salah
nrow(input_testing_set[input_testing_set$risk_rating!=input_testing_set$hasil_prediksi,])

#Membuat data frame aplikasi baru
aplikasi_baru <- data.frame(jumlah_tanggungan = 5, durasi_pinjaman_bulan = 24)
print(aplikasi_baru)
aplikasi_baru1 <- data.frame(jumlah_tanggungan = c(4,7,3,6,2), 
                             durasi_pinjaman_bulan = c(24,28,18,20,26))
print(aplikasi_baru1)
predict(risk_rating_model,aplikasi_baru1)

#melakukan prediksi
predict(risk_rating_model, aplikasi_baru1)

##Mengubah durasi peminjaman
#Membuat data frame aplikasi baru
aplikasi_baru <- data.frame(jumlah_tanggungan = 6, durasi_pinjaman_bulan = 64)

#melakukan prediksi
predict(risk_rating_model, aplikasi_baru)
