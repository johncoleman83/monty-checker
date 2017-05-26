# <img src="https://www.holbertonschool.com/assets/holberton-logo-1cc451260ca3cd297def53f2250a9794810667c7ca7b5fa5879a569a457bf16f.png" alt="Holberton logo">  monty checker


## Synopsis

monty checker is an automated task checker for Holberton School's monty project.

## RTFM

**Please look into the code before you use it!**  We are using sudo, so be sure
you know what you are doing first! Don't trust; know the code!

## Configuration

To configure the checker with your monty project run the `init.bash` script.
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

David John Coleman II: lcsw@davidjohncoleman.com
