/**
 *
 * A Java alphabet_cipher implementation
 *
 */

import java.util.*;

class Kata {
    private String[] alphabet = { // {{{
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
        "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
    }; // }}}

    private String encode(String key, String msg) { // {{{
        return "";
    } // }}}

    private String decode(String key, String msg) { // {{{
        return "";
    } // }}}

    private String decipher(String plain, String cipher) { // {{{
        return "";
    } // }}}

    public static void main(String[] argv) { // {{{
        Scanner in = new Scanner(System.in);
        String line;
        String key;
        String msg;
        String plain;
        String cipher;

        while (in.hasNext()) {
            line = in.nextLine();
            String[] arguments = line.split("/\\s+/");

            for (String argument : arguments) {
                if (argument.startsWith("key=")) {
                    key = argument.substring(4);
                } else if (argument.startsWith("message=")) {
                    msg = argument.substring(8);
                } else if (argument.startsWith("plaintext")) {
                    plain = argument.substring(9);
                } else if (argument.startsWith("ciphertext")) {
                    cipher = argument.substring(10);
                }
            }

            System.out.println(line);
        }
    } // }}}
}

