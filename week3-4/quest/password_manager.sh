#!/bin/bash

FILE=./password_manager
while true
do
	echo "パスワードマネージャーへようこそ！"
	read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" selected
	case $selected in
		"Add Password")
			read -p "サービス名を入力してください:" service
			read -p "ユーザー名を入力してください:" username
			read -p "パスワードを入力してください:" password
			if [ -e "${FILE}.gpg" ]; then
				gpg "${FILE}.gpg"
				rm "${FILE}.gpg"
			else
				touch $FILE
			fi
			echo "$service:$username:$password" >> $FILE
			gpg --symmetric $FILE
			rm $FILE
			echo "パスワードの追加は成功しました。"
			;;
		"Get Password")
			if [ ! -e "${FILE}.gpg" ]; then
				echo "パスワード保存先が見当たりません。"
				continue
			fi
			read -p "サービス名を入力してください:" service_name
			gpg -q --output $FILE --decrypt "${FILE}.gpg"
			result=$( grep $service_name $FILE )
			rm $FILE
			if [ -z $result ]; then
				echo "そのサービス名は登録されていません。"
			else
				echo $result | awk -F '[:]' '{print "サービス名:"$1"\nユーザー名:"$2"\nパスワード:"$3}'
			fi
			;;
		"Exit")
			echo "Thank you!"
			exit 0
			;;
		*)
			echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
			;;
	esac
done
