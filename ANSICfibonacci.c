#include<stdio.h>

int fibonacciRec(int n, int n2, int n1)
{
	if (n < 1)
	{
		return n1 + n2;
	}
	else
	{
		return fibonacciRec(n-1, n1+n2, n2);
	}
}

int fibonacci(int n)
{
	if (n == 0)
	{
		return 0;
	}
	else if (n == 1)
	{
		return 1;
	}
	else
	{
		return fibonacciRec(n-2,1,0); 
	}
}

int main(int argc, char const *argv[])
{
	int n;
	printf("ingrese n: ");
   	scanf("%d", &n);
   	n = fibonacci(n);
   	printf("%d\n", n);

	return 0;
}