package PostgresqlBackup;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class PSQLBackup {

    public final String backupDir = "postgresql_backup";
    public final String dbName = "online_exam";
    public final String username = "postgres";
    public final String password = "Atariz@664";
    public final int maxBackup = 10;

     public   void createBackupDir(){
        File dir = new File(backupDir);
        if (!dir.exists()){
            dir.mkdir();
        }
    }

    public void  performBackup ()throws  Exception{

         //generate timestamp for backup file
         String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
         String backupFile = backupDir + "/backup_" + timeStamp + ".sql";

         //build pg_dump command
        //ProcessBuilder pb = new ProcessBuilder("pg_dump -h localhost -p 5432 -U " + username + " -F p -f " + backupFile + dbName);

        ProcessBuilder pb = new ProcessBuilder();
         pb.command("pg_dump",
                "-h", "localhost",
                "-p", "5432",
                "-U", username,
                //"-w",
                "-F", "p",
                "-f", backupFile,
                dbName);

        //set pgPassword
        Map<String, String> env = pb.environment();
        env.put("PGPASSWORD", password);

        //execute backup process

        Process process = pb.start();

        try {
            int exitCode = process.waitFor();
            if (exitCode ==0){
                System.out.println("Backup created successfully: " + backupFile);
            } else {
                System.out.println("backup failed with exit code " + exitCode);
            }

        } catch (Exception e) {
            System.out.println("error message " + e.getMessage());
        }

    }

    public void rotateBackups() throws Exception{
        Path backupPath = Paths.get(backupDir);

        //get all backup files
        List<Path> backupFiles = Files.list(backupPath)
                .filter(path -> path.toString().endsWith(".sql"))
                .sorted()
                .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);

        while (backupFiles.size()> maxBackup){
            Path oldestBackup = backupFiles.remove(0);
            Files.delete(oldestBackup);
            System.out.println("Deleted old backup " + oldestBackup);
        }
    }
}
