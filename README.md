# ProcessBuilders
This illustrates on how to use process builders and process to perform different task like postgresql backups


 Use a ProcessBuilder to take backups of your Exams Postgresql DB, using the pg_dump 
command. Please note that you are not doing database connections. 
Introduce a means to take the backups every 1 minute, and dump the backups in a folder. Once 
they reach 10 backups, rotate them by discarding the oldest backup, to ensure you maintain a 
maximum of only 10. 

b. In a separate program, detect the type of operating system you application is running on. Use a 
processbuilder to list all running processes in the OS. Create a folder in the current directory 
using the mkdir command, and change directory to that folder. Using the echo command, write 
to a file called “running_processes.txt” all the processes running in the OS. 

c. Use a processbuilder to display your disk information e.g. partions and their sizes
