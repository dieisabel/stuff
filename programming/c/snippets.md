# Snippets for C language

Here are a plenty of snippets for C language that I use but almost always forget. But bear in mind that certain snippets
may work or not depending on the implementation and environment.

## Bitwise operations

Enable certain `bit` in a `number`:

```c
#define ENABLE(number, bit) (number |= (1 << bit))
```

Disable certain `bit` in a `number`:

```c
#define DISABLE(number, bit) (number &= ~(1 << bit))
```

Check if a certain `bit` in a `number` is set or not:

```c
if (number & (1 << bit))
    // Bit is set
else
    // Bit is not set
```

## Endianess

Check if system is using little-endian or big-endian order:

```c
int number = 1;
if (*(char*)&number == 1)
    // Little endian
else
    // Big endian
```
