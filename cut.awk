BEGIN {
    dont_print = 0;
    skip_line = 0;
}

match($0, /\/\/! version = ([0-9]+)/, xs) {
    skip_line = 1;

    if (xs[1] != version || dont_print > 0) {
        dont_print++;
    }
}

match($0, /\/\/! if ([0-9A-Za-z_]+)/, xs) {
    skip_line = 1;

    feature = SYMTAB[xs[1]];
    if (feature == 0 || dont_print > 0) {
        dont_print++;
    }
}

match($0, /\/\/! not ([0-9A-Za-z_]+)/, xs) {
    skip_line = 1;

    feature = SYMTAB[xs[1]];
    if (feature == 1 || dont_print > 0) {
        dont_print++;
    }
}

/\/\/! else/ {
    skip_line = 1;

    if (dont_print == 0) {
        dont_print++;
    } else if (dont_print == 1) {
        dont_print--;
    }
}

/\/\/! end/ {
    skip_line = 1;
    if (dont_print > 0) {
        dont_print--;
    }
}

dont_print == 0 && !skip_line { print }
skip_line { skip_line = 0 }
