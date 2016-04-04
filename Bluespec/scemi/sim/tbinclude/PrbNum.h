// Automatically generated by: ::SceMiMsg
// DO NOT EDIT
// C++ Class with SceMi Message passing for Bluespec type:  SceMiScan::PrbNum
// Generated on: Wed Mar 02 23:28:13 EST 2016
// Bluespec version: 2014.07.A 2014-07-30 34078

#pragma once

#include "bsv_scemi.h"
#include "CosimStruct.h"
#include "PowerProbe.h"


/// C++ class representing the hardware tagged union SceMiScan::PrbNum
/// This class has been automatically generated.
class PrbNum : public BSVType {
 public:

  // Enumeration type for the tag
  enum TAG {
    tag_Explicit=0,
    tag_HdlEdit=1,
    tag_Cosim=2,
    tag_Power=3,
    tag_Assertion=4,
    tag_DUMMY5=5,
    tag_DUMMY6=6,
    tag_Control=7
  };

  SceMiU32 the_tag;
  BitT<13> m_Explicit;
  BitT<13> m_HdlEdit;
  CosimStruct m_Cosim;
  PowerProbe m_Power;
  BitT<13> m_Assertion;
  BSVVoid m_DUMMY5;
  BSVVoid m_DUMMY6;
  BitT<13> m_Control;

  PrbNum ()
    : the_tag(0)
    , m_Explicit ()
    , m_HdlEdit ()
    , m_Cosim ()
    , m_Power ()
    , m_Assertion ()
    , m_DUMMY5 ()
    , m_DUMMY6 ()
    , m_Control ()
  {}
  
  /// Constructor for tagged union from a SceMiMessageData object
  /// @param msg -- the scemi message object
  /// @param off -- the starting bit offset, updated to next bit position
  PrbNum (const SceMiMessageDataInterface *msg, unsigned int &off)
    : the_tag(0)
    , m_Explicit ()
    , m_HdlEdit ()
    , m_Cosim ()
    , m_Power ()
    , m_Assertion ()
    , m_DUMMY5 ()
    , m_DUMMY6 ()
    , m_Control ()  {
    unsigned int tmpoff = off;
    the_tag = msg->GetBitRange (off + 13, 2);
    switch (the_tag) {
      case tag_Explicit: m_Explicit = BitT<13>(msg, tmpoff) ; break ;
      case tag_HdlEdit: m_HdlEdit = BitT<13>(msg, tmpoff) ; break ;
      case tag_Cosim: m_Cosim = CosimStruct(msg, tmpoff) ; break ;
      case tag_Power: m_Power = PowerProbe(msg, tmpoff) ; break ;
      case tag_Assertion: m_Assertion = BitT<13>(msg, tmpoff) ; break ;
      case tag_DUMMY5: m_DUMMY5 = BSVVoid(msg, tmpoff) ; break ;
      case tag_DUMMY6: m_DUMMY6 = BSVVoid(msg, tmpoff) ; break ;
      case tag_Control: m_Control = BitT<13>(msg, tmpoff) ; break ;
      default: std::cerr << "bad tag fields in PrbNum constructor" << std::endl;
    };
    off += 16;
  }
  
  /// Converts into its bit representation for sending as a SceMi message
  /// @param msg -- the message object written into
  /// @param off -- bit position offset in message
  /// @return next free bit position in the message for writing
  unsigned int setMessageData (SceMiMessageDataInterface &msg, const unsigned int off=0) const {
    msg.SetBitRange(off + 13, 2, the_tag);
    switch (the_tag) {
      case tag_Explicit: m_Explicit.setMessageData (msg, off); break;
      case tag_HdlEdit: m_HdlEdit.setMessageData (msg, off); break;
      case tag_Cosim: m_Cosim.setMessageData (msg, off); break;
      case tag_Power: m_Power.setMessageData (msg, off); break;
      case tag_Assertion: m_Assertion.setMessageData (msg, off); break;
      case tag_DUMMY5: m_DUMMY5.setMessageData (msg, off); break;
      case tag_DUMMY6: m_DUMMY6.setMessageData (msg, off); break;
      case tag_Control: m_Control.setMessageData (msg, off); break;
      default: std::cerr << "bad tag fields in PrbNum setMessageData" << std::endl;
    }
    return off + 16;
  }
  
