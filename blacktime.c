#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *ops = "push copy slidelabelcall jump jz   jn   pop  dup  swap add  "
                  "sub  mul  div  mod  storeload ret  exit ichr inum ochr onum ";
const char *trans[] = {"  ", " \t ", " \t\n", "\n  ", "\n \t", "\n \n", "\n\t ",
                       "\n\t\t", " \n\n", " \n ", " \n\t", "\t   ", "\t  \t",
                       "\t  \n", "\t \t ", "\t \t\t", "\t\t ", "\t\t\t", "\n\t\n",
                       "\n\n\n", "\t\n\t ", "\t\n\t\t", "\t\n  ", "\t\n \t"};

void encode(int num, char *buf)
{
    int i;
    memset(buf, 32, 32);
    for (i = 31; num; num >>= 1)
        buf[i--] = num & 1 ? 9 : 32;
}

int main(int argc, char *argv[])
{
    FILE *in;
    int op, arg, clab;
    char *found, token[8];
    char encoded[33] = {0};

    if (argc < 2)
        return fprintf(stderr, "Usage: %s FILE", *argv);

	in = fopen(argv[1], "r");

    while (fscanf(in, "%s", token) != EOF) {
        if (token[0] == ';') {
            while (fgetc(in) != '\n'); /* Advance past comment. */
            continue;
        }

        /* Convenience labels must be handled specially. */
        if ((clab = token[strlen(token) - 1] == ':'))
            fseek(in, -strlen(token), 1);

        if ((found = strstr(ops, token)) != NULL || clab) {
            op = clab ? 3 : (found - ops) / 5;
            printf("%s", trans[op]);

            if (op < 8) {
                if (!fscanf(in, "%i", &arg)) {
                    if (fscanf(in, "%s", token))
						arg = token[0];
                }

                putchar(arg < 0 ? 9 : 32);
                encode(abs(arg), encoded);
                found = strchr(encoded, 9);
                puts(found == NULL ? " " : found);
                if (clab) fseek(in, 1, 1);
            }
        }
    }

    fclose(in);
    return 0;
}
