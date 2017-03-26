require 'pry'
module FootballService

	def putsql(gf,ga,p,id,rs)
		puts  "update ... set #{rs} = #{rs} + 1, GF = GF + #{gf}, GA = GA + #{ga}, GD = GD + #{gf.to_i - ga.to_i},points = points + #{p} where id = #{id}"
	end

	def insert_team(adapter, teamname, leagues_id)
		@sqladapter.client.query("INSERT INTO leagues (name, leagues_id) VALUES ('#{teamname}', #{leagues_id})")
	end

	def update_score(adapter, gf, ga, pts, leagues_id, result)
		sql = "UPDATE leagues set GF = GF + #{gf}, GA = GA + #{ga}, GD = GD + #{gf.to_i - ga.to_i},
		Pts = Pts + #{pts}, #{result} = #{result} + 1 WHERE leagues_id = #{leagues_id}"
		@sqladapter.client.query(sql)
	end

	def get_arr_teams(sqladapter)
		result = @sqladapter.client.query("select * from leagues order by Pts desc")
		return result.to_a
	end
end
