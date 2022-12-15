###########################
# SETUP
###########################
# Install "boxr", if you don't have it installed already. Load the boxr package. 
#
# boxr library establishes a communication ( allows you to read/write files that
# you have access to) from your local (e.g., in your laptop) RStudio and your 
# remotely located (on the cloud) Box.com storage space.

install.packages("boxr")
library(boxr)

####################################
# AUTHENTICATION
####################################
# Authentication is the process of providing permission to your RStudio tool to
# access your Box.com account, on your behalf.
# If you are not already logged into Box after running this code, you may be
# asked to log into Box. Identify Box as your hard disk in the cloud.

box_auth(client_id = "627lww8un9twnoa8f9rjvldf7kb56q1m",
         client_secret = "gSKdYKLd65aQpZGrq9x4QVUNnn5C8qqm") 

# Set the working directory to the "My Private Data" 
# Box folder using the folder ID
box_setwd(dir_id = 185780841823)

####################################
# READ IN FILES
####################################
# box_read reads the file into local memory - see the console after running the 
# code for the temporary file path. After closing your RStudio session the 
# file/data is deleted from the temporary local memory.

# NOTE: The file ID is needed to read in the bc_data.csv file

bc_data = box_read(file_id = 1091187602667)

##################
#### MODELING ####
##################

model <- glm(
  status ~ parity + age, 
  data = bc_data, 
  family = "binomial"
)

summary(model)

sink("model.txt")

print(summary(model))
