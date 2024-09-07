#include <stdio.h>
#include <stdlib.h>

unsigned long seed_c = 0;
unsigned long seed_a = 0;
unsigned long initial_seed = 0x5AA5FF00;

extern unsigned long PseudoRanFunA(unsigned long* seed, unsigned long* initial_seed);
extern unsigned long PseudoRanFunC(unsigned long* seed);

int main()
{

    printf("Pseudo Random Function in C:\n");
    for(int i = 0; i < 20; i++){
        printf("%2d. %lu\n", i + 1, PseudoRanFunC(&seed_c));
    }

    printf("\nPseudo Random Function in Assembly:\n");
    for(int i = 0; i < 20; i++){
        printf("%2d. %lu\n", i + 1, PseudoRanFunA(&seed_a, &initial_seed));
    }

    return 0;
}
