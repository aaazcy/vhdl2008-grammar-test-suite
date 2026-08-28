-- =============================================================
-- Case ID: TC_SIGNATURE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Negative
-- Test Focus: SNN: missing comma separator between type_marks in signature - [integer bit return boolean], missing comma causes signature parse failure
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sig_bad_ent is port(r:out integer); end entity;
architecture bh of sig_bad_ent is
  function f_cmp(x,y:integer) return boolean is begin return x>y; end function;
  -- ERROR: missing comma between type_marks in signature
  alias a_bad is f_cmp [integer boolean return boolean];
begin
  r<=0;
end architecture bh;
