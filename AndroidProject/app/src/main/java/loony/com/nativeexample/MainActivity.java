package loony.com.nativeexample;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Text;

import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.util.Arrays;

public class MainActivity extends AppCompatActivity {

    EditText loginField;
    EditText passwordField;

    TextView sign;

    Button getSign;

    static {
        System.loadLibrary("native-lib");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        loginField = (EditText) findViewById(R.id.loginField);
        passwordField = (EditText) findViewById(R.id.passwordField);

        sign = (TextView) findViewById(R.id.signText);

        getSign = (Button) findViewById(R.id.signButton);

        getSign.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                JSONObject curJson = new JSONObject();
                try {
                    curJson.put("login",loginField.getText());
                    curJson.put("password",passwordField.getText());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                System.out.println(curJson.toString());

                int[] timeValue = magic(curJson.toString());


                sign.setText(getHexString(timeValue));
                System.out.println(getHexString(timeValue));
            }
        });


    }

    private String getHexString(int[] array){
        String hex = "";
        String time;
        for(int i : array){
            time = Integer.toHexString(i);
            if (time.length()<2){
                time="0"+time;
            }
            hex+=time+" ";
        }
        return hex;
    }


    public native int[] magic(String test);
}
