-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_declaration ::= signal identifier_list : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Positive
-- Test Focus: multiple signals in identifier_list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_spc3_ent is port(r:out integer); end entity;
architecture bh of sig_spc3_ent is
  signal a,b,c,d,e,f,g,h : bit := '0';
  signal x,y,z : integer range 0 to 15 := 0;
begin
  a <= b; c <= d; e <= f; g <= h;
  x <= y; y <= z;
  r <= x + z;
end architecture bh;
