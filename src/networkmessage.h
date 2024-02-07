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

#ifndef __NETWORK_MESSAGE__
#define __NETWORK_MESSAGE__

#include "otsystem.h"
#include "const.h"

class Item;
class Creature;
class Player;
class Position;
class RSA;

class NetworkMessage
{
	public:
		enum {headerLength = 2};
		enum {bodyLength = NETWORKMESSAGE_MAXSIZE - headerLength};

		// constructor/destructor
		NetworkMessage() {Reset();}
		virtual ~NetworkMessage() {}

	protected:
		// resets the internal buffer to an empty message
		void Reset()
		{
			m_MsgSize = 0;
			m_ReadPos = 8;
		}

	public:
		// skips count unknown/unused bytes in an incoming message
		void SkipBytes(int32_t count) {m_ReadPos += count;}

		// simply read functions for incoming message
		uint8_t GetByte() 
		{
            if(sizeof(uint8_t) >= (NETWORKMESSAGE_MAXSIZE - m_ReadPos)) {
                return 0xFF;
            }
            
            return m_MsgBuf[m_ReadPos++];
        }
		uint8_t PeekByte() {return m_MsgBuf[m_ReadPos];}
		uint16_t GetU16()
		{
			if(sizeof(uint16_t) >= (NETWORKMESSAGE_MAXSIZE - m_ReadPos)) {
                return 0xFFFF;
            }
            
            uint16_t v = *(uint16_t*)(m_MsgBuf + m_ReadPos);
			m_ReadPos += 2;
			return v;
		}
		uint16_t PeekU16()
		{
			uint16_t v = *(uint16_t*)(m_MsgBuf + m_ReadPos);
			return v;
		}
		uint32_t GetU32()
		{
			if(sizeof(uint32_t) >= (NETWORKMESSAGE_MAXSIZE - m_ReadPos)) {
                return 0xFFFFFFFF;
            }
            
            uint32_t v = *(uint32_t*)(m_MsgBuf + m_ReadPos);
			m_ReadPos += 4;
			return v;
		}
		uint32_t PeekU32()
		{
			uint32_t v = *(uint32_t*)(m_MsgBuf + m_ReadPos);
			return v;
		}
		uint64_t GetU64()
		{
			if(sizeof(uint64_t) >= (NETWORKMESSAGE_MAXSIZE - m_ReadPos)) {
                return 0xFFFFFFFF;
            }
            
            uint64_t v = *(uint64_t*)(m_MsgBuf + m_ReadPos);
			m_ReadPos += 8;
			return v;
		}
		uint64_t PeekU64()
		{
			uint64_t v = *(uint64_t*)(m_MsgBuf + m_ReadPos);
			return v;
		}

		std::string GetString(uint16_t size = 0);
		std::string GetRaw() {return GetString(m_MsgSize - m_ReadPos);}

		Position GetPosition();
		uint16_t GetSpriteId() {return GetU16();}

		// simply write functions for outgoing message
		void AddByte(uint8_t value)
		{
			if(!canAdd(1))
				return;

			m_MsgBuf[m_ReadPos++] = value;
			m_MsgSize++;
		}
		void AddU16(uint16_t value)
		{
			if(!canAdd(2))
				return;

			*(uint16_t*)(m_MsgBuf + m_ReadPos) = value;
			m_ReadPos += 2; m_MsgSize += 2;
		}
		void AddU32(uint32_t value)
		{
			if(!canAdd(4))
				return;

			*(uint32_t*)(m_MsgBuf + m_ReadPos) = value;
			m_ReadPos += 4; m_MsgSize += 4;
		}
		void AddU64(uint64_t value)
		{
			if(!canAdd(8))
				return;

			*(uint64_t*)(m_MsgBuf + m_ReadPos) = value;
			m_ReadPos += 8; m_MsgSize += 8;
		}


		void AddBytes(const char* bytes, uint32_t size);
		void AddPaddingBytes(uint32_t n);

		void AddString(const std::string &value) {AddString(value.c_str());}
		void AddString(const char* value);
		void AddPutString(const std::string& value);

		// write functions for complex types
		void AddPosition(const Position &pos);
		void AddItem(uint16_t id, uint16_t count); //65kitem 
		void AddItem(const Item *item);
		void AddItemId(const Item *item);
		void AddItemId(uint16_t itemId);
		void AddItemBallInfo(const Item* item);

		int32_t getMessageLength() const {return m_MsgSize;}
		void setMessageLength(int32_t newSize) {m_MsgSize = newSize;}

		int32_t getReadPos() const {return m_ReadPos;}
		void setReadPos(int32_t newPos) {m_ReadPos = newPos;}

		char* getBuffer() {return (char*)&m_MsgBuf[0];}
		char* getBodyBuffer() {m_ReadPos = 2; return (char*)&m_MsgBuf[headerLength];}

		int32_t decodeHeader();

#ifdef __TRACK_NETWORK__
		virtual void Track(std::string file, long line, std::string func) {}
		virtual void clearTrack() {}
#endif

	protected:
		inline bool canAdd(int32_t size) {return (size + m_ReadPos < NETWORKMESSAGE_MAXSIZE - 16);}

		uint8_t m_MsgBuf[NETWORKMESSAGE_MAXSIZE];
		int32_t m_MsgSize, m_ReadPos;
};

typedef boost::shared_ptr<NetworkMessage> NetworkMessage_ptr;
#endif // #ifndef __NETWORK_MESSAGE__
