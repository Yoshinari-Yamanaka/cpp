#include <iostream>
#include "hello.hpp"

static const char *YELLOW = "\033[33m";
static const char *END = "\033[0m";

void hello() 
{
    std::cout << YELLOW << "Hello!" << END << std::endl;
}