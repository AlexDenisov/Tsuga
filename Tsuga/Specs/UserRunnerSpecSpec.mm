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
    
});
