#include <stdio.h>

#define EXIT_SUCCESS 0x0
#define END '\n'


int main(){
    char name[0xF];                                   // .bss section 
    printf("What is your forename? %c", END); // eax, 0x4 register output operation
    scanf("%s", name);                        // eax, 0x3 register input operation
    printf("Your forename is: %s\n", name);
    return EXIT_SUCCESS;
}