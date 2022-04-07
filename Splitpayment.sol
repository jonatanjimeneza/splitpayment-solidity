// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

//Smart contract para hacer pago dividido.
contract Splitpayment{

    //Dirección del propietario
    address public owner;

    //Constructor del smart contract
    constructor(address _owner){
        owner= _owner;
    }

    //Función para enviar dinero de forma parcializada.
    function send(address payable[] memory to, uint[] memory amount) payable onlyOwner public{
        require(to.length == amount.length, "to and amount arrays must have same length ");
        for(uint i=0; i<to.length;i++){
            to[i].transfer(amount[i]);
        }
    }

    //"modificador de la función" - Solo puede enviar el dinero el propietario
    modifier onlyOwner(){
        require(msg.sender == owner, "Only owner cand send the transfer");
        _;
    }
}