package OS;

import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {

        //detect os name
        String os = System.getProperty("os.name").toLowerCase();
        System.out.println("the os name is: " +os );


        //determine command to list the processes
        String listProcessesCommand;

        if (os.contains("win")){
            listProcessesCommand = "tasklist";
        } else if (os.contains("nix") || os.contains("nux") || os.contains("mac")) {
            listProcessesCommand = "ps -e";
            
        } else{
            throw  new UnsupportedOperationException("unsupported os: " +os);
        }

        //create a folder
        File file = new File("process_logs");

        if (!file.exists()){
            if (file.mkdir()){
                System.out.println("File created successfully " + file.getAbsolutePath());
            }  else {
                throw new IOException("Failed to create file");
            }
        }


        //list all processes
        ProcessBuilder pb = new ProcessBuilder();
        pb.command(listProcessesCommand.split(" "));
        pb.redirectErrorStream(true);// combine error and output streams

        Process process = pb.start();

        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

        //write process details
        File outputFile = new File(file, "running_processes.txt");
        try ( BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile))){
            String line;
            while ((line = reader.readLine()) !=null){
                writer.write(line);
                writer.newLine();
            }

        }

        System.out.println("processes logged to: " + outputFile.getAbsolutePath());

    }
}
