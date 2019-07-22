%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int picture_download = 0;

char picture_url[100];

%}

%%
href\=\"\/th\?id\=[A-Za-z\.\_\-0-9]+\.jpg  {
                                               if (picture_download == 0)
                                               {
                                                   //printf(yytext);
                                                   //printf("\"\n");
                                                   strcpy(picture_url, yytext+6);
                                                   picture_download = 1;
                                               } 
                                           }
.                                          /* skip */
%%

int main(int argc, char ** argv)
{
    if (argc > 1)
    {
        if ( (yyin = fopen(argv[1], "r")) == 0 )
        {
             perror(argv[1]);
             exit(1);       
        }
    }

    memset(picture_url, '\0', 100);

    yylex();

    printf("https://cn.bing.com%s\n", picture_url);

    return 0;
}
