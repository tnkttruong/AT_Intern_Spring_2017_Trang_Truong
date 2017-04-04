require 'pry'
module FootballService

	def creat_table adapter
		@sqladapter.client.query("CREATE TABLE IF NOT EXISTS leagues (leagues_id INT NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL,W INT NULL default 0,
			D INT NULL default 0, L INT NULL default 0, GF INT NULL default 0,GA INT NULL default 0,
			GD INT NULL default 0,Pts INT NULL default 0, PRIMARY KEY (leagues_id))")
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
