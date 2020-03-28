/**
 * FizzBuzz a la Java
 */

class Kata {
    public static void main(String[] argv) {
        for (int i = 1; i <= 100; i++) {
            switch (i % 15) {
                case 0:
                    System.out.println("FizzBuzz");
                    break;

                case 3:
                case 6:
                case 9:
                case 12:
                    System.out.println("Fizz");
                    break;

                case 5:
                case 10:
                    System.out.println("Buzz");
                    break;

                case 1:
                case 2:
                case 4:
                case 7:
                case 8:
                case 11:
                case 13:
                case 14:
                default:
                    System.out.println(i);
                    break;
            }
        }
    }
}

