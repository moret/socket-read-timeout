#include <stdio.h>
#include <sys/socket.h>
#include <netdb.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    char *host = "127.0.0.1";
    int port = 2000;
    int timeout = 2;

    int sockfd, n;

    char buffer[256];

    struct sockaddr_in serv_addr;
    struct hostent *server;
    struct timeval tv;

    tv.tv_sec = timeout;

    server = gethostbyname(host);
    bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
    serv_addr.sin_port = htons(port);
    serv_addr.sin_family = AF_INET;

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(struct timeval));
    setsockopt(sockfd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(struct timeval));
    connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr));

    n = read(sockfd, buffer, 255);

    if (n < 0) {
        perror("error reading from socket");
        return 1;
    }

    printf("%s\n", buffer);
    return 0;
}
