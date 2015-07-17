# json.(@athlete_plans, :plan_id)
# json.array! @athlete_plans, :plan_id
# json.array! @plans 
json.array! @athlete_workouts
# json.array! @plan_workouts
# json.(@article, :id)
# json.author @article.author, :id, :name

# json.xxx do |json|
#   json.(@plans, :id, :name)
#   json.(@athlete_plans, :start_date, :end_date)
#   json.(@athlete_workouts)
# end

# json.(@article, :id)
# json.author do |json|
#    json.(@article.author, :id, :name) 
#    json.url author_url(@articles.author)
# end
# json.comments @article.comments, :id, :name, :content

#  {“id” : “author”:{“id” : 2, “name” : “Clark Kent”, “url” : “http:___”}, “comments” : [{“id”:1, “name”:”Lois Lane”, “content” : “Does anybody know?”},{“id”:2, “name”:”Lex Luther”, “content”: “I have kyrponite”}]}