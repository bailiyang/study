#include <iostream>
#include <map>
#include <vector>
#include <memory>
#include <algorithm>
#include <string>
#include <cstring>
#include <unordered_map>
#include "test.h"

const int Cls::Size;

int main(int argc, char *argv[])
{
    const std::string *st = new std::string("hello world"); 
    print(std::string("hello world"));
    print(st);
    print("123");
    print(Cls::Size);
}