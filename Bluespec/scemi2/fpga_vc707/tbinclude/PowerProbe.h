// Automatically generated by: ::SceMiMsg
// DO NOT EDIT
// C++ Class with SceMi Message passing for Bluespec type:  SceMiScan::PowerProbe
// Generated on: Sat Mar 12 15:47:13 EST 2016
// Bluespec version: 2014.07.A 2014-07-30 34078

#pragma once

#include "bsv_scemi.h"
#include "PowerAssoc.h"
#include "PowerStruct.h"


/// C++ class representing the hardware tagged union SceMiScan::PowerProbe
/// This class has been automatically generated.
class PowerProbe : public BSVType {
 public:

  // Enumeration type for the tag
  enum TAG {
    tag_ProbeNumber=0,
    tag_Assoc=1
  };

  SceMiU32 the_tag;
  PowerStruct m_ProbeNumber;
  PowerAssoc m_Assoc;

  PowerProbe ()
    : the_tag(0)
    , m_ProbeNumber ()
    , m_Assoc ()
  {}
  
  /// Constructor for tagged union from a SceMiMessageData object
  /// @param msg -- the scemi message object
  /// @param off -- the starting bit offset, updated to next bit position
  PowerProbe (const SceMiMessageDataInterface *msg, unsigned int &off)
    : the_tag(0)
    , m_ProbeNumber ()
    , m_Assoc ()  {
    unsigned int tmpoff = off;
    the_tag = msg->GetBitRange (off + 12, 0);
    switch (the_tag) {
      case tag_ProbeNumber: m_ProbeNumber = PowerStruct(msg, tmpoff) ; break ;
      case tag_Assoc: m_Assoc = PowerAssoc(msg, tmpoff) ; break ;
      default: std::cerr << "bad tag fields in PowerProbe constructor" << std::endl;
    };
    off += 13;
  }
  
  /// Converts into its bit representation for sending as a SceMi message
  /// @param msg -- the message object written into
  /// @param off -- bit position offset in message
  /// @return next free bit position in the message for writing
  unsigned int setMessageData (SceMiMessageDataInterface &msg, const unsigned int off=0) const {
    msg.SetBitRange(off + 12, 0, the_tag);
    switch (the_tag) {
      case tag_ProbeNumber: m_ProbeNumber.setMessageData (msg, off); break;
      case tag_Assoc: m_Assoc.setMessageData (msg, off); break;
      default: std::cerr << "bad tag fields in PowerProbe setMessageData" << std::endl;
    }
    return off + 13;
  }
  
  /// overload the put-to operator for PowerProbe
  friend std::ostream & operator<< (std::ostream &os, const PowerProbe &obj) {
    BSVType::PutTo * override = lookupPutToOverride ( obj.getClassName() );
    if ( override != 0 ) {
       return override(os, obj );
    }
    SceMiU32 tag = obj.the_tag;
    switch (tag) {
      case  tag_ProbeNumber: os << "{ProbeNumber " << obj.m_ProbeNumber << "}" ; break;
      case  tag_Assoc: os << "{Assoc " << obj.m_Assoc << "}" ; break;
      default: std::cerr << "bad tag fields in PowerProbe operator<<" << std::endl;
    }
    return os;
  }
  
  /// Accessor for the BSVType name for this object
  /// @param os -- the ostream object which to append
  /// @return the ostream object
  virtual std::ostream & getBSVType (std::ostream & os) const {
    os << "SceMiScan::PowerProbe" ;
    return os;
  }

  /// Accessor on the size of the object in bits
  /// @return the bit size
  virtual unsigned int getBitSize () const {
    return 13;
  }

  /// Adds to the stream the bit representation of this tagged union object
  /// @param os -- the ostream object which to append
  /// @return the ostream object
  virtual std::ostream & getBitString (std::ostream & os) const {
    for ( int i = 0 ; i >= 0 ; --i) {
       os << ( ((the_tag & (0x01 << i)) != 0) ? '1' : '0' ) ;
    }
    switch (the_tag) {
      case tag_ProbeNumber:
        m_ProbeNumber.getBitString (os);
        break;
      case tag_Assoc:
        m_Assoc.getBitString (os);
        break;
      default:
        std::cerr << "bad tag fields in PowerProbe::getBitString()" << std::endl;
        os << std::setw(12) << std::setfill('0') << '0' ;
        break;
    }
  return os;
  }
  

  /// returns the class name for this object
  virtual const char * getClassName() const {
    return "PowerProbe" ;
  }

  /// returns the BSVKind for this object
  virtual BSVKind getKind() const {
    return BSV_TaggedUnion ;
  }

  /// Accessor to the "tag" portion of the tagged union
  virtual SceMiU32 getTaggedUnionTag () const {
    return the_tag;
  }
  /// returns the bit width of the tag portion of the tagged union
  virtual unsigned int getTaggedUnionTagWidth () const {
    return 1;
  }

  /// Accessor for the count of members in object
  virtual unsigned int getMemberCount() const {
    return 2;
  };
  
  /// Accessor to member objects
  /// @param idx -- member index
  /// @return BSVType * to this object or null
  virtual BSVType * getMember (unsigned int idx) {
    switch (idx) {
      case 0: return & m_ProbeNumber;
      case 1: return & m_Assoc;
      default: std::cerr << "Index error in getMember for class PowerProbe" << std::endl ;
    };
    return 0;
  };
  
  /// Accessor for symbolic member names
  /// @param idx -- member index
  /// @return char* to this name or null
  virtual const char * getMemberName (unsigned int idx) const {
    switch (idx) {
      case 0: return "ProbeNumber";
      case 1: return "Assoc";
      default: std::cerr << "Index error in getMemberName for class PowerProbe" << std::endl ;
    };
    return 0;
  };
  
  
};

