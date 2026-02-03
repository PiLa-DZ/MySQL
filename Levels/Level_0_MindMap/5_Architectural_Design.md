```SQL
/*
|=====================================================================|
|                                                                     |
| 🏗️ Architectural Design   (Relationships & Normalization)           |
|                                                                     |
|=====================================================================|
|                                                                     |
| 🧬 The Connections (Relationships)                                  |
| ___________________________________________________________________ |
| 💍 One-to-One      | The Marriage:                                  |
|                    | One person has one passport. Rare,             |
|                    | but useful for splitting sensitive data.       |
| -------------------|----------------------------------------------- |
| 🌳 One-to-Many     | The Tree:                                      |
|                    | One author has many books.                     |
|                    | The most common relationship in the world.     |
| -------------------|----------------------------------------------- |
| 🕸️ Many-to-Many    | The Web:                                       |
|                    | Many students take many courses.               |
|                    | Requires a "Junction Table" (the bridge).      |
|=====================================================================|
|                                                                     |
| 📐 The Blueprint (Optimization)                                     |
| ___________________________________________________________________ |
| 🧹 Normalization   | The Organizer:                                 |
|                    | The process of removing "Double Data"          |
|                    | (duplicates) to save space and prevent bugs.   |
| -------------------|----------------------------------------------- |
| 🚀 Denormalization | The Speed Hack:                                |
|                    | Intentionally breaking normalization rules     |
|                    | to make SELECT queries faster in massive apps. |
|=====================================================================|
*/
```
