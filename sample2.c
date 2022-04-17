void main()
{
    int n, a, b, tmp, i;

    scanf("%d", &n);

    if (n == 0)
    {
        printf("0");
    }
    else if (n == 1)
    {
        printf("1");
    }
    else if (n == 2)
    {
        printf("1");
    }
    else
    {
        i = 1;

        a = 0;

        b = 1;

        tmp = 0;

        do
        {
            tmp = a;

            a = b;

            b = tmp + a;

            i++;

            // printf("%d\n",b);
        } while (i < n);

        printf("%d", b);
    }

    return 0;
}
