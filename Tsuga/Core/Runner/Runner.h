//
//  Runner.h
//  Tsuga
//
//  Created by Alex Denisov on 21.05.13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import <objc/runtime.h>

#define ts_should subject() should
#define ts_should_not subject() should

#define CDR_EXT static int _tsuga = 

typedef void (^SpecBlock) ();

static id _subject;
static Class _specClass;

template <typename SpecClassType>
class Tsuga {
public:

    static int run(SpecBlock specBlock) {
        Class BaseClass = [CDRSpec class];
        Class UnitClass = [SpecClassType class];
        NSString *specClassName = [NSString stringWithFormat:@"%@Spec", NSStringFromClass(UnitClass)];
        Class SpecClass = objc_allocateClassPair(BaseClass, [specClassName UTF8String], 0);
        
        _specClass = UnitClass;
        
        IMP declareBehaviors = imp_implementationWithBlock(^{
            describe(specClassName, ^{
                specBlock();
            });
        });
        
        class_addMethod(SpecClass,
                        @selector(declareBehaviors),
                        declareBehaviors,
                        NULL);
        
        objc_registerClassPair(SpecClass);
        return 0;
    }
};

static id subject() {
    return _subject;
}

static void subject(id subject) {
    _subject = subject;
}

static void it(SpecBlock specBlock) {
    it(@"", specBlock);
}

static void ts_class(SpecBlock specBlock) {
    context(@"class", ^{
        
        beforeEach(^{
            subject(_specClass);
        });
        
        specBlock();
    });
}

static void ts_instance(SpecBlock specBlock) {
    context(@"instance", ^{
        
        beforeEach(^{
            subject([_specClass new]);
        });
        
        specBlock();
    });
}
