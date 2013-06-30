## [Tsuga](http://en.wikipedia.org/wiki/Tsuga) - set of [Cedar](https://github.com/pivotal/cedar) helpers

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
  ts_should responds_to(@selector(hello)); // subject() should responds_to(@selector(hello))
});
```

#### Context helpers

```cpp
ts_class(^{
        
    it(@"", ^{
        ts_should equal([User class]);
    });
    
});

ts_instance(^{
    
    it(@"", ^{
        ts_should be_instance_of([User class]);
    });
    
});
```

Expands to:

```cpp

context(@"class", ^{
    beforeEach(^{
        subject([SomeClass class]);
    });

    it(@"", ^{
        ts_should equal([User class]);
    });

});

context(@"instance", ^{
    beforeEach(^{
        subject([SomeClass new]);
    });

    it(@"", ^{
        ts_should be_instance_of([User class]);
    });

});
```

#### RespondsTo

```cpp
subject should responds_to(@selector(hello));
subject should responds_to(@"hello");
```

##### Shorthand

```cpp
responds(^{
    to(@selector(fuu));
    to(@selector(bar:));
    to(@selector(bu:zz:));
});
```

#### ConformsTo

```cpp
subject should conforms_to(@protocol(Conformable));
subject should conforms_to(@"Conformable");
```

##### Shorthand

```cpp
conforms(^{
    to(@protocol(UITableViewDelegate));
    to(@protocol(PrintableObject));
});
```

