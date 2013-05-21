#import "TSConformsTo.h"

#import "User.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ConformsToSpec)

describe(@"ConformsTo", ^{

    context(@"class", ^{
        __block Class subject = Nil;
        
        beforeEach(^{
            subject = [User class];
        });
        
        it(@"protocol", ^{
            subject should conforms_to(@protocol(Conformable));
        });
        
        it(@"name", ^{
            subject should conforms_to(@"Conformable");
        });
    });
    
    context(@"instance", ^{
        __block User *subject = nil;
        
        beforeEach(^{
            subject = [User new];
        });
        
        it(@"protocol", ^{
            subject should conforms_to(@protocol(Conformable));
        });
        
        it(@"name", ^{
            subject should conforms_to(@"Conformable");
        });
    });
    
});

SPEC_END
