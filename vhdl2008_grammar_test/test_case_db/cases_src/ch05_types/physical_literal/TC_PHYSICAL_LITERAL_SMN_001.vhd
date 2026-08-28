-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Negative
-- Test Focus: Overflow in physical literal — value exceeds the range of the physical type at assignment; semantic error at elaboration
-- Expected Result: Triggers semantic error (value out of range)
-- Dependencies: None
-- =============================================================
entity phys_lit_smn1 is
  port(clk : in bit; err_flag : out bit);
end entity;
architecture bh of phys_lit_smn1 is
  type t_narrow is range 0 to 1000 units
    mV;
    V = 1000 mV;
  end units;
  -- ERROR: 999.0 V = 999000 mV which exceeds range 0 to 1000
  signal v : t_narrow := 999.0 V;
begin
  err_flag <= '0';
end architecture bh;
