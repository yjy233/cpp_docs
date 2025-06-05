#include <gtest/gtest.h>

int Add(int a, int b) {
    return a + b;
}

TEST(AddTest, AddPositiveNumbers) {
    EXPECT_EQ(Add(2, 3), 5);
}


TEST(AddTest, AddPositiveNumbersV2) {
    EXPECT_EQ(Add(6, 3), 9);
}

