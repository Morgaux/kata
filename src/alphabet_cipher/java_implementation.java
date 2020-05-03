/**
 *
 * A Java alphabet_cipher implementation
 *
 */

import java.util.*;

class Kata {
    private static char[] alphabet = { // {{{
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    }; // }}}

    private static String encode(String key, String msg) { // {{{
        String out = "";
        int key_index;
        int msg_index;

        for (int i = 0; i < msg.length(); i++) {
            key_index = -1;
            msg_index = -1;

            for (int j = 0; j < alphabet.length; j++) {
                if (key.charAt(i % key.length()) == alphabet[j]) {
                    key_index = j;
                }

                if (msg.charAt(i) == alphabet[j]) {
                    msg_index = j;
                }

                if (key_index > -1 && msg_index > -1) {
                    break;
                }
            }

            out = out + alphabet[(key_index + msg_index) % alphabet.length];
        }

        return out;
    } // }}}

    private static String decode(String key, String msg) { // {{{
        String out = "";
        int key_index = -1;
        int msg_index = -1;

        for (int i = 0; i < msg.length(); i++) {
            for (int j = 0; j < alphabet.length; j++) {
                if (key.charAt(i % key.length()) == alphabet[j]) {
                    key_index = j;
                }
            }

            for (int j = 0; j < alphabet.length; j++) {
                if (msg.charAt(i) == alphabet[(j + key_index) % alphabet.length]) {
                    msg_index = j;
                }
            }

            out = out + alphabet[msg_index % alphabet.length];
        }

        return out;
    } // }}}

    private static String decipher(String plain, String cipher) { // {{{
        return "";
    } // }}}

    public static void main(String[] argv) { // {{{
        Scanner in     = new Scanner(System.in);
        String  line   = "";
        String  key    = "";
        String  msg    = "";
        String  plain  = "";
        String  cipher = "";

        while (in.hasNext()) {
            line = in.nextLine();
            String[] arguments = line.split("\\s+");

            for (String argument : arguments) {
                if (argument.startsWith("key=")) {
                    key = argument.substring(4);
                } else if (argument.startsWith("message=")) {
                    msg = argument.substring(8);
                } else if (argument.startsWith("plaintext")) {
                    plain = argument.substring(11);
                } else if (argument.startsWith("ciphertext")) {
                    cipher = argument.substring(10);
                }
            }

            if (line.startsWith("encode")) {
                line = encode(key, msg);
            } else if (line.startsWith("decode")) {
                line = decode(key, msg);
            } else if (line.startsWith("decipher")) {
                line = decipher(plain, cipher);
            }

            System.out.println(line);
        }
    } // }}}
}

