-- == ======================================================
-- Common Examples of One-to-One:                         --
-- User     -> User_Profile                               --
-- Employee -> Salary_Details                             --
-- Citizen  -> ID_Card / Passport                         --
-- Product  -> Product_Technical_Specs                    --
-- Order    -> Invoice                                    --
-- == ======================================================

-- User -> User_Profile
-- -- Logic: Main data (email/password) in one table; extra data (bio, avatar, birthday) in another.

-- Employee -> Salary_Details
-- -- Logic: Keep general info public, but keep bank accounts and salary in a restricted One-to-One table.

-- Citizen -> ID_Card / Passport
-- -- Logic: A citizen has one passport number; that passport belongs to only that citizen.

-- Product -> Product_Technical_Specs
-- -- Logic: To keep the products table fast, move the long, heavy technical descriptions to a separate table.

-- Order -> Invoice
-- -- Logic: One specific order generates exactly one official invoice document.
