int fact(int n)
{
	int i, fact = 1;

	if (n < 0) {
		return 0;
	}

	for (i = 1; i <= n; i++) {
		fact = fact * i;
	}

	return fact;
}
