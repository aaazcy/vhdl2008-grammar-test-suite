-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Positive
-- Test Focus: Physical literals of custom physical type with multi-level unit chain — tests abstract_literal prefixes with derived units at multiple conversion levels
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_lit_custom_units is
  port(
    cap_in  : out integer;
    cap_out : out integer
  );
end entity;

architecture capacitance_test of phys_lit_custom_units is
  type t_capacitance is range 0 to 1000000 units
    fF;
    pF = 1000 fF;
    nF = 1000 pF;
    uF = 1000 nF;
  end units;
  signal c1 : t_capacitance := 100 fF;
  signal c2 : t_capacitance := 47 pF;
  signal c3 : t_capacitance := 10 nF;
  signal c4 : t_capacitance := 1 uF;
  signal total_cap : t_capacitance := 0 fF;
begin
  total_cap <= c1 + c2 + c3 + c4;
  cap_in  <= integer(c1 / fF);
  cap_out <= integer(total_cap / pF);
end architecture;
