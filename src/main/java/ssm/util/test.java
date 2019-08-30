package ssm.util;

public class test {

    static int cnt = 6;
    static{
        cnt /=3;
        System.out.println("2.cnt ="+cnt);
    }
    static{
        cnt += 9;
        System.out.println("1.cnt ="+cnt);
    }
    public static void main(String[] args) {
        double a=10.33;

        System.out.println("3.cnt ="+cnt);
    }

}
