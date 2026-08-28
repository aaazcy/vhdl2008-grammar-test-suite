-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature with only parameters and no return used for procedure alias: procedure alias needs only parameter type list without return, verification of signature in procedure context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_proc_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sig_proc_ent is
  procedure p_copy(signal src:in integer; signal dst:out integer) is
  begin dst<=src; end procedure;
  alias a_copy is p_copy [integer, integer];
begin
  a_copy(a,y);
end architecture bh;
