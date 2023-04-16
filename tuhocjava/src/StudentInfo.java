import java.util.Scanner;

public class StudentInfo {
    public static void main(String[] args) {
        String hovaten = "";
        float diemtb = 0;
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhap ho va ten: ");
        hovaten = scanner.nextLine();

        System.out.print("Nhap diem TB: ");
        diemtb = scanner.nextFloat();

        System.out.printf("%s %d diem", hovaten, diemtb);
    }
}
