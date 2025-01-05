# Delegation

Delegation is one of the subjects that I like to know how to exploit using both linux and Windows.

Linux:

`impacket-rbcd` 

Windows:

https://github.com/GhostPack/Rubeus

## Unconstrained

https://www.guidepointsecurity.com/blog/delegating-like-a-boss-abusing-kerberos-delegation-in-active-directory/

Bloodhound: 

`MATCH (c:Computer {unconstraineddelegation:true}) RETURN c`

Netexec ldap has `--trusted-for-delegation`

adPEAS will also check for unconstrained delegation.

https://www.thehacker.recipes/ad/movement/kerberos/delegations/unconstrained


## RBCD

https://book.hacktricks.xyz/windows-hardening/active-directory-methodology/constrained-delegation

Meterpreter:

`auxiliary/admin/ldap/rbcd`


In powerview do 
`Get-DomainComputer -TrustedToAuth`

`Get-NetComputer -TrustedToAuth | select samaccountname,msds-allowedtodelegateto | ft`

Same with user

Look at the cn value (name of the computer) and the msds-allowedtodeledateto. 


https://www.ired.team/offensive-security-experiments/active-directory-kerberos-abuse/resource-based-constrained-delegation-ad-computer-object-take-over-and-privilged-code-execution

https://luemmelsec.github.io/S4fuckMe2selfAndUAndU2proxy-A-low-dive-into-Kerberos-delegations/


https://mayfly277.github.io/posts/GOADv2-pwning-part10/


https://www.youtube.com/watch?v=DVw9g7w4qu8&t=296s

