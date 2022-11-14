TARGET := "build/ebnf-visualizer.exe"

build:
    csc /t:winexe /out:{{ TARGET }} src/*

run: build
    mono {{ TARGET }}
    