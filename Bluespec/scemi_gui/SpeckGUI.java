import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/* based on hard-coded n=24, m=4
   where n = 24 bits = 6 hex digits
         m = 4 words = 24 hex digits
   therefore key size=24 hex digits; iv size = 12 hex digits
*/

public class SpeckGUI{
    private final static String key_filename="key.txt", iv_filename="iv.txt", message_filename="in.txt";
    private final static int target_length_key=24, target_length_iv=12;
    private static JFrame window;
    private final static String window_title = "GUI for Speck";
    private final static int window_width=500, window_height=300;
    private static JPanel content_container;

    /* components for content container frame*/
    private static JPanel header_panel = new JPanel();
    private final static String header_title = "Welcome to Speck!";
    private static JPanel center_panel, key_iv_panel, iv_panel, message_panel;
    private static JTextArea key_input, iv_input, message_input;
    private static JButton submit_button;
    
    public static void main(String args[]){
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
        	
	key_input = new JTextArea(1, 22);
	iv_input = new JTextArea(1, 22);
	message_input = new JTextArea(12, 22);
	
	center_panel.add(new JLabel("Enter key (hex):", JLabel.RIGHT), getConstraints("key_text"));
	center_panel.add(new JScrollPane(key_input), getConstraints("key_input"));
	center_panel.add(new JLabel("Enter IV (hex):", JLabel.RIGHT), getConstraints("iv_text"));
	center_panel.add(new JScrollPane(iv_input), getConstraints("iv_input"));
	center_panel.add(new JLabel("Enter message (ASCII):", JLabel.RIGHT), getConstraints("message_text"));
	center_panel.add(new JScrollPane(message_input), getConstraints("message_input"));

	submit_button = new JButton("Submit");
	center_panel.add(submit_button, getConstraints("submit_button"));
	addButtonListener();
    }
    
    private static GridBagConstraints getConstraints(String which_element){
	/* defines placement for prompts, text boxes, and submit button */
	GridBagConstraints c = new GridBagConstraints();
	if (which_element == "key_text"){
	    c.gridx = 0;
	    c.gridy = 2;
	} else if (which_element == "key_input"){
	    c.gridx = 2;
	    c.gridy = 2;
	} else if (which_element == "iv_text"){
	    c.gridx = 0;
	    c.gridy = 4;
	} else if (which_element == "iv_input"){
	    c.gridx = 2;
	    c.gridy = 4;
	} else if (which_element == "message_text"){
	    c.gridx = 0;
	    c.gridy = 6;
	} else if (which_element == "message_input"){
	    c.gridx = 2;
	    c.gridy = 6;
	} else if (which_element == "submit_button"){
	    c.gridx = 1;
	    c.gridy = 16;
	}else {
	    System.err.println("Requesting constraints for unrecognized element!\n");
	    System.exit(-1);
	}
	return c;
    }

    private static void addButtonListener(){
	ButtonHandler submit_listener = new ButtonHandler();
	submit_button.addActionListener(submit_listener);
    }

    private static class ButtonHandler implements ActionListener{
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
}
 
