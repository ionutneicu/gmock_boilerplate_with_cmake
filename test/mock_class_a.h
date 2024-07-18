#include <gmock/gmock.h>
#include "class_a.h"

class MockClassA : public ClassA {
public:
    MOCK_METHOD(int, add, (int a, int b), (override));
};
