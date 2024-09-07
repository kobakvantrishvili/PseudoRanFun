unsigned long PseudoRanFunC(unsigned long* seed){
    unsigned long initial_seed = 0x5AA5FF00;
    unsigned long LFSR;
    unsigned long bit;
    if(*seed == 0)
        LFSR = initial_seed;
    else
        LFSR = *seed;

    bit = ((LFSR >> 0) ^ (LFSR >> 2) ^ (LFSR >> 6) ^ (LFSR >> 7)) & 0x01;
    LFSR = (bit << 31) | (LFSR >> 1);
    *seed = LFSR;

    return LFSR;
}

