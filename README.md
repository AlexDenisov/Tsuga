# Tsuga

[Tsuga](http://en.wikipedia.org/wiki/Tsuga) - set of [Cedar](https://github.com/pivotal/cedar) helpers.

## Features

### Spec definition

```cpp
CDR_EXT
Tsuga<Sample>::run(^{
    it(@"sample spec", ^{
        YES should_not be_truthy;
    });
});
```
### Matchers

#### RespondsTo

```cpp
subject should responds_to(@selector(hello));
subject should responds_to(@"hello");
```

#### ConformsTo

```cpp
subject should conforms_to(@protocol(Conformable));
subject should conforms_to(@"Conformable");
```
