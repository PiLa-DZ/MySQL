# NOTE: You have to drop database if exists
# NOTE: This is just for learning
# NOTE: Don't do this in real projects
mariadb -u admin -pyour_password -e "drop database if exists db1"

cat setup.README.md     > README.md
cat setup.index.js      > index.js
cat setup.gitignore     > .gitignore
cat setup.env           > .env
mkdir -p prisma
cat setup.schema.prisma > prisma/schema.prisma
rm -rf setup.*

npm init -y
npm pkg set type="module"
npm pkg set scripts.start="node index.js"
npm pkg set scripts.dev="nodemon index.js"

npm install express --verbose
npm install dotenv --verbose
npm install nodemon --save-dev --verbose

git init

npm install prisma@6 --save-dev --verbose
npm install @prisma/client@6 --save-dev --verbose
npx prisma init

npx prisma migrate dev --name init
npm start

