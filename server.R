options(shiny.maxRequestSize=30*1024^2) 
shinyServer(function(input, output, session) {
  
  
  

    In <- eventReactive(input$Submit, {
	
	
  	  the.file <- input$filename
  	  # print(the.file$name)
  
        if(is.null(the.file))stop("Please upload data")
        Sep=strsplit(the.file$name,split=".", fixed=T)[[1]]
  	  # print(Sep)
  
        if(Sep[length(Sep)]=="csv")a1=read.csv(input$filename$datapath,stringsAsFactors=F,header=TRUE, row.names=1,comment.char="")
        if(Sep[length(Sep)]!="csv") {
          try((a1=read.table(input$filename$datapath,stringsAsFactors=F,header=TRUE, row.names=1,comment.char="")), silent=T)
    	  if(!exists("a1")) {
    		  print("Initial data import failed, file format may be incorrect. Trying alternate data import...")
            a0=read.table(input$filename$datapath,stringsAsFactors=F,header=TRUE, row.names=NULL,comment.char="")
            a1 <- data.matrix(a0[-1])
            rownames(a1) <- a0[[1]]
          }
        }
	a1 = a1 + 1
	a1
	})
  
   output$plot <- renderPlot({
	   a1 = In()
	   
	   rightend <- dim(a1)[2]
	   
	   if(input$feature == "") {
		   feature = rownames(a1)[1]
	   } else {
		   feature = input$feature
	   }
	   
       par(mfrow=c(1,2), cex=1.5, cex.lab=1, cex.axis=1, cex.main=1.1, mar=c(4,4,1,1), mgp=c(2,1,0))
       plot(1:rightend, a1[feature,]-1, pch=20, col="red", main=paste0(feature),
            ylab="Normalized Expr.", xlab="Timepoint")

		# addline1()

     plot(1:rightend, log(a1[feature,]), pch=20, col="red", main=paste0(feature),
          ylab="Log Normalized Expr.", xlab="Timepoint")
     # addline3()

     # addline4()
}, height=300, width=1000)



})