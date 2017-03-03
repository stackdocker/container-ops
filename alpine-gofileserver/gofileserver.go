/*
  Inspird by golang code <https://github.com/golang/go/tree/master/src/net/http/example_test.go> func ExampleFileServer_stripPrefix()
*/
package main

import (
  "flag"
  "fmt"
  "log"
  "net/http"
  "os"
  "runtime"
)

var fileServer = struct {
  addr string
  dir string
}{}

func main() {
  flag.StringVar(&fileServer.addr, "addr", ":48080", "default listening 0.0.0.0:48080")
  flag.StringVar(&fileServer.dir, "dir", "", "default is working directory")
  flag.Parse()

  if len(os.Getenv("GOMAXPROCS")) == 0 {
    runtime.GOMAXPROCS(runtime.NumCPU())
  }

  if len(fileServer.dir) == 0 {
    var err error
    fileServer.dir, err = os.Getwd()
    if err != nil {
      fmt.Printf("Unexpected of get working directory error: %+v\n", err)
      os.Exit(1)
    }
  }

  http.Handle("/", http.StripPrefix("/", http.FileServer(http.Dir(fileServer.dir))))

  addr := ":48080"
  if len(fileServer.addr) != 0 {
    addr = fileServer.addr
  }

  fmt.Println("Listening at ", addr)
  log.Fatal(http.ListenAndServe(addr, nil))
}
