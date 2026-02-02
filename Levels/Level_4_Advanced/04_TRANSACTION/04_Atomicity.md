- Atomicity --> the "All or Nothing"

1. What is Atomicity?
    - The Golden Rule of Atomicity: 
        - Either EVERYTHING inside the transaction happens, 
        - or NOTHING happens at all. There is no "middle ground."

2. The "Bank Transfer" Story (The Best Way to Understand)
    - Imagine you want to send $100 
    - to your friend. 
    - This requires two separate actions in the database:
        1. Subtract $100 from your account.
        2. Add $100 to your friend's account.
    - ❌ Without Atomicity (The Disaster)
        1. The database subtracts $100 from you.
        2. CRASH! The power goes out or the server restarts before step 2 happens.
        3. Result: 
            - Your $100 is gone forever, 
            - and your friend never got it. 
            - The money vanished into thin air.
    - ✅ With Atomicity (The Solution)
        1. You wrap both steps in START TRANSACTION.
        2. The database subtracts $100 from you.
        3. The server crashes.
        4. Result: 
            - Because the transaction never reached COMMIT, 
            - the database automatically rolls back. 
            - Your $100 is returned to your account. 
            - It's like the mistake never happened.
