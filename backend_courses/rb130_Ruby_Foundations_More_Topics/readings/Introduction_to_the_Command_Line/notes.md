# The Environment

## Environment Variables

When setting environment variables, there are no spaces around the assignment operator `=`. 

When accessing an environment variable, a dollar sign `$` must be prefixed to the variable name.

There are 2 ways to set environmental values.

### Set on its own line

```{.numberLines}
% SOMETHING="some value"
% echo $SOMETHING
some value
```

> The variable is available throughout the session.

### Set it before a command on the same line

```{.numberLines}
% SOMETHING="some value" env
...
...(environmental values are listed)
...
SOMETHING=some value
% echo $SOMETHING

%
```

> The variable is erased after the execution of the command.

```{.numberLines}
% SOMETHING="some value" echo $SOMETHING

%
```

> Variables are evaluated before they are set, so it's hard to access them on the same line.

### PS1

The PS1 is the primary prompt string (**prompt string one**) . It controls the appearance of the command line prompt.

PS1 can be changed for the current session on the command line by changing the PS1 variable.

```{.numberLines}
% PS1="(test prompt)> "
(test prompt)> echo "Hello world."
Hello world.
(test prompt)>
```

PS1 can also be changed by updating the `.zshrc` file for a more permanent change.

**zsh Escape Sequences**

| Escape Sequence (zsh) | Meaning |
|-|-|
| `%%` | A literal % character. |
| `%)` | A literal ) character. |
| `%n` | Current username. |
| `%m` | Hostname (short form, up to the first .). |
| `%M` | Full hostname. |
| `%d` | Current working directory (full path). |
| `%~` | Current working directory (with ~ for home). |
| `%c` | Current working directory (basename only). |
| `%C` | Current working directory (basename only, like %c). |
| `%#` | Prompt symbol (# for root, % for regular users). |
| `%?` | Exit status of the last command. |
| `%D` | Current date in YY-MM-DD format. |
| `%W` | Current date in MM/DD/YY format. |
| `%w` | Current date in Day DD format (e.g., Mon 30). |
| `%*` | Current time in HH:MM:SS format. |
| `%T` | Current time in HH:MM format (12-hour clock). |
| `%t` | Current time in HH:MM format (12-hour clock with AM/PM). |
| `%D{format}` | Current date and time formatted using strftime (e.g.,  |%D{%Y-%m-%d %H:%M}).
| `%l` | Current tty (terminal name). |
| `%y` | Current tty (short form). |
| `%j` | Number of jobs (background processes). |
| `%L` | Current shell depth (number of nested shells). |
| `%N` | Name of the current script or shell function. |
| `%i` | Line number in the script or shell function. |
| `%I` | Line number in the script or shell function (padded). |
| `%_` | Current parser state (e.g., command, argument, etc.). |
| `%S` | Start standout mode (inverse colors). |
| `%s` | End standout mode. |
| `%U` | Start underline mode. |
| `%u` | End underline mode. |
| `%B` | Start bold mode. |
| `%b` | End bold mode. |
| `%F{color}` | Start using a specific text color (e.g., %F{red}). |
| `%f` | Reset to default text color. |
| `%K{color}` | Start using a specific background color (e.g., %K{blue}). |
| `%k` | Reset to default background color. |
| `%{...%}` | Enclose non-printable characters (e.g., colors). |
| `%(x.true.false)` | Conditional formatting based on the value of x. |

**Ansi Color Codes**

| Name | Color Effect |
|-|-|
| `black` |	Black text |
| `red` |	Red text |
| `green` |	Green text |
| `yellow` |	Yellow text |
| `blue` |	Blue text |
| `magenta` |	Magenta text |
| `cyan` |	Cyan text |
| `white` |	White text |

## Using Environment Variables



### Parts of a command

Environment variables can used as **an argument** to a command.

```{.numberLines}
% MESSAGE="Hello, world."
% echo $MESSAGE
Hello, world.
%
```

Environment variables can also be used as **a command itself**.

```{.numberLines}
% MESSAGE="Hello, world."
% COMMAND="echo"
% $COMMAND $MESSAGE
Hello, world.
%
```

### Interpolated into strings

```{.numberLines}
% MAIN="The message is, "
% MESSAGE="Hello world"
% OUTPUT="$MAIN $MESSAGE"
% echo $OUTPUT
The message is Hello world
%
```

### Behind the scenes

You can reassign the value of variables often used by other commands. like `PWD` or `HOME`. 

## $PATH and Executibles
