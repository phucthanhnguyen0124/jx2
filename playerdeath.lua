--天门阵战场死亡脚本
--by vivi
--2009\07\18

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
--追回大字帖大作战
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

function OnDeath(Launcher)
	ClearColdDown();	--清除药CD
	local nBattleState = GetMissionV(MV_TMZ_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	--非开战状态死的
		return 0;
	end;	
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	local nDeathIndex = PlayerIndex;
	local nDeathName = GetName();
	local nDeathCamp = GetTask(TASKID_TMZ_PLAY_CAMP);
	local nKillerName = "";
	local nDeathKillNums = GetTask(TASKID_TMZ_KILL_NUMS);
	if nKillerIndex > 0 and nKillerIndex ~= nDeathIndex then
		PlayerIndex = nKillerIndex;
		nKillerName = GetName();
		local nSex = GetSex();
		local tSexName = {"Tha","Ngi ch琲"};
		local nCamp = GetTask(TASKID_TMZ_PLAY_CAMP);
		SetTask(TASKID_TMZ_KILL_PLAYER,GetTask(TASKID_TMZ_KILL_PLAYER)+1);
		SetTask(TASKID_TMZ_KILL_NUMS,GetTask(TASKID_TMZ_KILL_NUMS)+1);
		Msg2Player(format("C竎 h�  ti猽 di謙 %s, s� ngi hi謓 t筰 di謙 頲: %d, s� ngi li猲 ti誴 ti猽 di謙: %d",nDeathName,GetTask(TASKID_TMZ_KILL_PLAYER),GetTask(TASKID_TMZ_KILL_NUMS)));
		local nKillPlayers = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKillNums = GetTask(TASKID_TMZ_KILL_NUMS);
		
		_stat_when_kill_player()
		
		if nDeathKillNums >= 10 and nDeathKillNums <= 29 then
			Msg2MSAll(MISSION_ID,format("%s  nh b筰 %s! V� i h�? H醝 qua ta ch璦!",nKillerName,nDeathName));
		elseif nDeathKillNums >= 30 then
			Msg2MSAll(MISSION_ID,format("%s  nh b筰 %s! ng v藋, ta ch輓h l� m閠 v� anh h飊g!",nKillerName,nDeathName));
		end		
		
		if nKillNums == 4 then
			Msg2MSAll(MISSION_ID,format("%s, %s  li猲 t鬰 nh b筰 %d ngi, qu� th藅 l� m閠 cao th�!",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums == 5 then
			Msg2MSAll(MISSION_ID,format("%s, %s v� ngh� cao cng,  li猲 t鬰 nh b筰 %d ngi !",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 5 and nKillNums <= 7 then
			Msg2MSAll(MISSION_ID,format("%s, %s  li猲 t鬰 nh b筰 %d ngi, qu� l� v� ngh� si猽 qu莕",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 7 and nKillNums <= 9 then
			Msg2MSAll(MISSION_ID,format("%s, %s li猲 t鬰 nh b筰 %d ngi, s鴆 m筺h nh� m閠 v� th莕!",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 9 and nKillNums <= 29 then
			Msg2MSAll(MISSION_ID,format("%s, %s li猲 t鬰 nh b筰 %d ngi, ch糿g l� kh玭g ai c� th� nh b筰 dc %s sao?",tCampName[nCamp],nKillerName,nKillNums,tSexName[nSex]));
		elseif nKillNums >= 30 then
			Msg2MSAll(MISSION_ID,format("%s, %s  li猲 t鬰 nh b筰 %d ngi, ch� c� m閠 v� th莕 th� 2 m韎 c� th� nh b筰 頲 %s!",tCampName[nCamp],nKillerName,nKillNums,tSexName[nSex]));
		end
		
		if nKillPlayers == 20 then
			Msg2MSAll(MISSION_ID,format("%s, %s  ti猽 di謙 h誸 %d ngi!",tCampName[nCamp],nKillerName,nKillPlayers));
		elseif nKillPlayers == 30 then
			Msg2MSAll(MISSION_ID,format("%s, %s  ti猽 di謙 t鎛g c閚g %d ngi, th� kh玭g th� !",tCampName[nCamp],nKillerName,nKillPlayers));
		elseif nKillPlayers == 40 then
			Msg2MSAll(MISSION_ID,format("%s, %s  ti猽 di謙 t鎛g c閚g %d ngi, c竔 th� v� song!",tCampName[nCamp],nKillerName,nKillPlayers));
		end
		
		--写入显示数据
		local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
		local nKillNum1 = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKillNum2 = GetTask(TASKID_TMZ_PLAYER_KILLED);
		local nKillNum3 = GetTask(TASKID_TMZ_KILL_EYE);	
		TMZ_Write_TableData(nCurN,nCamp,nKillNum1,nKillNum2,nKillNum3);	
	end
	
	PlayerIndex = nDeathIndex;
	SetTaskTemp(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetTaskTemp(TASK_TEMP_DIE_TIME,GetTime());
	SetTask(TASKID_TMZ_PLAYER_KILLED,GetTask(TASKID_TMZ_PLAYER_KILLED)+1);
	SetTask(TASKID_TMZ_KILL_NUMS,0);	
	Msg2Player("B筺 b� "..nKillerName.."C玭g k輈h tr鋘g thng");
	
	_stat_when_death()
	
	--写入显示数据	
	local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	local nKilledNum1 = GetTask(TASKID_TMZ_KILL_PLAYER);
	local nKilledNum2 = GetTask(TASKID_TMZ_PLAYER_KILLED);
	local nKilledNum3 = GetTask(TASKID_TMZ_KILL_EYE);	
	TMZ_Write_TableData(nCurN,nDeathCamp,nKilledNum1,nKilledNum2,nKilledNum3);	
	--============处理重生点==============================
	local nMapId = GetMissionV(MV_TMZ_MAP_ID);
	local nCampPlace = TMZ_GetCamp();
	SetTempRevPos(nMapId,tPositionCamp[nCampPlace][1][1]*32,tPositionCamp[nCampPlace][1][2]*32);	--设置重生点	
	
	local oldPlayerIndex = PlayerIndex;
	if nKillerIndex > 0 and nKillerIndex ~= PlayerIndex then
		--追回大字帖
		PlayerIndex = nKillerIndex;
		dzt_tmz_kill_player();
		PlayerIndex = oldPlayerIndex;
	end
end