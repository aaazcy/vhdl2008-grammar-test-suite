-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature used in alias declaration: alias a is gen_func [integer return integer] - verification of signature used in alias outside subprogram_instantiation context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_alias_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sig_alias_ent is
  function f_max(x,y:integer) return integer is
  begin if x>y then return x; else return y; end if; end function;
  alias a_max is f_max [integer, integer return integer];
begin
  y<=a_max(a,b);
end architecture bh;
