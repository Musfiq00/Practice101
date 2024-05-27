package LoginPageD1;

import javafx.application.Application;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.control.Label;

import java.io.IOException;

public class HelloApplication extends Application {
    public static Stage stage;
    private static Scene scene;
    private static String fxmlFileName;

    @Override
    public void start(Stage stage) throws IOException {

        this.stage = stage;
        FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("login.fxml"));
        Parent root = fxmlLoader.load();
         scene = new Scene(root);

        // Automatically adjust scene size based on content
        stage.setTitle("Login Page");
        stage.setScene(scene);
        stage.sizeToScene(); // Automatically adjust scene size based on content
        stage.show();
    }


    public static void main(String[] args) {
        launch();
    }

    
public static void changeScene(String fxmlFileName) {

    try {
        FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource(fxmlFileName + ".fxml"));
        Parent root = fxmlLoader.load();
        scene.setRoot(root); // Set the root of the existing scene
        stage.sizeToScene(); // Automatically adjust scene size based on content

    } catch (IOException ex) {
        ex.printStackTrace();
    }
}

    @FXML
    public void changeToDashboardScene(){ HelloApplication.changeScene("login2"); }



}


