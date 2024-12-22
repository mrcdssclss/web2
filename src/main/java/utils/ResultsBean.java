package utils;

import java.io.Serial;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ResultsBean implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    private final List<Result> results = new ArrayList<>();

    public ResultsBean() {
    }

    public void addResult(Result resultNew) {
        results.add(resultNew);
    }

    public List<Result> getResults() {
        return results;
    }

    public static class Result implements Serializable{
        @Serial
        private static final long serialVersionUID = 1L;
        public double x;
        public double y;
        public double r;
        public boolean answer;
        public String time;
        public long executionTime;

        public Result(double x, double y, double r, boolean answer, long executionTime, String time) {
            this.x = x;
            this.y = y;
            this.r = r;
            this.answer = answer;
            this.time = time;
            this.executionTime = executionTime;
        }

        public double getX() {
            return x;
        }

        public void setX(double x) {
            this.x = x;
        }

        public double getY() {
            return y;
        }

        public void setY(double y) {
            this.y = y;
        }

        public double getR() {
            return r;
        }

        public void setR(double r) {
            this.r = r;
        }

        public boolean isAnswer() {
            return answer;
        }

        public void setAnswer(boolean answer) {
            this.answer = answer;
        }

        public long getExecutionTime() {return executionTime;}
        public String getTime() {return time;}

        public void setTime(String time) {this.time = time;}

        public void setExecutionTime(long executionTime) {
            this.executionTime = executionTime;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof Result)) return false;
            Result result = (Result) o;
            return Double.compare(x, result.x) == 0 && Double.compare(y, result.y) == 0 && Double.compare(r, result.r) == 0 && answer == result.answer && executionTime == result.executionTime && Objects.equals(time, result.time);
        }

        @Override
        public int hashCode() {
            return Objects.hash(x, y, r, answer, time, executionTime);
        }

        @Override
        public String toString() {
            return "Result{" +
                    "x=" + x +
                    ", y=" + y +
                    ", r=" + r +
                    ", answer=" + answer +
                    ", time='" + time + '\'' +
                    ", executionTime=" + executionTime +
                    '}';
        }
    }
}
