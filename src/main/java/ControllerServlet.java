import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/controllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handlerPostRequest(req, resp);
    }

    private void handlerPostRequest(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
            StringBuilder jsonText = new StringBuilder();
            String line;

            BufferedReader reader = req.getReader();
            while ((line = reader.readLine()) != null){
                jsonText.append(line);
            }

            JSONObject json = new JSONObject(jsonText.toString());

            Double x = json.getDouble("x");
            Double y = json.getDouble("y");
            Double r = json.getDouble("r");
            long startTime = System.nanoTime();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            req.setAttribute("x", x);
            req.setAttribute("y", y);
            req.setAttribute("r", r);
            req.setAttribute("executionTime", System.nanoTime()-startTime);
            req.setAttribute("time", LocalDateTime.now().format(formatter));
            req.getRequestDispatcher("getAreaCheckServlet").forward(req, resp);
    }

}
