--天门阵后续任务npc：耶律保图
--by vivi
--2009-08-04
Include("\\script\\task\\world\\task_award.lua");

function OnDeath()
	local nOldPlayer = PlayerIndex;
	if GetTeamSize() == 1 or GetTeamSize() == 0 then
		if GetTask(1401) == 139 then
			TMZ_Task_Deal()
		end
	else
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetTask(1401) == 139 then
					TMZ_Task_Deal()
				end
			end
		end
		PlayerIndex = nOldPlayer;	
	end
end
--耶律保图任务处理
function TMZ_Task_Deal()
	SetTask(1401,140);
	GivePlayerExp(SkeyTianmenzhen,"liaojunjunguan")
	Msg2Player("S╪ t譵 kh緋 n琲 c騨g kh玭g ph竧 hi謓 g�, h穣 quay v� t譵 M閏 Qu� Anh h醝 th╩ tin t鴆.");
	TaskTip("S╪ t譵 kh緋 n琲 c騨g kh玭g ph竧 hi謓 g�, h穣 quay v� t譵 M閏 Qu� Anh h醝 th╩ tin t鴆.");
end