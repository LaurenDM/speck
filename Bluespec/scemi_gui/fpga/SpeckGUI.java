import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.BufferedReader;
import java.lang.StringBuilder;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class SpeckGUI{
    private static String default_key="020100 0a0908 121110 1a1918", default_iv="735e10 b6445d";
    private static String key_filename, iv_filename, message_filename, out_filename;
    private final static int target_length_key=27, target_length_iv=13; // lengths based on hex characters
    private static JFrame window;
    private final static String window_title = "GUI for Speck";
    private final static int window_width=1250, window_height=500;
    private static JPanel content_container;

    /* components for content container frame*/
    private static JPanel header_panel = new JPanel();
    private final static String header_title = "Welcome to Speck!";
    private static JPanel center_panel, key_iv_panel, iv_panel, message_panel;
    private static JTextArea key_input, iv_input, message_input, result_output;
    private static JPanel button_panel;
    private static JButton submit_button, exit_button;

    public static void main(String args[]){
	/* populate filenames; rather do this in SpeckGUI but this is simpler for now */
	key_filename=args[0];
	iv_filename=args[1];
	message_filename=args[2];
  out_filename=args[3];

	/* make sure GUI stays responsive and avoids queue by overriding Java Runnable queue */
	java.awt.EventQueue.invokeLater(new Runnable() {
		public void run() {
		    new SpeckGUI();
		}
	    });
    }

    public SpeckGUI(){
	createWindow();
	createContentContainer();

	window.setContentPane(content_container);

	content_container.add(header_panel.add(new JLabel(header_title, JLabel.CENTER)), BorderLayout.NORTH);

	createComponents();
	content_container.add(center_panel, BorderLayout.CENTER);
    }

    private static void createWindow(){
	window = new JFrame();
	window.setTitle(window_title);
	window.setSize(window_width, window_height);
	window.setDefaultLookAndFeelDecorated(true);
	window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	window.setVisible(true);
    }

    private static void createContentContainer(){
	content_container = new JPanel();
	content_container.setLayout(new BorderLayout());
	content_container.setVisible(true);
    }

    private static void createComponents(){
	center_panel = new JPanel();
	center_panel.setLayout(new GridBagLayout());

	key_input = new JTextArea(default_key, 1, 30);
	iv_input = new JTextArea(default_iv, 1, 30);
	message_input = new JTextArea(readFromFile(message_filename), 20,30);
  result_output = new JTextArea(readFromFile(out_filename),20,30);

	center_panel.add(new JLabel("  Enter key:  ", JLabel.RIGHT), getConstraints("key_text"));
	center_panel.add(new JScrollPane(key_input), getConstraints("key_input"));
	center_panel.add(new JLabel("   Enter IV:  ", JLabel.RIGHT), getConstraints("iv_text"));
	center_panel.add(new JScrollPane(iv_input), getConstraints("iv_input"));
	center_panel.add(new JLabel("Enter message:", JLabel.RIGHT), getConstraints("message_text"));
	center_panel.add(new JScrollPane(message_input), getConstraints("message_input"));
  center_panel.add(new JLabel("    Result:   ", JLabel.RIGHT), getConstraints("result_text"));
  center_panel.add(new JScrollPane(result_output), getConstraints("result_output"));

	/* add buttons to boxlayout (to get them side by side), which then gets added to center_panel */
	button_panel = new JPanel();
	//button_panel.setLayout(new BoxLayout(button_panel, BoxLayout.X_AXIS));

	submit_button = new JButton("Encrypt/Decrypt");
	addSubmitButtonListener();
	button_panel.add(submit_button);

	exit_button = new JButton("Exit");
	addExitButtonListener();
	button_panel.add(exit_button);

	center_panel.add(button_panel, getConstraints("button_panel"));
    }

    private static GridBagConstraints getConstraints(String which_element){
	/* defines placement for prompts, text boxes, and submit button */
	GridBagConstraints c = new GridBagConstraints();
	if (which_element == "key_text"){
	    c.gridx = 0;
	    c.gridy = 2;
	} else if (which_element == "key_input"){
	    c.gridx = 1;
	    c.gridy = 2;
      c.gridwidth = 2; // 2 columns wide
	} else if (which_element == "iv_text"){
	    c.gridx = 3;
	    c.gridy = 2;
	} else if (which_element == "iv_input"){
	    c.gridx = 4;
	    c.gridy = 2;
      c.gridwidth = 2; // 2 columns wide
	} else if (which_element == "message_text"){
	    c.gridx = 0;
	    c.gridy = 4;
      c.gridheight = 10; // 10 rows high
	} else if (which_element == "message_input"){
	    c.gridx = 1;
	    c.gridy = 4;
      c.gridwidth = 2; // 2 columns wide
      c.gridheight = 10; // 10 rows high
	}else if (which_element == "result_text"){
      c.gridx = 3;
      c.gridy = 4;
      c.gridheight = 10; // 10 rows high
  } else if (which_element == "result_output"){
      c.gridx = 4;
      c.gridy = 4;
      c.gridwidth = 2; // 2 columns wide
      c.gridheight = 10; // 10 rows high
	} else if (which_element == "button_panel"){
	    c.gridx = 3;
	    c.gridy = 14;
      c.gridwidth = 2; // 2 columns wide
  } else {
	    System.err.println("Requesting constraints for unrecognized element!\n");
	    System.exit(-1);
	}
	return c;
    }

    private static void addSubmitButtonListener(){
	SubmitButtonHandler listener = new SubmitButtonHandler();
	submit_button.addActionListener(listener);
    }

    private static void addExitButtonListener(){
	ExitButtonHandler listener = new ExitButtonHandler();
	exit_button.addActionListener(listener);
    }

    private static class SubmitButtonHandler implements ActionListener{
	/* http://math.hws.edu/javanotes/c6/s1.html */
	public void actionPerformed(ActionEvent e) {
	    String key = key_input.getText();
	    String iv = iv_input.getText();
	    String message = message_input.getText();

	    if (checkContents(key, iv, message)){
		/* if inputs are correct, write to file for testbench */
		writeToFile(key, key_filename);
		writeToFile(iv, iv_filename);
		writeToFile(message, message_filename);
		window.dispose();
	    }
	}
    }

    private static class ExitButtonHandler implements ActionListener{
	public void actionPerformed(ActionEvent e) {
	    // TODO: add prompt window (e.g. "Are you sure you wish to exit Speck?")
	    System.err.println("Exiting..");
	    System.exit(-1);
	}
    }


    private static Boolean checkContents(String key, String iv, String message){
	// TODO: eventually make error messages window alerts
	if (key.length() != target_length_key || iv.length() != target_length_iv){
	    System.err.println("Either key or IV is incorrect size.\n");
	    return false;
	} else if (message.isEmpty()){
	    System.err.println("Message is empty! Nothing to encrypt/decrypt.\n");
	    return false;
	} else {
	    return true;
	}
    }

    private static void writeToFile(String contents, String filename){
    	// reference: http://www.mkyong.com/java/how-to-write-to-file-in-java-bufferedwriter-example/
    	try {
    	    // if file doesnt exists, then create it
    	    File file_out = new File(filename);
    	    if (!file_out.exists()) {
    		      file_out.createNewFile();
    	    }

	    // write contents to file
    	    FileWriter fw = new FileWriter(file_out.getAbsoluteFile());
    	    BufferedWriter bw = new BufferedWriter(fw);
    	    bw.write(String.format("%s\n", contents));
    	    bw.close();
    	} catch (IOException e){
    	    System.err.println("IO Exception!");
	    System.exit(-1);
    	}
    }

    private static String readFromFile(String filename){
      //reference: http://stackoverflow.com/questions/4716503/reading-a-plain-text-file-in-java
      String everything = " ";
      try{
        File file_in = new File(filename);
        if(!file_in.exists()) {
          return " ";
        }

        FileReader fr = new FileReader(file_in.getAbsoluteFile());
        BufferedReader br = new BufferedReader(fr);
        StringBuilder sb = new StringBuilder();
        String line = br.readLine();

        while (line != null) {
          sb.append(line);
          sb.append(System.getProperty("line.separator"));
          line = br.readLine();
        }
        everything = sb.toString();
      } catch (IOException e){
          System.err.println("IO Exception!");
          System.exit(-1);
      }
      return everything;
    }
}
