#include <iostream>
#include "good_morning.hpp"

void good_morning() 
{
    std::cout << "\033[33mGood morning!\033[0m" << std::endl;
}