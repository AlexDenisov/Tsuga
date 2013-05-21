//
//  Runner.h
//  Tsuga
//
//  Created by Alex Denisov on 21.05.13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import <objc/runtime.h>

#define CDR_EXT static int _tsuga = 

typedef void (^SpecBlock) ();
static id _subject;

template <typename SpecClassType>
class Tsuga {
public:

    static int run(SpecBlock specBlock) {
        Class BaseClass = [CDRSpec class];
        Class UnitClass = [SpecClassType class];
        NSString *specClassName = [NSString stringWithFormat:@"%@Spec", NSStringFromClass(UnitClass)];
        Class SpecClass = objc_allocateClassPair(BaseClass, [specClassName UTF8String], 0);
        
        IMP declareBehaviors = imp_implementationWithBlock(^{
            specBlock();
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
