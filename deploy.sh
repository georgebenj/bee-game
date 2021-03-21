set -e
npm run build
cd dist
git init
git add -A
git commit -m 'deploy'
git push -f hit@github.com:georgegosden/vue-clicker.git master:gh-pages
cd -