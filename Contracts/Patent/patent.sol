pragma solidity ^0.4.24;

contract owned {
  address public owner;

 function owned() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address _newOwner) public onlyOwner {
    owner = _newOwner;
  }
}

contract StandardSertificate is owned {
    
    string public name;
    string public description;
    string public language;
    string public place;
    uint public hoursCount;
    
    mapping (address => uint) sertificates;

   function StandardSertificate (string  _name, string _description, string _language, string _place, uint _hourceCount) {
    name = _name;
    description = _description;
    language = _language;
    place = _place;
    hoursCount = _hourceCount;
   }
    
    // Выдача сертификата "EthereumPatent", "Создан для защиты авторских прав", "Русский, Английский", "BlockchainPatentWP.com", "15"
    function issue (address student) onlyOwner {
        sertificates [student] = now;
      }
      
    function issued (address student)  constant returns (uint) {
        return sertificates[student];
    }
    
}

 contract EWSertificationCenter is owned {
     
     string public name;
     string public description;
     string public place;
     
     mapping (address => bool) courses;
     
    function EWSertificationCenter (string _name, string _description, string _place) {
         
         name = _name;
         description = _description;
         place = _place;
         
     }
     
     function addCourse (address courseAddress) onlyOwner {
         courses[courseAddress] = true;
     }
     
     function deleteCourse (address courseAddress) onlyOwner {
         courses[courseAddress] = false;
     }
     
     function issueSertificate (address courseAddress, address student) onlyOwner {
         require (student != 0x0);
         require (courses [courseAddress]);
         
         StandardSertificate s = StandardSertificate(courseAddress);
         s.issue(student);
     }
     
     function checkSertificate (address courseAddress, address student) constant returns (uint) {
         require (student != 0x0);
         require (courses[courseAddress]);
         
        StandardSertificate s = StandardSertificate (courseAddress);
        return s.issued(student);
     }
 
     
     }
