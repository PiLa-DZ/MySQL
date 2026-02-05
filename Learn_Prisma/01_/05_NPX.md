NPX
Summary: NPX (Node Package Execute)

More Details:
What is npx?
If npm is a librarian (it goes and gets the books for you), then npx is a temporary library card.
npm (Node Package Manager): Used to install packages into your node_modules folder.
npx (Node Package Execute): Used to run a tool without having to find its path or install it globally on your computer.
The Difference:
If you type prisma, your computer will say: "I don't know what that is."
If you type npx prisma, your computer says: "Okay, look inside the node_modules folder, find the prisma tool, and run it for me."
Key takeaway: We use npx for commands that do something (like generating code or migrating a database), rather than just being a library we import into our code.
