#include<stdio.h>

float inversoFibRec(int n, float n2, float n1, float phi)
{
	phi += ( 1 / (n1 + n2) );
	if (n < 1)
	{
		return phi;
	}
	else
	{
		return inversoFibRec(n-1, n1+n2, n2, phi);
	}
}

float inversoFib(int n)
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
		return inversoFibRec(n-2,1,0,1); 
	}
}

int main(int argc, char const *argv[])
{
	int n;
	printf("ingrese n: ");
   	scanf("%d", &n);
   	float phi = inversoFib(n);
   	printf("%f\n", phi);

	return 0;
}