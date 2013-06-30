#import "Tsuga.h"

#import "User.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RespondsToSpec)

describe(@"RespondsTo", ^{
    
    context(@"class", ^{
        __block Class subject = Nil;
        
        beforeEach(^{
            subject = [User class];
        });
        
        it(@"selector", ^{
            subject should responds_to(@selector(newUser));
        });
        
        it(@"name", ^{
            subject should responds_to(@"newUser");
        });
        
    });
    
    context(@"instance", ^{
        __block User *subject = nil;
        
        beforeEach(^{
            subject = [User new];
        });
        
        it(@"selector", ^{
            subject should responds_to(@selector(hello));
        });
        
        it(@"name", ^{
            subject should responds_to(@"hello");
        });
        
    });
    
    context(@"helpers", ^{
        
        context(@"class", ^{
            subject([User class]);
            
            it(@"selector", ^{
                subject() should responds_to(@selector(hello));
            });
            
            it(@"name", ^{
                subject() should responds_to(@"hello");
            });
        });
        
        context(@"instance", ^{
            subject([User new]);
            
            it(@"selector", ^{
                subject() should responds_to(@selector(hello));
            });
            
            it(@"name", ^{
                subject() should responds_to(@"hello");
            });
        });
        
    });
    
    context(@"shorthahds", ^{
        
        context(@"class", ^{
            subject([User class]);
            
            responds(^{
                to(@selector(newUser));
            });
        });
        
        context(@"instance", ^{
            subject([User new]);
            
            responds(^{
                to(@selector(hello));
            });
        });
        
    });
    
});

SPEC_END