  /// overload the put-to operator for PrbNum
  friend std::ostream & operator<< (std::ostream &os, const PrbNum &obj) {
    BSVType::PutTo * override = lookupPutToOverride ( obj.getClassName() );
    if ( override != 0 ) {
       return override(os, obj );
    }
    SceMiU32 tag = obj.the_tag;
    switch (tag) {
      case  tag_Explicit: os << "{Explicit " << obj.m_Explicit << "}" ; break;
      case  tag_HdlEdit: os << "{HdlEdit " << obj.m_HdlEdit << "}" ; break;
      case  tag_Cosim: os << "{Cosim " << obj.m_Cosim << "}" ; break;
      case  tag_Power: os << "{Power " << obj.m_Power << "}" ; break;
      case  tag_Assertion: os << "{Assertion " << obj.m_Assertion << "}" ; break;
      case  tag_DUMMY5: os << "{DUMMY5 " << obj.m_DUMMY5 << "}" ; break;
      case  tag_DUMMY6: os << "{DUMMY6 " << obj.m_DUMMY6 << "}" ; break;
      case  tag_Control: os << "{Control " << obj.m_Control << "}" ; break;
      default: std::cerr << "bad tag fields in PrbNum operator<<" << std::endl;
    }
    return os;
  }
  
  /// Accessor for the BSVType name for this object
  /// @param os -- the ostream object which to append
  /// @return the ostream object
  virtual std::ostream & getBSVType (std::ostream & os) const {
    os << "SceMiScan::PrbNum" ;
    return os;
  }

  /// Accessor on the size of the object in bits
  /// @return the bit size
  virtual unsigned int getBitSize () const {
    return 16;
  }

  /// Adds to the stream the bit representation of this tagged union object
  /// @param os -- the ostream object which to append
  /// @return the ostream object
  virtual std::ostream & getBitString (std::ostream & os) const {
    for ( int i = 2 ; i >= 0 ; --i) {
       os << ( ((the_tag & (0x01 << i)) != 0) ? '1' : '0' ) ;
    }
    switch (the_tag) {
      case tag_Explicit:
        m_Explicit.getBitString (os);
        break;
      case tag_HdlEdit:
        m_HdlEdit.getBitString (os);
        break;
      case tag_Cosim:
        m_Cosim.getBitString (os);
        break;
      case tag_Power:
        m_Power.getBitString (os);
        break;
      case tag_Assertion:
        m_Assertion.getBitString (os);
        break;
      case tag_DUMMY5:
        os << std::setw(13) << std::setfill('0') << '0' ;
        m_DUMMY5.getBitString (os);
        break;
      case tag_DUMMY6:
        os << std::setw(13) << std::setfill('0') << '0' ;
        m_DUMMY6.getBitString (os);
        break;
      case tag_Control:
        m_Control.getBitString (os);
        break;
      default:
        std::cerr << "bad tag fields in PrbNum::getBitString()" << std::endl;
        os << std::setw(13) << std::setfill('0') << '0' ;
        break;
    }
  return os;
  }
  

  /// returns the class name for this object
  virtual const char * getClassName() const {
    return "PrbNum" ;
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
    return 3;
  }

  /// Accessor for the count of members in object
  virtual unsigned int getMemberCount() const {
    return 8;
  };
  
  /// Accessor to member objects
  /// @param idx -- member index
  /// @return BSVType * to this object or null
  virtual BSVType * getMember (unsigned int idx) {
    switch (idx) {
      case 0: return & m_Explicit;
      case 1: return & m_HdlEdit;
      case 2: return & m_Cosim;
      case 3: return & m_Power;
      case 4: return & m_Assertion;
      case 5: return & m_DUMMY5;
      case 6: return & m_DUMMY6;
      case 7: return & m_Control;
      default: std::cerr << "Index error in getMember for class PrbNum" << std::endl ;
    };
    return 0;
  };
  
  /// Accessor for symbolic member names
  /// @param idx -- member index
  /// @return char* to this name or null
  virtual const char * getMemberName (unsigned int idx) const {
    switch (idx) {
      case 0: return "Explicit";
      case 1: return "HdlEdit";
      case 2: return "Cosim";
      case 3: return "Power";
      case 4: return "Assertion";
      case 5: return "DUMMY5";
      case 6: return "DUMMY6";
      case 7: return "Control";
      default: std::cerr << "Index error in getMemberName for class PrbNum" << std::endl ;
    };
    return 0;
  };
  
  
};

