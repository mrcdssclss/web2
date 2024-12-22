import com.google.gson.Gson;
import utils.ResultsBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/getAreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        sendArea(req, resp);
    }

    private void sendArea(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            Double x = (Double) req.getAttribute("x");
            Double y = (Double) req.getAttribute("y");
            Double r = (Double) req.getAttribute("r");
            long startTime = System.nanoTime();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            boolean a = true;

            if ((r >1 && r < 3) && (x <2 && x > -2) && (y > -5 && y < 3)  && (isInsidePath(x, y, r) || isInsidePolygon(x, y, r) || isInsideRectangle(x, y, r))) {
                a = false;
            }

            ResultsBean results = (ResultsBean) req.getSession().getAttribute("results");
            if (results == null){
                results = new ResultsBean();
                req.getSession().setAttribute("results", results);
            }

            ResultsBean.Result response = new ResultsBean.Result(x, y, r, a,System.nanoTime() - startTime, LocalDateTime.now().format(formatter));
            results.addResult(response);

            //todo нахуя??????
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(new Gson().toJson(response));
        } catch (Exception e){
          e.printStackTrace();
        }
    }

    private static boolean isInsidePolygon(double x, double y, double r) {
        return x <= r && y <= r && x >= 0 && y >= 0;
    }

    private static boolean isInsideRectangle(double x, double y, double r) {
        return y >= (0.5*x - r/2) && y <= 0 && x >= 0 && x <= r;
    }

    private static boolean isInsidePath(double x, double y, double r) {
        double radius = r / 2;
        return x <= 0 && y <= 0 && x >= (0 - radius) && y >= (0 - radius) && (Math.pow(x, 2) + Math.pow(y, 2)) <= Math.pow(radius, 2);
    }
}
