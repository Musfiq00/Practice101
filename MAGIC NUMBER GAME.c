/*MAGIC NUMBER GAME */
#include<stdio.h>
int main(void)
{
    int magic, gess, i;
    printf("****MAGIC NUMBER GAME****\n");
    magic=93;
    gess=0;
    for(i=0;i<10 && gess!=magic;i++)
    {
        printf("Enter Your Guessing number:");
        scanf("%d",&gess);

        if(magic==gess)
            {
              printf("Right\n");
              printf("%d is the magic number.\n",magic);
            }
        else
            {
                printf("...SORRY, you are wrong...\n");
        if(gess>magic)
            printf("Your guess is too high\n");
        else printf("Your guess is too low\n");
            }
    }
return 0;
}
