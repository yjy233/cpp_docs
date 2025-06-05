#include <gtest/gtest.h>

int Add(int a, int b) {
    return a + b;
}

TEST(AddTest, AddPositiveNumbers) {
    EXPECT_EQ(Add(2, 3), 5);
}

