// Automatically generated by: ::SceMiMsg
// DO NOT EDIT
// C++ Class with SceMi Message passing for Bluespec type:  SpeckTypes::Key_Iv
// Generated on: Thu May 05 14:35:18 EDT 2016
// Bluespec version: 2014.07.A 2014-07-30 34078

#pragma once

#include "bsv_scemi.h"
#include "Tuple2_UInt_24_UInt_24.h"

/// C++ class representing the hardware structure SpeckTypes::Key_Iv
/// This class has been automatically generated.
class Key_Iv : public BSVType {
 public:
  Tuple2_UInt_24_UInt_24 m_iv ;
  BSVVectorT<4, BitT<24> > m_key ;

  /// A default constructor
  Key_Iv ()
    :  m_iv()
    , m_key()
  {}

  /// Constructor for object from a SceMiMessageData object
  /// @param msg -- the scemi message object
  /// @param off -- the starting bit offset, updated to next bit position
  Key_Iv ( const SceMiMessageDataInterface *msg, unsigned int &off )
    : m_iv(msg, off)
    , m_key(msg, off)
  {}

  /// Converts this object into its bit representation for sending as a SceMi message
  /// @param msg -- the message object written into
  /// @param off -- bit position off set in message
  /// @return next free bit position for writing
  unsigned int setMessageData (SceMiMessageDataInterface &msg, const unsigned int off=0) const {
    unsigned int running = off;
    running = m_iv.setMessageData( msg, running );
    running = m_key.setMessageData( msg, running );
    if (running != off + 144 ) {
      std::cerr << "Mismatch in sizes: " << std::dec <<  running << " vs " << (off + 144) << std::endl;
    }
    return running;
  }

  /// overload the put-to operator for Key_Iv
  friend std::ostream & operator<< (std::ostream &os, const Key_Iv &obj) {
    BSVType::PutTo * override = lookupPutToOverride ( obj.getClassName() );
    if ( override != 0 ) {
       return override(os, obj );
    }
    os << "{" ;
    os << "key " << obj.m_key ;os << " " ;
    os << "iv " << obj.m_iv ;os << "}" ;
    return os;
  }

  /// Adds to the stream the bit representation of this structure object
  /// @param os -- the ostream object which to append
  /// @return the ostream object
  virtual std::ostream & getBitString (std::ostream & os) const {
    m_key.getBitString (os);
    m_iv.getBitString (os);
  return os;
  }
  

  /// Accessor for the BSVType name for this object
  /// @param os -- the ostream object which to append
  /// @return the ostream object
  virtual std::ostream & getBSVType (std::ostream & os) const {
    os << "SpeckTypes::Key_Iv" ;
    return os;
  }

  /// Accessor on the size of the object in bits
  /// @return the bit size
  virtual unsigned int getBitSize () const {
    return 144;
  }

  /// returns the class name for this object
  virtual const char * getClassName() const {
    return "Key_Iv" ;
  }

  /// returns the BSVKind for this object
  virtual BSVKind getKind() const {
    return BSV_Struct ;
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
      case 0: return & m_key;
      case 1: return & m_iv;
      default: std::cerr << "Index error in getMember for class Key_Iv" << std::endl ;
    };
    return 0;
  };
  
  /// Accessor for symbolic member names
  /// @param idx -- member index
  /// @return char* to this name or null
  virtual const char * getMemberName (unsigned int idx) const {
    switch (idx) {
      case 0: return "key";
      case 1: return "iv";
      default: std::cerr << "Index error in getMemberName for class Key_Iv" << std::endl ;
    };
    return 0;
  };
  
  
};

