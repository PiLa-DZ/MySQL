-- The (Window Functions) It's just a "Smart Column"
-- Why we call it a "Smart Column"
-- In your SQL files, you can use these "Smart Columns" to answer complex questions that a normal SELECT cannot:

-- 1. Ranking:             "In which position does this product sit compared to others?" (RANK)
-- 2. Difference/Lead/Lag: "How much more did we sell today compared to yesterday?" (LAG)
-- 3. Proportions:         "What percentage of the total department budget is this specific person's salary?" (SUM(...) OVER())
-- 4. Averages:            "How much does this person earn compared to the average of their department?" (AVG(...) OVER(PARTITION BY...))
