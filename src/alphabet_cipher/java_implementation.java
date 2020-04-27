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

        while (in.hasNext()) {
            line = in.nextLine();
            line.split("/\\s+/");
            System.out.println(line);
        }
    } // }}}
}

