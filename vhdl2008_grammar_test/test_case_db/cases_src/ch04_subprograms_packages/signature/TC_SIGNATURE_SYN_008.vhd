-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature with three comma-separated type_marks: [integer, boolean, bit return bit_vector], verification of multi-type parameter list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_multi_ent is port(a:in integer; r:out boolean); end entity;
architecture bh of sig_multi_ent is
  function f_is_pos(x:integer) return boolean is
  begin return x>0; end function;
  alias a_pos is f_is_pos [integer return boolean];
begin
  r<=a_pos(a);
end architecture bh;
