package main

import (
	"fmt"
)

var VersionText string // from the build ldflag options
var Build string       // from the build ldflag options
var Commit string      // from the build ldflag options

// Version info
func Version() {
	fmt.Println("Version:", VersionText, "Build:", Build, "Commit:", Commit)
}
