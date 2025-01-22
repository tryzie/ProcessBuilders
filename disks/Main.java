package disks;

import java.io.*;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) {
        try {
            // Detect the operating system
            String os = System.getProperty("os.name").toLowerCase();
            System.out.println("Detected OS: " + os);

            //Determine the command to display disk information
            String diskInfoCommand;
            if (os.contains("win")) {
                diskInfoCommand = "wmic logicaldisk get size,freespace,caption";
            } else if (os.contains("nix") || os.contains("nux") || os.contains("mac")) {
                diskInfoCommand = "df -h";
            } else {
                throw new UnsupportedOperationException("Unsupported OS: " + os);
            }

            // Use ProcessBuilder to execute the command
            ProcessBuilder processBuilder = new ProcessBuilder(diskInfoCommand.split(" "));
            processBuilder.redirectErrorStream(true); // Combine error and output streams

            //Start the process
            Process process = processBuilder.start();

            // Read and display the command output
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                String line;
                System.out.println("Disk Information:");
                while ((line = reader.readLine()) != null) {
                    System.out.println(line);
                }
            }

            // Wait for the process to complete
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("Disk information displayed successfully.");
            } else {
                System.out.println("Failed to retrieve disk information. Exit code: " + exitCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
