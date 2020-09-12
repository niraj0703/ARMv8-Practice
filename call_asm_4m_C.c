#include<stdio.h>
#include<string.h>
#define SUCCESS 0
#define FAIL !(SUCCESS)

extern int addnumbers(int, int);
extern int mulnumbers(int, int);
extern int subnumbers(int, int);
extern int count(int, int, int);
extern int mymemncpy(char * , char * , int);
int main(void)
{
	int x = 0;
	x = addnumbers(0x7EEEBBBB, 0x2222);
	printf("addition of 100 and 11: %X %d\n",x, x);
	x = subnumbers(11, 100);
	printf("subtration of 100 from 11: %d\n",x);
	x = mulnumbers(100, 11);
	printf("multiplication of 100 and 11: %d\n",x);
	x = count(1, 60, 1);
	printf("count from 1 to 60 with increament of 1: %d\n",x);
	char src[16] = "ABCDEFGHABFGRHJ", dst[16];
	//memset(src, 'A', 15);
	memset(dst, 'C', 15);
	src[15] = '\0';
	dst[15] = '\0';
	printf(" Source data is : %s\n", src);
	printf(" Destination data is: %s\n", dst);
	x = mymemncpy(src, dst, 15);
	printf(" Source data is : %s \n", src);
	printf(" Destination data is: %s len: %d\n", dst, x);
	return SUCCESS;
}
