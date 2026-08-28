-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: subprogram_kind omitted in the end clause while keeping the designator: end f_add contains no procedure/function, only the designator, verifies subprogram_kind is an optional token
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sk_nokind_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sk_nokind_ent is
  function f_add(x,y:integer) return integer is
  begin return x+y; end f_add;
begin
  y<=f_add(a,b);
end architecture bh;
