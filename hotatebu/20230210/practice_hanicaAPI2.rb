# 必要なライブラリの読み込み
require "net/http"   # Web からデータを取得してくるライブラリ
require "json"       # JSON データを読み込むライブラリ


###########################################################
# アクセスするための HTTP オブジェクトを作成
###########################################################

# TODO: ドメインは参照するテナントごとに変更する
uri = URI.parse("https://new-hige-test.hanica.me/")
http = Net::HTTP.new(uri.host, uri.port)
# https を使うので SSL/TLS を有効にする
http.use_ssl = true



###########################################################
# API から実際にデータを取得する
###########################################################

# TODO: 対象の API を操作するためのアクセストークンを設定
# /admin/access_tokens から取得できる
api_token = "shr_866a_zfRQ8ZLYBecduSq7MUTgzxqWXhd3FKJN"

# API へアクセスする時に使用する headers 情報を作成
headers = { "Content-Type" => "application/json", "Authorization" => "Bearer #{api_token}" }

# POSt するデータ
params = {
  "last_name": "山田",
  "first_name": "四郎",
  "gender": "male"
}

# params のデータを元にして従業員情報を登録する
# MEMO: params の値を #to_json を使って JSON 形式に変換する必要がある
response = http.post("/api/v1/crews", params.to_json, headers)

pp response
# => #<Net::HTTPCreated 201 Created readbody=true>


# POST したレスポンスとして登録された従業員情報が返ってくる
crew = JSON.parse(response.body, symbolize_names: true)
pp crew
# => {:id=>"deb7552c-663f-442c-9730-eada9e1d87d4",
#     :user_id=>nil,
#     :biz_establishment_id=>"6ea06497-3840-465a-bc81-6be171d1aad9",
#     :emp_code=>nil,
#     :emp_type=>nil,
#     :employment_type=>nil,
#     :emp_status=>"employed",
#     :last_name=>"山田",
#     :first_name=>"四郎",
#     :last_name_yomi=>nil,
#     :first_name_yomi=>nil,
#     :business_last_name=>"",
#     :business_first_name=>"",
#     :business_last_name_yomi=>"",
#     :business_first_name_yomi=>"",
#     :birth_at=>nil,
#     :gender=>"male",
#     ...