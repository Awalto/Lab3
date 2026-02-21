#include <stdio.h>
#include <string.h>

extern int hamming_distance(char *s1, char *s2, int len);

int main() {
    //Allocate buffers 
    char str1[256];
    char str2[256];

    printf("Enter first string: ");
    fgets(str1, 256, stdin);

    printf("Enter second string: ");
    fgets(str2, 256, stdin);

    int len1 = strlen(str1);
    int len2 = strlen(str2);

    // remove newline if present
    if(str1[len1-1] == '\n'){ 
        len1--;
    }
    if (str2[len2-1] == '\n'){ 
        len2--;
    }

    int min =0;
    if (len1 < len2){
        min = len1;
    }
    else{
        min = len2;
    }

    //Call the assembly function.
    //Pass pointers to both strings and the minimum length.
    int result = hamming_distance(str1, str2, min);

    printf("Hamming Distance: %d\n", result);

    return 0;
}