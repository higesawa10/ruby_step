# 必要なライブラリの読み込み
require "net/http"   # HTTP を扱うライブラリ
require "json"       # JSON を扱うライブラリ


###########################################################
# アクセスするための HTTP オブジェクトを作成
###########################################################

# TODO: ドメインは参照するテナントごとに変更する
uri = URI.parse("https://new-hige-test.hanica.me/")
http = Net::HTTP.new(uri.host, uri.port)
# https を使うので SSL/TLS を有効にする
http.use_ssl = true



###########################################################
# API から従業員情報を取得する
###########################################################

# 対象の API を操作するためのアクセストークンを設定
# /admin/access_tokens から取得できる
api_token = "shr_866a_zfRQ8ZLYBecduSq7MUTgzxqWXhd3FKJN"

# API へアクセスする時に使用する headers 情報を作成
headers = { "Content-Type" => "application/json", "Authorization" => "Bearer #{api_token}" }

# headers の情報を使用して指定した API から値を GET する
response = http.get("/api/v1/crews", headers)


###########################################################
# API から受け取ったデータを Ruby 上で加工する
###########################################################

# レスポンスから JSON 形式のデータを取得する
# この時点ではまだ JSON 形式の文字列になっている
body = response.body
pp body
# "[\n" +
# "  {\n" +
# "    \"id\": \"001a9d04-edc7-4b9c-8346-2df270215adf\",\n" +
# "    \"user_id\": null,\n" +
# "    \"biz_establishment_id\": \"6ea06497-3840-465a-bc81-6be171d1aad9\",\n" +
# "    \"emp_code\": \"sample46\",\n" +
# "    \"emp_type\": null,\n" +
# "    \"employment_type\": null,\n" +
# "    \"emp_status\": \"employed\",\n" +
# ...

# Ruby で扱うための JSON のデータにパースする
# parse 後は Ruby の Hash のデータになる
# symbolize_names: true を使用するとキーが Symbol として変換される
crews = JSON.parse(body, symbolize_names: true)

# 取得したデータを加工したり
pp crews.count
# => 10

# 従業員情報から必要な情報を抽出する
pp crews.map { "#{_1[:id]}: #{_1[:last_name]} #{_1[:first_name]}" }
# => ["001a9d04-edc7-4b9c-8346-2df270215adf: 労務 華子",
#     "011ab882-df5a-4752-a80e-7f3f2eee3827: 労務 華子",
#     "0257608f-3d0a-4f53-ba3e-9d511bcef0e0:  ",
#     "03db2786-05de-4ecd-8926-e4ba8e8b4b2f: 労務 華子",
#     "04cfb687-fa8b-49b3-a5b5-54b59519c5c1:  ",
#     "0555ddee-5322-4111-ba7e-614ad49ffcd0:  ",
#     "0608d208-b542-45a0-a85d-26327f4dc6cd: 労務 華子",
#     "091acfc8-88dd-48e7-99b6-122bbc2f16d3:  ",
#     "0940c6f5-a963-48f1-9676-a93abdc2c211: 労務 華子",
#     "094eecae-1a10-4632-803f-746a949d5ee3: 労務 華子"]