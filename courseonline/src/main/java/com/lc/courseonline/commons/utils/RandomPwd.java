package com.lc.courseonline.commons.utils;

import java.util.concurrent.ThreadLocalRandom;

public class RandomPwd {

    public static String create(int length) {
        char[] sources = new char[]{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
                'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
                'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6',
                '7', '8', '9'};
        char[] sources2 = new char[]{'0', '1', '2', '3', '4', '5', '6','7', '8', '9'};
        int length2 = sources2.length;
        ThreadLocalRandom random = ThreadLocalRandom.current();
        StringBuilder sb = new StringBuilder();
        for (int j = 0; j < length; j++) {
            sb.append(sources2[random.nextInt(length2)]);
        }
        return sb.toString();
    }
}
