library(readxl)
library(knitr)
library(kableExtra)
library(tidyverse)
matriculados <- read_excel("data/matriculados.xlsx")
listado1 <- read_excel("data/listado-estudiantes-javerianacaliinterniships5.xlsx")
matriculados20232 = subset(matriculados,matriculados$Periodo == "20232")

listado1$cruce = ifelse(listado1$ID %in% matriculados$ID, 1, 0)


listado1$pendiente= as.numeric(listado1$Empresa=="Pendiente")
listado1$activos=as.numeric(listado1$Estado != "Pausado")
listado1$pausado=as.numeric(listado1$Estado == "Pausado")

t0=table(matriculados20232$"Programa Academico") %>% 
            as.data.frame()# matriculadis
t1=table(listado1$Carrera ,listado1$cruce)%>% 
  as.data.frame.matrix()   #  falta matric /programa

t2= table(listado1$Carrera,listado1$pendiente)%>% 
  as.data.frame.matrix() # ubicados /pausados

t3=  table(listado1$Carrera, listado1$activos) %>% 
  as.data.frame.matrix() # programa

t4= table(listado1$Carrera,listado1$pausado)%>% 
  as.data.frame.matrix() # ubicados /pausados


comovamos = cbind(t0,t1,t2,t3)
comovamos[, c(1,2,4,3,5,7)]













# 
# 
# t1=table(listado$Carrera,listado$cruce)
# t1=as.data.frame.matrix(t1)
# 
# matriculados20232 = subset(matriculados,matriculados$Periodo == "20232")
# t2 =table(matriculados20232$`Programa Academico`)
# t2 =as.data.frame(t2)  # matriculados
# 
# t3=table(listado$Carrera,listado$pendiente)
# t3=as.data.frame.matrix(t3) # pendientes - ubicados
# 
# t4=table(listado2$Carrera)
# t4=as.data.frame(t4)  # pausados
# 
# 
# comovamos = cbind(t2,t1,t3)
# 
# comovamos
# 
# 
# comovamos = cbind(t2,t1[23:44,],t1[1:22,],t3[1:22,],t3[23:44,])
# comovamos =comovamos[,c(1,2,5,8,11,14)]
# 
# colnames(comovamos)= c("Carrera","Matriculados","Programa Prácticas","Falta Matrícula","Ubicados","Rotando")
# #rownames(comovamos)= c(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," ")
# # tabla = kable(comovamos,format = "html") %>%
# #   kable_styling(bootstrap_options = "striped", full_width = FALSE)
# # tabla
# 
# comovamos
# 
# 
# 
