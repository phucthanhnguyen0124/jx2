--天门阵数据统计

Include("\\settings\\static_script\\missions\\base\\runtime_data_stat.lua")

MAIN_ID = 11
function _stat_on_misson_open()
	AddRuntimeStat(MAIN_ID, 1, 0, 1)
end

function _stat_on_misson_start(nMissionId)
	AddRuntimeStat(MAIN_ID, 2, 0, 1)
	local f=function(tPara)
		AddRuntimeStat(MAIN_ID, 4, 0, 1)
		_stat_trans_player_count(MAIN_ID, 7, 1, 100)
		_stat_level_player_count(MAIN_ID, 5, 80, 89)
		_stat_level_player_count(MAIN_ID, 6, 90, 99)
		AddRuntimeStat(MAIN_ID, 15, GetPlayerRoute(), 1)
	end
	_op_on_mission_players(nMissionId, 0, f, nil)
end
function _stat_on_misson_none_start()
	AddRuntimeStat(MAIN_ID, 3, 0, 1)
end
function _stat_on_misson_end(nMissionId, nWinner)
	if nWinner == 0 then
		AddRuntimeStat(MAIN_ID, 14, 0, 1)
	elseif nWinner == 1 then
		AddRuntimeStat(MAIN_ID, 12, 0, 1)
	elseif nWinner == 2 then
		AddRuntimeStat(MAIN_ID, 13, 0, 1)
	end
	
	local f=function(tPara)
		AddRuntimeStat(MAIN_ID, 8, 0, 1)
	end
	_op_on_mission_players(nMissionId, 0, f, nil)
end

function _stat_when_kill_player()
	AddRuntimeStat(MAIN_ID, 16, GetPlayerRoute(), 1)
end
function _stat_when_death()
	AddRuntimeStat(MAIN_ID, 11, 0, 1)
	AddRuntimeStat(MAIN_ID, 17, GetPlayerRoute(), 1)
end
function _stat_when_kill_flag()
	AddRuntimeStat(MAIN_ID, 18, GetPlayerRoute(), 1)
end

function _stat_when_award(nType, nActiveLevel)
	if nType >= 1 and nType <= 3 then
		AddRuntimeStat(MAIN_ID, 25+nType-1, 0, 1)
	end
	if nActiveLevel >= 1 and nActiveLevel <= 6 then
		AddRuntimeStat(MAIN_ID, 19+nActiveLevel-1, 0, 1)
	end
end

function _stat_when_join(nJoinPlayerCount)
	if nJoinPlayerCount > 1 then
		AddRuntimeStat(MAIN_ID, 10, 0, 1)
	else
		AddRuntimeStat(MAIN_ID, 9, 0, 1)
	end
end


