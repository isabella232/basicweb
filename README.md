# basicweb

## Description

**basicweb** is a very light web server written in [Go](https://golang.org/).  
Here are the specifications:

- no external dependencies
- just a little mode than 100 lines of code  ;-)
- very light cache management
- light [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) management
- light virtual host management
- TLS
- upload files with **POST** or **PUT** HTTP verb
- remove files with **DELETE** HTTP verb
- protect against modifications with basic authentication
- force status code responses
- light dynamic scripts managment
- easy configuration with command-line parameters
- simple echo server (send the request content into a JSON structure)

## How to get it

```bash
git clone https://github.com/cyd01/basicweb.git
```

## How to build it

Compilation example for `windows`, `linux` and `macos`.

```bash
BIN=basicweb
for OS in windows ; do
  for ARCH in 386 amd64 ; do
    echo "Building ${BIN}_${OS}_${ARCH}..."
    GOOS=$OS GOARCH=$ARCH go build -o ${BIN}_${OS}_${ARCH}.exe
  done
done
for OS in linux ; do
  for ARCH in 386 amd64 arm64 ; do
    echo "Building ${BIN}_${OS}_${ARCH}..."
    GOOS=$OS GOARCH=$ARCH go build -o ${BIN}_${OS}_${ARCH}
  done
done
for OS in darwin ; do
  for ARCH in 386 amd64 ; do
    echo "Building ${BIN}_${OS}_${ARCH}..."
    GOOS=$OS GOARCH=$ARCH go build -o ${BIN}_${OS}_${ARCH}
  done
done
```

## Usage

```bash
$ ./basicweb -h
Usage of ./basicweb:
  -cmd string
        external command (/path1/=cmd1,...)
  -dir string
        root directory (default ".")
  -echo
        start echo web server
  -headers string
        add specific headers (header1=value1[,...])
  -nocache
        force not to cache
  -pass string
        password for basic authentication (modification only)
  -port string
        port web server (default "80")
  -status int
        force return code
  -timeout int
        timeout for external command (default 30)
  -tls
        active ssl with key.pem and cert.pem files
  -user string
        username for basic authentication (modification only)
```

## Lightest start command

```bash
$ ./basicweb
2020/12/03 18:04:59 Starting web server with port 80 on directory . with status response 0
2020/12/03 18:05:12 GET /
```

## Docker image

```bash
$ docker run --rm -p 8080:80 basicweb
2020/12/05 13:51:32 Starting web server with port 80 on directory . with status response 0

```

## Dynamic scripts example

```bash
$ ./basicweb -cmd "/cmd/=/bin/bash -c cmd.sh"
```

## Start echo werver

```bash
$ ./basicweb -echo
```

## Start TLS mode

```bash
$ ./basicweb -tls
```

> Private key in PEM format must be provided in `key.pem` file, and Certificate in PEM format must be provided in `cert.pem` file
