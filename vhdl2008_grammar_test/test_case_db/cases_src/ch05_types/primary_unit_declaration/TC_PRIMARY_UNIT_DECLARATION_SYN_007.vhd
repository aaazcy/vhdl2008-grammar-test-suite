-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: primary_unit_declaration for time base unit fs
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pud_syn_time is port(dout:out integer); end entity;
architecture rtl of pud_syn_time is
  type t_time is range 0 to 1000000 units
    fs; ps=1000 fs; ns=1000 ps;
  end units;
  signal s:t_time:=1 ns;
begin
  s<=100 ps; dout<=0;
end architecture rtl;
