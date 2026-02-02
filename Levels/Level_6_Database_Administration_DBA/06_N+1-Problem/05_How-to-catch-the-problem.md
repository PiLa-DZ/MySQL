5. Pro-Tip: How to catch this in the wild
    - If you are looking at your Database Logs 
        - and you see the exact same query repeating 
        - over and over with only the ID changing: 
        - SELECT * FROM comments WHERE post_id = 101; 
        - SELECT * FROM comments WHERE post_id = 102; 
        - SELECT * FROM comments WHERE post_id = 103;
    - Stop! You have an N+1 problem. 
        - Wrap those IDs into an IN (...) or use a JOIN.
