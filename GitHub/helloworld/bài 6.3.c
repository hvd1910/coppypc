#include <stdio.h>
main(void)
{
	printf(" The number 555.55 in various forms:\n");
	printf("In float form without modifiers :\n");
	printf("[%f]\n",555.55); 
	printf("In exponential form without any modifier: \n");
	printf("[%e]\n",555.55);
	printf("In float form with - modifier:\n");
	printf("[%-f]\n",555.55);
	printf("In float form with digit string 10.3 as modifier\n");
	printf("[%10.3f]\n",555.55);
	printf("In float form with -, 0");
	printf("and digit string 10.3 as modifiers: \n");
	printf("[%-010f]\n",555.55);
	printf("In exponential form with 0");
	printf("and digit string 10.3 as modifiers:\n");
	printf("[%010.3f]\n",555.55);
	printf("In exponential form with -, 0 ");
	printf("and digit string 10.3 as modifiers : \n");
	printf("[%-010.3e]\n\n",555.55);
	
	return 0;
}	
