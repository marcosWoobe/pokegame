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
#include "otpch.h"
#include <iostream>

#include "networkmessage.h"
#include "position.h"
#include "rsa.h"

#include "container.h"
#include "creature.h"
#include "player.h"

int32_t NetworkMessage::decodeHeader()
{
	int32_t size = (int32_t)(m_MsgBuf[0] | m_MsgBuf[1] << 8);
	m_MsgSize = size;
	return size;
}

/******************************************************************************/
std::string NetworkMessage::GetString(uint16_t size/* = 0*/)
{
	if(!size)
		size = GetU16();

	if(size >= (NETWORKMESSAGE_MAXSIZE - m_ReadPos))
		return std::string();

	char* v = (char*)(m_MsgBuf + m_ReadPos);
	m_ReadPos += size;
	return std::string(v, size);
}

Position NetworkMessage::GetPosition()
{
	Position pos;
	pos.x = GetU16();
	pos.y = GetU16();
	pos.z = GetByte();
	return pos;
}
/******************************************************************************/

void NetworkMessage::AddString(const char* value)
{
	uint32_t stringLen = (uint32_t)strlen(value);
	if(!canAdd(stringLen + 2) || stringLen > 8192)
		return;

	AddU16(stringLen);
	strcpy((char*)(m_MsgBuf + m_ReadPos), value);
	m_ReadPos += stringLen;
	m_MsgSize += stringLen;
}

void NetworkMessage::AddPutString(const std::string& value)
{
	uint32_t stringLen = value.length();
	if (!canAdd(stringLen + 2) || stringLen > 8192) {
		return;
	}

	AddU16(stringLen);
	memcpy(m_MsgBuf + m_ReadPos, value.c_str(), stringLen);
	m_ReadPos += stringLen;
	m_MsgSize += stringLen;
}

void NetworkMessage::AddBytes(const char* bytes, uint32_t size)
{
	if(!canAdd(size) || size > 8192)
		return;

	memcpy(m_MsgBuf + m_ReadPos, bytes, size);
	m_ReadPos += size;
	m_MsgSize += size;
}

void NetworkMessage::AddPaddingBytes(uint32_t n)
{
	if(!canAdd(n))
		return;

	memset((void*)&m_MsgBuf[m_ReadPos], 0x33, n);
	m_MsgSize = m_MsgSize + n;
}

void NetworkMessage::AddPosition(const Position& pos)
{
	AddU16(pos.x);
	AddU16(pos.y);
	AddByte(pos.z);
}

void NetworkMessage::AddItem(uint16_t id, uint16_t count)//65kitem
{
	const ItemType &it = Item::items[id];
	AddU16(it.clientId);
	if(it.stackable || it.isRune())
		AddU16(count);//65kitem
	else if(it.isSplash() || it.isFluidContainer())
	{
		uint32_t fluidIndex = (count % 8);
		AddU16(fluidMap[fluidIndex]);//65kitem
	}
}

void NetworkMessage::AddItem(const Item* item)
{
	const ItemType &it = Item::items[item->getID()];
	AddU16(it.clientId);
	if(it.stackable || it.isRune())
		AddU16(item->getSubType());//65kitem
	else if(it.isSplash() || it.isFluidContainer())
		AddU16(fluidMap[item->getSubType() % 8]);//65kitem
}

void NetworkMessage::AddItemId(const Item *item)
{
	const ItemType &it = Item::items[item->getID()];
	AddU16(it.clientId);
}

void NetworkMessage::AddItemId(uint16_t itemId)
{
	const ItemType &it = Item::items[itemId];
	AddU16(it.clientId);
}

// void NetworkMessage::AddItemBallInfo(const Item* item)
// {
// 	boost::any value = item->getAttribute("poke");
// 	boost::any valueB = item->getAttribute("nature");

// 	if ( value.empty() ){
// 		AddByte(0x0);
//     }else{
// 		AddByte(0x1);
// 		AddString(boost::any_cast<std::string>(value).c_str());
// 		AddString(boost::any_cast<std::string>(valueB).c_str());

// 		AddU32(boost::any_cast<int32_t>(item->getAttribute("level")));
// 		AddU32(boost::any_cast<int32_t>(item->getAttribute("boost")));
// 		// AddU32(boost::any_cast<int32_t>(item->getAttribute("price")));
// 	}
// }

void NetworkMessage::AddItemBallInfo(const Item* item)
{
	boost::any value = item->getAttribute("poke");
	boost::any valueB = item->getAttribute("nature");

	// int32_t valueC = 0;
	// boost::any valueC = item->getAttribute("level");
	// int32_t valueD = 0;
	// boost::any valueD = item->getAttribute("boost");

	int32_t valueM1 = 0;
    boost::any valueC = item->getAttribute("level");
	if(!valueC.empty() && valueC.type() == typeid(int32_t))
	    valueM1 = boost::any_cast<int32_t>(valueC);
	int32_t valueM2 = 0;
    boost::any valueD = item->getAttribute("boost");
	if(!valueD.empty() && valueD.type() == typeid(int32_t))
	    valueM2 = boost::any_cast<int32_t>(valueD);	

	if ( value.empty() ){
		AddByte(0x0);
    }else{
		AddByte(0x1);
		AddString(boost::any_cast<std::string>(value).c_str());
		AddString(boost::any_cast<std::string>(valueB).c_str());

		AddU32(valueM1);
		AddU32(valueM2);
	}
}
