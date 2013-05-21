#import "Runner.h"
#import "User.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

CDR_EXT
Tsuga<User>::run(^{
    it(@"fu", ^{
        YES should_not be_truthy;
    });
});
