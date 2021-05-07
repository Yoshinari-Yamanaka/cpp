#include <iostream>
#include "good_morning.hpp"

static const char *YELLOW = "\033[33m";
static const char *END = "\033[0m";

void good_morning() 
{
    std::cout << YELLOW << "Good morning!" << END << std::endl;
}