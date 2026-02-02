- Consistency --> 
    - the database’s way of saying: 
    - "I will never allow you to break my rules."

1. Consistency vs. Atomicity (The Difference)
    - People often confuse these two. Here is the best way to remember:
    1. Atomicity  : Focuses on the Process (Did all steps finish?).
    2. Consistency: Focuses on the Rules (Is the data legal?).

2. The Bank Example again: 
    - Imagine you have a rule (Constraint) 
    - that a balance cannot be less than $0.
    1. You have $50.
    2. You try to send $100 to a friend.
    3. Atomicity would allow this (it's a complete step).
    4. Consistency steps in and says: 
        - Wait! This transaction would result in -$50, 
        - which breaks my rule. 
        - I am canceling this entire transaction right now.
