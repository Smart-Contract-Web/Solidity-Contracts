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
