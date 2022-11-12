FROM golang:1.19.1-alpine3.16
EXPOSE 8000
WORKDIR /app
ENV HOST=localhost PORT=5432
ENV USER=root PASSWORD=root DBNAME=root
COPY ./main main
CMD [ "./main" ]