*** Settings ***
Resource        base.robot

*** Variables ***
${FakeCEP}


*** Keywords ***
Fakers

#FakerCEP
    ${CampoCEP}=            FakerLibrary.Numerify      text=###
    ${FakeCEP}=             Catenate     54759${CampoCEP}
    Set Test Variable                                  ${FakeCEP}

