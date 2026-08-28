-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: primary_unit_declaration for data size base unit Byte
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pud_syn_data is port(dout:out integer); end entity;
architecture rtl of pud_syn_data is
  type t_mem is range 0 to 1048576 units
    Byte; KB=1024 Byte; MB=1024 KB;
  end units;
  signal s:t_mem:=1 KB;
begin
  s<=1 MB; dout<=0;
end architecture rtl;
