source('/Users/Work_JGI/Desktop/Coursera/complete_function.R')
corr<-function(directory, threshold = 0){
        ## 'directory' is a character vector of length 1 indicating the location
        ## the location of the csv files
        
        ## 'threshold'
        #directory<-'specdata'
        thresh_table<-complete(directory)
        #threshold <- 1000
        filt_thresh_table<-thresh_table[thresh_table$nobs >= threshold,]
        id_thresh<-data.frame(id =filt_thresh_table$id)
        id_csv<-ifelse(id_thresh$id<10, paste('00',id_thresh$id,'.csv', sep = ''),
                       ifelse(id_thresh$id>= 10 & id_thresh$id < 100, paste('0',id_thresh$id,'.csv',sep = ''),
                              paste(id_thresh$id,'.csv', sep = '')))
        test<-data.frame(id_csv)
        corr_table<-data.frame(corr = numeric())
        for (i in id_csv){
                file_read<- read.csv(i)
                complete<-file_read[complete.cases(file_read),]
                cor_indv<-cor(complete$sulfate, complete$nitrate)
                corr_table<-rbind(corr_table, cor_indv)
                
        }
        corr_table
}

cr<- corr('specdata')
summary(cr)
length(cr)
