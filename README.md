## Tsuga

[Tsuga](http://en.wikipedia.org/wiki/Tsuga) - set of [Cedar](https://github.com/pivotal/cedar) helpers.

### Features

#### Spec definition

```cpp
CDR_EXT
Tsuga<Sample>::run(^{
    it(@"sample spec", ^{
        YES should_not be_truthy;
    });
});
```

#### Subject

```cpp
subject([User new]);
            
it(@"selector", ^{
    subject() should responds_to(@selector(hello));
});

it(@"name", ^{
    subject() should responds_to(@"hello");
});

```
#### 'should' shorthand

```cpp

beforeEach(^{
  subject([User new]);
});


it(@"smth", ^{
  ts_should responds_to(@selector(hello));
});
```

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
