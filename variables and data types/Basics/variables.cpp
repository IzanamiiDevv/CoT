#include <iostream>
#include <string>

int main() {
    std::string name; //               *: Declare a string variable.
    name = "User Name"; //             *: Initialize a variable.

    std::cout << name << std::endl; // *: Print out the value of the variable.

    /**
     * !: Note: Each primative value is stored in Stack Memorry.
     *  *: Lexical Scoping
     */
    {
        int x = 10;
    } // *: x variable will free to memorry in this line.

    //std::cout << x << std::endl;  // *: Throws and Error due to x variable lifetime.
    



    return 0; //                       *: Returns 0 for sucessfull execution
}