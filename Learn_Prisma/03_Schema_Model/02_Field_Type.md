Field_Types
Summary:


More Details:
1. The "Text" Types
2. The "Number" Types
3. The "Logic & Time" Types
4. The "Special" Types

- 💡 Two "Golden Rules" of Field Types
    1. Rule A: Case Sensitivity
        In the schema file, types must start with a Capital Letter.
        ✅ String
        ❌ string

    2. Rule B: The Default is "Required"
        If you just write name String, 
        Prisma will never allow that field to be empty. 
        If you try to save a user without a name,
        the database will throw an error. 
        (This is where the ? modifier comes in later!)



