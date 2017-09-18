package main

import (
	"fmt"
	"os"
	"strings"

	"github.com/davidwalter0/go-cfg/flag"
)

var _unset = "set with -ldflags -X value"
var _versionFlag = flag.Bool("version", false, "print build and git commit as a version string")

// Version for this application
var Version = _unset // from the build ldflag options
// Build string for this application
var Build = _unset // from the build ldflag options
// Commit git hash for this application
var Commit = _unset // from the build ldflag options

// Version print and exit if flag given
func version() {
	array := strings.Split(os.Args[0], "/")
	me := array[len(array)-1]
	text := fmt.Sprintf("Cmd: %s version: %s build: %s commit: %s",
		me, Version, Build, Commit)
	if *_versionFlag {
		fmt.Fprintln(os.Stderr, text)
		os.Exit(0)
	}
}
