require 'pry'
module FootballService

	def creat_table adapter
		@sqladapter.client.query("alter table `leagues` add column `name` varchar(100) not null default '' 
			AFTER `leagues_id` ,add column `W` int(10) not null default '0' AFTER `name` ,add column `D` int(10) not null default '0' 
			AFTER `W` ,add column `L` int(10) not null default '0' AFTER `D` ,add column `GF` int(10) not null default '0' 
			AFTER `L` ,add column `GA` int(10) not null default '0' AFTER `GF` ,add column `GD` int(10) not null default '0' 
			AFTER `GA` ,add column `Pts` int(10) not null default '0' AFTER `GD` ,comment = 'latin1_swedish_ci' ")
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
