   # ANÁLISIS EXPLORATORIO DE DATOS
   # ==============================

  # PROYECTO 1
  # ----------

# Lectura del conjunto de datos
household <- read.table("C:/Users/Lorena/Desktop/Coursera/Toolbox Data Science/explorador de datos/household.txt", header = TRUE, sep = ";", dec = ".")
names(household)
   # tamaño del conjunto de datos
length(household$Date)

household$Global_active_power <- as.numeric(household$Global_active_power)
class(household$Global_active_power)


household$Time <- strptime(paste(household$Date, household$Time), "%d/%m/%Y %H:%M:%S")
household$Date <- as.Date(household$Date, "%d/%m/%Y")
    
# Solamente usaremos los datos con fechas: 2007-02-01 y 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
household <- subset(household, Date %in% dates)
household[1:10,]



# Representaciones gráficas
 par(mfrow=c(2,2))

 # Gráfico 1
 # ---------

png("plot1.png", width=480, height=480)

hist(household$Global_active_power,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         col="red")

dev.off()

  # Gráfico 2
  # ---------

png("plot2.png", width=480, height=480)

plot(household$Time, household$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
dev.off()

  # Gráfico 3
  # ---------

png("plot3.png", width=480, height=480)

plot(household$Time, household$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    lines(household$Time, household$Sub_metering_2, col="red")
    lines(household$Time, household$Sub_metering_3, col="blue")
    legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)
dev.off()


  # Gráfico 4
  # ---------

png("plot4.png", width=480, height=480)

plot(household$Time, household$Global_reactive_power, type="n",
         xlab="datetime", ylab="Global_reactive_power")
    lines(household$Time, household$Global_reactive_power)
 
dev.off()
