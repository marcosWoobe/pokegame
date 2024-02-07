////////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
////////////////////////////////////////////////////////////////////////
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
////////////////////////////////////////////////////////////////////////

#ifndef __DUEL__
#define __DUEL__
#include "player.h"

typedef std::vector<Player*> PlayerVector;
typedef std::vector<Item*> ItemVector;

class Player;
class Duel;

class Duel
{
	public:
		Duel(Player* _leader);
		virtual ~Duel() {}

		Player* getLeader() const {return leader;}
		void setLeader(Player* _leader) {leader = _leader;}
		PlayerVector getMembers() {return memberList;}

		void disband();
		bool canDisband() {return memberList.empty() && inviteList.empty();}

        bool okDuel(Player* player);
		bool invitePlayer(Player* player);
		void revokeInvitation(Player* player);
		bool removeInvite(Player* player);
		bool join(Player* player);
		bool leave(Player* player);

		void updateAllIcons();
		void updateIcons(Player* player);
		void broadcastMessage(MessageClasses messageClass, const std::string& text, bool sendToInvitations = false);

		bool isPlayerMember(const Player* player, bool result = false) const;
		bool isPlayerInvited(const Player* player, bool result = false) const;

	protected:

		PlayerVector memberList;
		PlayerVector inviteList;

		Player* leader;
};
#endif
