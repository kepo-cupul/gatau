# gabut njir

github_user=SanzGanzs
github_token=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
github_repo="$github_user/info-judul"
github_branch=main
folder_name="a"

if [ -z github_token ]; then
  github_url="https://github.com/$github_repo"
else
  github_url="https://$github_user:$github_token@github.com/$github_repo"
fi

echo "Clone repo..."
git clone $github_url $folder_name
cd $folder_name
rm -rf database/*
mkdir tmp

echo "Install modules..."
npm install
npm install @tensorflow/tfjs-node
pm2 start "ts-node src --web" --name a
