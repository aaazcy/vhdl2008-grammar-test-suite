-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: primary_unit_declaration for angle base unit degree
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pud_syn_angle is port(dout:out integer); end entity;
architecture rtl of pud_syn_angle is
  type t_angle is range 0 to 360 units
    deg; rad=57 deg;
  end units;
  signal s:t_angle:=90 deg;
begin
  s<=180 deg; dout<=0;
end architecture rtl;
