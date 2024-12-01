### Part 1: **Sum of Differences Between Two Arrays**

1. **Input Processing:**
   - The program reads lines of input containing two integers separated by spaces.
   - It stores the first integer in the `left` array and the second in the `right` array.
   - The loop continues until an empty line is entered.

2. **Sorting the Arrays:**
   - Both `left` and `right` arrays are sorted in ascending order using `table.sort()`.

3. **Sum of Differences Calculation:**
   - The function `sum_differences()` computes the sum of the absolute differences between corresponding elements of the two sorted arrays.
   - The difference between each pair of elements (from `left` and `right`) is calculated using `math.abs(arr_right[i] - arr_left[i])` and added to `total_sum`.

4. **Printing the Result:**
   - The result of the sum of differences is printed using `print(result)`.

### Part 2: **Similarity Score Calculation**

1. **Similarity Score Function:**
   - The function `similarity_score(value, arr2)` calculates the score for a given `value` by counting how many times `value` appears in `arr2` (the `right` array).
   - The score is calculated as `value * count`, where `count` is the number of times `value` appears in `arr2`.

2. **Remove Duplicates Function:**
   - The function `remove_duplicates(arr)` removes duplicate values from the `left` array.
   - It uses a `seen` table to keep track of the values that have already been added to the `unique_arr`.

3. **Similarity Score Calculation:**
   - After removing duplicates from `left`, the program calculates the similarity score for each unique value in the `left` array using the `similarity_score()` function.
   - The scores are summed into `total_score`.

4. **Printing the Total Similarity Score:**
   - Finally, the total similarity score is printed using `print(total_score)`.

### Key Points:
- **Part 1:** Calculates the sum of absolute differences between corresponding elements in two arrays after sorting them.
- **Part 2:** Calculates a similarity score for each unique value in `left` by counting how many times it appears in `right`, and sums up these scores.
