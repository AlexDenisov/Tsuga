#import "Tsuga.h"

#import "User.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

CDR_EXT
Tsuga<User>::run(^{
    it(@"fu", ^{
        YES should be_truthy;
    });
});
