# monty checker

<img src="https://github.com/johncoleman83/monty-checker/blob/master/Python1.jpg" alt="monty python" style="box-shadow: 0 0 10px 3px #707070;">


## Synopsis

monty checker is an automated task checker for Holberton School's monty project.
This checker simulates Holberton's checker in that it clones your repository
with the `init.bash` script, and then compiles your program with these -Warning
flags:

```
$ gcc -Wall -Werror -Wextra -pedantic *.c -o monty
```

## RTFM

**Please look into the code before you use it!**  be sure
you know what you are doing first! Don't trust; know the code!

## Configuration

* First clone this repo
```
git clone https://github.com/johncoleman83/monty-checker.git
```
* Then change directories to the monty-checker directory, where you cloned this checker
* To configure the checker with your monty project run the `init.bash` script.
  In the below example command GITHUB_USERNAME is the github username that is
  hosting the monty repository that you want to check

```
$ ./init.bash [GITHUB_USERNAME]
```

## Usage

* Run the `init.bash` script as shown in the configuration

* Start the checker!

```
$ ./check_monty.bash
```

## Expected Output & other Errors

Failed checks are output in RED, passed checks are output in GREEN.  ALL errors
written to stderr are output for all instances.

  - ![#f03c15](https://placehold.it/15/f03c15/000000?text=+) `[FAIL]`
  - ![#c5f015](https://placehold.it/15/c5f015/000000?text=+) `[PASS]`

* **NOTE:** your project will not run with the init script if it does not
  compile with the above -Warning flags.

## Contribute

If you would like to contribute to this project, please follow the process
outlined in the CONTRIBUTING.md file

## Authors

David John Coleman II, [davidjohncoleman.com](http://www.davidjohncoleman.com)

## License

MIT License