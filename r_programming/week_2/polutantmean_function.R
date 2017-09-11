pollutantmean<-function(directory, pollutant, id = 1:332){
        library(dplyr)
        ## 'directory' is a character vector of length 1 indicating the location
        ## the location of the csv files
        
        ## 'polutant' is a character vector of lenth 1 indicating 
        ## the name of the polutant for which we will calculate the
        ## mean; either 'sulfate' or 'nitrate'
        
        ## 'id' is an integer vector indicating the monitor id numbers
        ## to be used 
        #directory<-'specdata'
        working_dir<-paste('/Users/Work_JGI/Desktop/Coursera/', directory,'/', sep = '')
        working_dir
        setwd(working_dir)
        
        #id<-c(70:72)
        #pollutant<-'nitrate'
        id<-data.frame(id)
        id<-ifelse(id$id<10, paste('00',id$id,'.csv', sep = ''),
                   ifelse(id$id>= 10 & id$id < 100, paste('0',id$id,'.csv',sep = ''),
                          paste(id$id,'.csv', sep = '')))
        id_list<-list(id)
        mean_table<-data.frame(matrix(ncol = 3))
        colnames(mean_table)<- c('Date', pollutant, 'ID')
        for(i in id){
                file_read<-read.csv(i)
                mod_table<-file_read[c('Date', pollutant, 'ID')]
                # mean_row<-(mean(mod_table$nitrate,na.rm = TRUE))
                mean_table<-rbind(mean_table,mod_table)
                # mean_table<-rbind(mean_table,mean_row)
                
        }
        
        print(mean(mean_table[,2], na.rm = TRUE))
        
        
}
pollutantmean('specdata', 'nitrate', id = 23)

