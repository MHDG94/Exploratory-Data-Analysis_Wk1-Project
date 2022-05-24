
R version 4.1.2 (2021-11-01) -- "Bird Hippie"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin17.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.77 (8007) x86_64-apple-darwin17.0]

[Workspace restored from /Users/mohamedghazal/.RData]
[History restored from /Users/mohamedghazal/.Rapp.history]

> setwd("~/Desktop/Data")
> power_consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")
> names(power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
> subpower <- subset(power_consumption,power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")
> subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
> subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
> subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
> subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
> par(mfrow=c(2,2))
> with(subpower,{
+ plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")
+ plot(subpower$Time,as.numeric(as.character(subpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
+ plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
+ with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
+ with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
+ with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
+ legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
+ plot(subpower$Time,as.numeric(as.character(subpower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})