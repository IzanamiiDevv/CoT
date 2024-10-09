// !: variables.cpp
#include <iostream>
#include <string>

int main() {
    std::string name; //               *: Declare a string variable.
    name = "User Name"; //             *: Initialize a variable.

    std::cout << name << std::endl; // *: Prints out a value of the variable.

    // !: Note: Each primative type is stored in Stack Memorry.
    // *: Lexical Scoping.
    {
        int x = 10;
    } // *: x variable will free to memorry in this line due to stack behevior.

    //std::cout << x << std::endl;  // *: Throws and Error due to x variable lifetime.

    /**
     * *: Copying a value of inner variable to the num variable will saves the value for deleting
     * *: But the context of the value will be deleted.
     */
    int num;
    {
        int inner_num = 10; //         *: Delclares a inner variable that will be deleted on line: 27 
        num = inner_num; //            *: Initialize the num with the value of inner_num.
    } //                               *: variable: inner_num will be deleted in this line.

    

    std::cout << num << std::endl; //  *: Prints out the value from num that comes from inner_num.

    return 0; //                       *: Returns 0 for sucessfull execution
}