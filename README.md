# Noteesh

Tracking notes in your command line

## Installation

### Build from code source

**You should have the crystal compiler installed** check it out [here](https://crystal-lang.org/docs/installation/)

1. Clone this repo

```
$ git clone https://github.com/arandilopez/noteesh.git
```

2. Run make commands

```
$ sudo make
# then run
$ sudo make install
```

## Usage

- Check your notes

```
$ noteesh
```

- Add a new note

```
$ noteesh --add "Buy a coke"
```

- Mark a note as done

```
$ noteesh --done 1
```

- Clear your notes

```
$ noteesh --clear
```

## Development

Run the make command to compile as development

```
$ make compile
# then run the bin file
$ bin/noteesh
```

Run make test to run a build and specs

```
$ make test
```

## Contributing

1. Fork it ( https://github.com/arandilopez/noteesh/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [@arandilopez](https://github.com/arandilopez) Arandi Lopez - creator, maintainer
