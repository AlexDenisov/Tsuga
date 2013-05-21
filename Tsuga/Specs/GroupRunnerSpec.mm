#import "Runner.h"

#import "Group.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

CDR_EXT
Tsuga<Group>::run(^{
    it(@"fu", ^{
        YES should_not be_truthy;
    });
});
