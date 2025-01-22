package PostgresqlBackup;


import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;



public class Main {


    public static void main(String[] args) {

        PSQLBackup backup = new PSQLBackup();

        //create backup directory if it doesn't exist
       backup.createBackupDir();

        //schedule backup
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        scheduler.scheduleAtFixedRate(() -> {
            try {
                backup.performBackup();
                backup.rotateBackups();
            } catch (Exception e) {
                System.err.println("Error: " +e.getMessage());
            }
            

            
        }, 0, 1, TimeUnit.MINUTES);

    }


}