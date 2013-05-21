#import "TSRespondsTo.h"

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
    
});

SPEC_END