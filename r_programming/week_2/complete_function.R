complete<-function(directory = 'specdata', id = 1:332){
        ## 'directory' is a character vector of length 1 indicating the location
        ## the location of the csv files
        
        ## 'id' is an integer vector indicating the monitor id numbers
        ## to be used 
        directory<-'specdata'
        working_dir<-paste('/Users/Work_JGI/Desktop/Coursera/', directory,'/', sep = '')
        working_dir
        setwd(working_dir)
        
        #id<-c(1:3)
        count_table<-data.frame(integer(), integer())
        #count_table<-data.frame(matrix(ncol = 2))
        colnames(count_table)<- c('id', 'nobs')
        for(i in id){
                id<-data.frame(i)
                id_csv<-ifelse(id$i<10, paste('00',id$i,'.csv', sep = ''),
                               ifelse(id$i>= 10 & id$i < 100, paste('0',id$i,'.csv',sep = ''),
                                      paste(id$i,'.csv', sep = '')))
                file_read<-read.csv(id_csv)
                #table_1 <- file_read[!is.na(file_read$nitrate) & !is.na(file_read$sulfate),]
                count_t<-data.frame(matrix(c(unlist(id), unlist(sum(complete.cases(file_read)))), ncol = 2))
                colnames(count_t)<- c('id', 'nobs')
                count_table<-rbind(count_table, count_t)
                
        }
       count_table<-count_table[complete.cases(count_table),]
       count_table
        
}

complete('specdata', id = 1:25)
