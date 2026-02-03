-- == ======================================================
-- Common Examples of Many-to-Many:                       --
-- Students -> Courses                                    --
-- Posts    -> Tags                                       --
-- Users    -> Roles/Permissions                          --
-- Orders   -> Products                                   --
-- Actors   -> Movies                                     --
-- Doctors  -> Patients                                   --
-- == ======================================================

-- Students -> Courses
-- -- Logic         : A student enrolls in many courses; a course has many students.
-- -- Junction Table: enrollments

-- Posts -> Tags
-- -- Logic         : A blog post can have many tags (SQL, Web, Dev); a tag can be attached to many posts.
-- -- Junction Table: post_tags

-- Users -> Roles/Permissions
-- -- Logic         : A user can be both an "Admin" and an "Editor"; the "Admin" role contains many users.
-- -- Junction Table: user_roles

-- Orders -> Products
-- -- Logic         : An order contains many different products; a product (like an iPhone) appears in thousands of different orders.
-- -- Junction Table: order_items (often contains extra data like quantity).

-- Actors -> Movies
-- -- Logic         : An actor stars in many movies; a movie has a cast of many actors.
-- -- Junction Table: cast_members

-- Doctors -> Patients
-- -- Logic         : A doctor treats many patients; a patient sees many specialists (Dentist, Surgeon, GP).
-- -- Junction Table: appointments
