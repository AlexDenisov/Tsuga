# Tsuga

[Tsuga](http://en.wikipedia.org/wiki/Tsuga) - set of [Cedar](https://github.com/pivotal/cedar) helpers.

## Features

### Matchers

#### RespondsTo

```
subject should responds_to(@selector(hello));
subject should responds_to(@"hello");

```

#### ConformsTo

```
subject should conforms_to(@protocol(Conformable));
subject should conforms_to(@"Conformable");
```
