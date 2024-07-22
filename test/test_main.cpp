#include <gtest/gtest.h>
#include "class_a.h"
#include "mock_class_a.h"

TEST(ClassATest, Add) {
    MockClassA mock;
    EXPECT_CALL(mock, my_add(2, 3)).WillOnce(testing::Return(5));
    int result = mock.my_add(2, 3);
    EXPECT_EQ(result, 5);
}


