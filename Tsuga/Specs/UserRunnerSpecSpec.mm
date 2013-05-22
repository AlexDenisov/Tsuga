#import "Tsuga.h"

#import "User.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

CDR_EXT
Tsuga<User>::run(^{
    describe(@"t_should", ^{
        
        beforeEach(^{
            subject([User new]);
        });
        
        it(^{
            ts_should responds_to(@selector(hello));
        });
        
    });
    
    ts_class(^{
        
        it(^{
            ts_should equal([User class]);
        });
        
    });
    
    ts_instance(^{
        
        it(^{
            ts_should be_instance_of([User class]);
        });
        
    });
    
});
