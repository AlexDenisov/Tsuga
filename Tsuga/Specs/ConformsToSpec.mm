#import "Tsuga.h"

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
    
    context(@"helpers", ^{
        
        context(@"class", ^{
            subject([User class]);
           
            it(@"protocol", ^{
                subject() should conforms_to(@protocol(Conformable));
            });
            
            it(@"name", ^{
                subject() should conforms_to(@"Conformable");
            });
            
        });
        
        context(@"instance", ^{
            subject([User new]);
            
            it(@"protocol", ^{
                subject() should conforms_to(@protocol(Conformable));
            });
            
            it(@"name", ^{
                subject() should conforms_to(@"Conformable");
            });
        });
        
    });
    
    context(@"shorthands", ^{
        
        context(@"class", ^{
            subject([User class]);
           
            conforms(^{
                to(@protocol(Conformable));
            });
            
        });
        
        context(@"instance", ^{
            subject([User new]);
            
            conforms(^{
                to(@protocol(Conformable));
            });

        });
        
    });
    
});

SPEC_END
