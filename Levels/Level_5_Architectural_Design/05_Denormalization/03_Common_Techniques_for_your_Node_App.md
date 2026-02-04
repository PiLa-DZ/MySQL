# 🛠️ Common Techniques for your Node.js App

1. Adding Redundant Columns
    - Instead of joining the Users table every time you want to see a post, you save the username directly in the Posts table.
        1. Benefit: Instant display of the post and author name.
        2. Cost: If the user changes their name, you have to update thousands of rows in the Posts table.

2. Storing Derived/Calculated Values
    - Instead of running a SUM(order_total) every time a user views their profile, you keep a total_spent column in the Users table.
        1. Benefit: Profile page loads instantly.
        2. Cost: You must update this sum every time a new order is placed (perfect for a Trigger 🪤!).

3. Table Splitting (Horizontal/Vertical)
    - Breaking a very wide table into two pieces so the most used columns are together.
