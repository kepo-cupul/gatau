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